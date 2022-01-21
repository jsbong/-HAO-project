package com.haoshop.controller.payment;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.haoshop.home.Pager;
import com.haoshop.model.cart.CartService;
import com.haoshop.model.cart.CartVO;
import com.haoshop.model.member.MemberVO;
import com.haoshop.model.payment.PaymentService;
import com.haoshop.model.payment.PaymentVO;
import com.haoshop.model.product.ProductVO;

@Controller
public class PaymentController {
	@Autowired
	private CartService CartService;
	@Autowired
	private PaymentService paymentService;
	
		// 	관리자-주문 상태 수정 처리
		@RequestMapping(value = "/paystate", method = RequestMethod.POST)
		public void changeState(PaymentVO vo) {
			paymentService.updateState(vo);
		}
		
		@RequestMapping("/deliver")
		public String getPatmentpage(@RequestParam(defaultValue = "1") int curPage,
				@RequestParam(defaultValue = "") String sPrd , Model model) { 
			int count = paymentService.getCountOrderAll(sPrd);
			Pager pager = new Pager(count, curPage); // (레코드 개수, 현재 페이지 번호(default = 1) )
			int start = pager.getPageBegin(); //  
			int end = pager.getPageEnd(); // 
			
			List<PaymentVO> list = paymentService.getOrderListAll(sPrd, start, end);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("list", list);
			map.put("count", count);
			map.put("pager", pager);
			map.put("sPrd", sPrd);
			model.addAttribute("map", map);
			return "admin/deliver";
		}
		
		// 결제
		@RequestMapping(value="/payment", method=RequestMethod.GET)
		public String paymentView(CartVO vo) {
			return "member/payment";
		}

		@RequestMapping(value="/payment", method=RequestMethod.POST)
		public String payment(@RequestParam(value="hiddenbtn") String hidden,
				@RequestParam(value="c_no0[]") int[] c_no0, PaymentVO vo, HttpSession session, Model model) {
			if (hidden.equals("prdpage")) {
				List<PaymentVO> list = paymentService.getPaymentProduct(vo);
				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("list", list);
				map.put("hidden", hidden);
				map.put("p_size", vo.getP_size());
				map.put("pay_quantity", vo.getPay_quantity());
//				model.addAttribute("map", map);
				session.setAttribute("map", map);
			} else if (hidden.equals("cartpage")) {
				vo.setC_no(c_no0[0]);
				List<PaymentVO> list = paymentService.cartPaymentProduct(vo);
				for(int k = 1; k<c_no0.length; k++) {
					System.out.println(c_no0[k]);
					vo.setC_no(c_no0[k]);
					list.add(paymentService.cartPaymentProduct(vo).get(0));
				}
				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("list", list);
				map.put("hidden", hidden);
//				model.addAttribute("map", map);
				session.setAttribute("map", map);
			}
			return "member/payment";
		}
}
