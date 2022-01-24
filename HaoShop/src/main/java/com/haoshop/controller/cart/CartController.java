package com.haoshop.controller.cart;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.haoshop.model.cart.CartService;
import com.haoshop.model.cart.CartVO;
import com.haoshop.model.payment.PaymentService;
import com.haoshop.model.payment.PaymentVO;

@Controller
public class CartController {
	@Autowired
	private CartService CartService;
	@Autowired
	private PaymentService paymentService;

	// 장바구니 담기
	@RequestMapping("/insertCart")
	public String insertCart(CartVO vo) {
		CartService.insertProductCart(vo);
		return "product/category";
	}
	
	// 결제목록 갱신
	@RequestMapping(value="/decopay")
	public String insertPayment(String[] prd_list, PaymentVO vo) {
		for(int i = 0; i < prd_list.length; i += 3) {
			vo.setP_no(Integer.parseInt(prd_list[i]));
			String pay_price = prd_list[i+1].replace(",", "");
			vo.setPay_price(Integer.parseInt(pay_price));
			vo.setPay_quantity(Integer.parseInt(prd_list[i+2]));
			
			paymentService.insertPayment(vo);
			paymentService.deleteCartPayment(vo);
		}
		return "main";
	}
	
	// 장바구니 전체 비우기
	@RequestMapping("/clearCart")
	public String deleteProductCart(CartVO vo) {
		CartService.deleteProductCart(vo);
		return "member/cart";
	}
	
	// 장바구니 물품 삭제
	@RequestMapping("/delCart")
	public String deleteCart(CartVO vo) {
		CartService.deleteCart(vo);
		return "member/cart";
	}

	// 장바구니
	@RequestMapping("/productCart")
	public String cartList(CartVO vo, Model model) {
		model.addAttribute("cartPrd", CartService.getProductCartList(vo));
		return "member/cart";
	}
}