package com.multi.liveAlone.share.chatRoomShare;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.multi.liveAlone.MemberDAO;
import com.multi.liveAlone.MemberVO;
import com.multi.liveAlone.share.bbsShare.BbsShareDAO;
import com.multi.liveAlone.share.bbsShare.BbsShareVO;
import com.multi.liveAlone.share.messageShare.MessageShareVO;

@Controller
public class ChatRoomShareController {

	@Autowired
	ChatRoomShareDAO dao;
	
	@Autowired
	BbsShareDAO b_dao;
	
	@Autowired
	MemberDAO m_dao;
	
	// 채팅방 insert 동시에 채팅방 페이지(채팅이 이루어지는 공간)로 이동 + roomInfo(roomNo, chatRequestor) 데이터 보내기
	@RequestMapping("share/chatShare/chatRoom")
	public void insert(ChatRoomShareVO bag, Model model) {
		
		ChatRoomShareVO roomInfo;
		List<MessageShareVO> list;
		
		// 게시글 작성자가 아닌 회원이 채팅요청을 했을 때
		if (bag.getroomNo() == 0) {
			// 만들어진 채팅방의 roomNo, chatRequestor 가져와서 views의 chatRoom.jsp에 전달
			roomInfo = dao.one(bag);
//			System.out.println(roomInfo);
			
			// db에 채팅방이 없으면 채팅방생성s
			if (roomInfo == null) {
				System.out.println(bag);
				dao.insert(bag); // 채팅방 생성 -> db삽입
				
				roomInfo = dao.one(bag);
//				System.out.println(roomInfo2.getroomNo());
//				System.out.println(roomInfo2.getChatRequestor());
				model.addAttribute("roomInfo", roomInfo);
			}
			
			// db에 채팅방이 이미 있으면 채팅방생성x
			else {
				model.addAttribute("roomInfo", roomInfo);
			}
		}
		// 게시글 작성자가 게시글채팅목록에서 채팅방에 들어갈 때
		else {
			roomInfo = dao.one_roomNo(bag);
			model.addAttribute("roomInfo", roomInfo);
		}
		
		list = dao.messageList(roomInfo.getroomNo());
		model.addAttribute("list", list);
	}
	
	// 모든 채팅방 목록
	@RequestMapping("mypage/userChatList")
	public void userChatList(String nowSession, Model model) {
		List<ChatRoomBbsJoinVO> list = dao.userChatList(nowSession);
		model.addAttribute("list", list);
	}
	
	// 게시물 채팅방 목록
	@RequestMapping("share/chatShare/bbsChatList")
	public void bbschatlist(int bbsNo, Model model) {
		List<ChatRoomShareVO> list = dao.bbschatlist(bbsNo);
		
		model.addAttribute("list", list);
	}
	
	@RequestMapping("share/chatShare/codeCheck")
	@ResponseBody
	public int codeCheck(String requestor, String receiver, String nowSession, ChatRoomShareVO bag) {
		ChatRoomShareVO bag2 = dao.one_roomNo(bag);
		int chatcode = bag2.getChatCode();
		int trade = 1; // 게시글 포인트와 유저의 포인트 비교 -> 포인트 이동 = 1 / 포인트 이동x = 0
		
		BbsShareVO bbs_vo = b_dao.one(bag2.getBbsNo()+"");
		MemberVO requestor_member_vo = m_dao.login(requestor);
		MemberVO receiver_member_vo = m_dao.login(receiver);
		int bbsPoint = bbs_vo.getBbsSharePoint(); // 게시글 포인트
		int requestor_point = requestor_member_vo.getPoint(); // 채팅 요청자 포인트
		int receiver_point = receiver_member_vo.getPoint(); // 글 작성자 포인트
		boolean type = bbs_vo.isBbsShareRequest(); // 요청 - false(0) / 나눔 - true(1)
		
		// 채팅요청자가 처음으로 거래완료 버튼을 누른 경우
		if (chatcode == 0 && nowSession.equals(requestor)) { 
			if (type) { // 나눔글인 경우
				// 나눔글에서 채팅요청자는 포인트를 주는 입장이기에 게시글에서 요구하는 포인트보다 많은 포인트를 보유하고 있어야 함!
				if(requestor_point < bbsPoint) {
					trade = 0;
				} else {
					bag2.setChatCode(1); // requestor가 누른 경우를 1로 설정
					dao.codeUpdate(bag2);
				}
			} 
			else { 
				// 나눔글이 아닌 경우(=요청글의 경우) 채팅요청자는 포인트를 받는 입장이기에 포인트비교 필요 x
				bag2.setChatCode(1); // requestor가 누른 경우를 1로 설정
				dao.codeUpdate(bag2);
			}
		}
		
		// 게시글 작성자가 처음으로 거래완료 버튼을 누른 경우
		else if (chatcode == 0 && nowSession.equals(receiver)) { 
			if (type) { // 나눔글인 경우
				// 게시글 작성자가 나눔글을 올린 경우 포인트를 받는 입장이기에 포인트비교 필요x
				bag2.setChatCode(2); // receiver가 누른 경우를 2로 설정
				dao.codeUpdate(bag2);
			} 
			else { 
				// 게시글 작성자가 요청글을 올린 경우 포인트를 주는 입장이기에 포인트비교 필요o
				if(receiver_point < bbsPoint) {
					trade = 0;
				} else {
					bag2.setChatCode(2); // receiver가 누른 경우를 2로 설정
					dao.codeUpdate(bag2);
				}
			}
		}
		
		// 다른 유저가 거래완료 버튼을 누른 상태고, 본 유저가 거래완료 버튼을 누를 때 = 둘 다 거래완료 버튼을 눌렀을 때
		else if ((chatcode == 1 && nowSession.equals(receiver)) || (chatcode == 2 && nowSession.equals(requestor))) {
			
			if (type) {
				// 나눔글인 경우
				receiver_point = receiver_point + bbsPoint;
				requestor_point = requestor_point - bbsPoint;
				if (requestor_point < 0) {
					trade = 0; // 0이 jsp파일에 반환되면 alert("포인트가 부족합니다!") 출력
				}
				else {
					bag2.setChatCode(3); // 둘 다 누른 경우 3으로 설정
					// 게시글 거래완료 여부 업데이트
					b_dao.success(bag2.getBbsNo()+"");
					dao.codeUpdate(bag2);
					receiver_member_vo.setPoint(receiver_point);
					requestor_member_vo.setPoint(requestor_point);
					m_dao.updatePoint(requestor_member_vo);
					m_dao.updatePoint(receiver_member_vo);
				}
			} else {
				// 요청글인 경우
				requestor_point = requestor_point + bbsPoint;
				receiver_point = receiver_point - bbsPoint;
				if (receiver_point < 0) {
					trade = 0;
				}
				else {
					bag2.setChatCode(3); // 둘 다 누른 경우 3으로 설정
					// 게시글 거래완료 여부 업데이트
					b_dao.success(bag2.getBbsNo()+"");
					dao.codeUpdate(bag2);
					receiver_member_vo.setPoint(receiver_point);
					requestor_member_vo.setPoint(requestor_point);
					m_dao.updatePoint(requestor_member_vo);
					m_dao.updatePoint(receiver_member_vo);
				}
			}
		}
		
		return trade;
	}
}
