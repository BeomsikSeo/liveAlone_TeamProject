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
import com.multi.liveAlone.rice.food.FoodDAO;
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
	MemberDAO memberDAO;
	
	// 음식 DAO
	@Autowired
	FoodDAO foodDAO;

	
	// 음식점의 메뉴를 보여줍니다.
	@RequestMapping("menuOrder")
	public void menuOrder(HttpSession session,Model model /*, StoreVO store*/) {
		/*
		 * List<FoodVO> foodList = foodDAO.selectAll(store.getStore_no());
		 * StroreVO store2 = storeDAO.selectOne(store.getStore_no();
 		 */
		
		
		// 임의의 데이터 시작
		session.setAttribute("memberID", "userA");
		
		StoreVO store = new StoreVO();
		store.setStore_no(1);
		store.setStore_name("맘스날드");
		store.setStore_addr("강남구");
		
		List<FoodVO> foodList = foodDAO.showMenu(store.getStore_no());
		// 여기까지가 임의의 데이터 입니다.
		
		
		/*
		 * 1. 가게 정보
		 * 2. 해당 가게가 제공하는 메뉴 정보
		 */
		model.addAttribute("store",store);
		model.addAttribute("list", foodList);
	}

	
	
	// 사용자가 주문한 메뉴들을 결제 확인창에 보내주기 위한 controller
	@RequestMapping("menuPay")
	public void checkMenu(HttpSession session, Model model, OrderVOList list, StoreVO store) {
		
		// 선택한 메뉴들의 순수 총 가격 변수
		int totalPrice = 0;	
		
		// 마일리지 정보를 갖고오기 위해  사용자의 정보를 가지고 옵니다.
		String memberID = (String)session.getAttribute("memberID");
		MemberVO member = memberDAO.selectOne(memberID);
		
		
		// 사용자가 선택한 가게에서 선택한 메뉴의 종류와 수량을 선별합니다.
		List<OrderVO> orderList = new ArrayList<OrderVO>();
		for(int i = 0; i < list.getList().size(); i++) {
			
			// 음식점이 제공하는 메뉴들을 전부 가져와서
			// 주문한 메뉴듦만 따로 List에 추가합니다.
			if(list.getList().get(i).getOrder_fCount() != 0) {
				orderList.add( list.getList().get(i) );
				
				// 메뉴들의 총 가격을 넣습니다.
				totalPrice += (list.getList().get(i).getOrder_fCount() * list.getList().get(i).getOrder_fPrice());
			}
		}
										
		
		/*
		 * 	1. 마일리지 사용을 위한 멤버 정보
		 *  2. 무엇을 주문했는지 확인하기 위한 주문 정보
		 *  3. 주문한 가격의 총 가격을 알려주기 위한 가격 정보
		 *  4. 데이터베이스에 특정 가게 정보를 저장하기 위한 가게 정보
		 */
		model.addAttribute("memberInfo", member);
		model.addAttribute("orderList",orderList);
		model.addAttribute("totalPrice",totalPrice);
		model.addAttribute("store", store);
	}
}
