package com.haoshop.model.cart;

import java.util.List;

public interface CartService {
	void insertProductCart(CartVO vo);	// 장바구니 물품 추가
	void deleteProductCart(CartVO vo);	// 장바구니 전체 비우기
	void deleteCart(CartVO vo);			// 장바구니 물품 삭제
	List<CartVO> getProductCartList(CartVO vo);	// 장바구니 리스트 출력
}