package com.multi.liveAlone.rice.order;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.multi.liveAlone.MemberDAO;
import com.multi.liveAlone.MemberVO;
import com.multi.liveAlone.rice.food.FoodVO;
import com.multi.liveAlone.rice.store.StoreDAO;
import com.multi.liveAlone.rice.store.StoreVO;

//사용자가 메뉴를 주문하는데 필요한 Controller
@Controller
@RequestMapping("rice/order")
public class OrderController {

	@Autowired
	StoreDAO storeDAO;
	
	// 멤버 DAO
	@Autowired
	MemberDAO daoMember;
	
	// 주문 DAO
	@Autowired
	OrderDAO dao;

	// 음식점의 메뉴를 보여줍니다.
	@RequestMapping("orderMenu")
	public void showStoreMenu(HttpSession session,Model model /*, StoreVO store*/) {
		
		
		/*
		 * List<FoodVO> foodList = dao.selectAllMenu(store.getStore_no());
 		 */
		
		
		/*
		 * 임의의 데이터 사용중
		 */
		session.setAttribute("memberID", "userA");
		
		StoreVO store = new StoreVO();
		store.setStore_no(1);
		store.setStore_name("맘스날드");
		store.setStore_addr("강남구");
		
		List<FoodVO> list = dao.showMenu(store.getStore_no());
		
		
		/*
		 * 메뉴 리스트와 가게 정보를 넘깁니다.
		 */
		model.addAttribute("store",store);
		model.addAttribute("list", list);
	}

	
	
	// 사용자가 주문한 메뉴들을 결제 확인창에 보내주기 위한 controller
	@RequestMapping("payMenu")
	public void checkMenu(HttpSession session, Model model, OrderVOList list, StoreVO store) {
		
		int totalPrice = 0;	
		
		
		// 마일리지 정보를 갖고오기 위해  사용자의 정보를 가지고 옵니다.
		String memberID = (String)session.getAttribute("memberID");
		MemberVO member = daoMember.selectOne(memberID);
		
		
		
		// 사용자가 선택한 가게에서 선택한 메뉴의 종류와 수량을 선별합니다.
		List<OrderVO> orderList = new ArrayList<OrderVO>();
		for(int i = 0; i < list.getList().size(); i++) {
			if(list.getList().get(i).getOrder_fCount() != 0) {
				orderList.add( list.getList().get(i) );
				totalPrice += (list.getList().get(i).getOrder_fCount() * list.getList().get(i).getOrder_fPrice());
			}
		}
										
		
		// 멤버 정보 ( 보유 마일리지 확인 )
		model.addAttribute("memberInfo", member);
		
		// 주문 정보 ( 주문한 메뉴들의 개별 가격, 이름과 모두 합한 값을 확인 )
		model.addAttribute("orderList",orderList);
		model.addAttribute("totalPrice",totalPrice);
		
		// 가게 정보
		model.addAttribute("store",store);
	}
}
