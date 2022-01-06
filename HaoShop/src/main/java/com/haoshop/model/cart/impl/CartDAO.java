package com.haoshop.model.cart.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.haoshop.model.cart.CartVO;

@Repository
public class CartDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	// 장바구니 등록
	public void insertProductCart(CartVO vo) {
		mybatis.insert("CartDAO.insertProductCart", vo);
	}
	
	// 장바구니 전체 삭제
	public void deleteProductCart(CartVO vo) {
		mybatis.delete("CartDAO.deleteProductCart", vo);
	}
	
	// 장바구니 상품 삭제
	public void deleteCart(CartVO vo) {
		mybatis.delete("CartDAO.deleteCart", vo);
	}
	
	// 장바구니 리스트 출력
	public List<CartVO> getProductCartList(CartVO vo) {
		return mybatis.selectList("CartDAO.productCart", vo);
	}
}