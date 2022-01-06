package com.haoshop.model.cart.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.haoshop.model.cart.CartService;
import com.haoshop.model.cart.CartVO;

@Service("CartService")
public class CartServiceimpl implements CartService {
	@Autowired
	private CartDAO CartDAO;
	
	public void insertProductCart(CartVO vo) {
		CartDAO.insertProductCart(vo);
	}
	
	public void deleteProductCart(CartVO vo) {
		CartDAO.deleteProductCart(vo);
	}
	
	public void deleteCart(CartVO vo) {
		CartDAO.deleteCart(vo);
	}
	
	public List<CartVO> getProductCartList(CartVO vo) {
		return CartDAO.getProductCartList(vo);
	}
}
