package com.haoshop.model.product.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.haoshop.model.product.ProductService;
import com.haoshop.model.product.ProductVO;

@Service("productService")
public class ProductServiceImpl implements ProductService {
	@Autowired
	private ProductDAO productDAO;

	// 관리자
	public int prdCheckID(ProductVO vo) {
		return productDAO.prdCheckID(vo);
	}

	// 물품 검색
	public List<ProductVO> listSearchPrd(String sPrd, int start, int end) {
		return productDAO.listSearchPrd(sPrd, start, end);
	}

	// 물품 검색 카운트
	public int countSearchPrd(String sPrd) {
		return productDAO.countSearchPrd(sPrd);
	}

	public void insertProduct(ProductVO vo) {
		productDAO.insertProduct(vo);
	}

	// 품목 리스트
	public List<ProductVO> getProductList(int start, int end, ProductVO vo) {
		return productDAO.getProductList(start, end, vo);
	}

	// 관리자 품목 리스트
	public List<ProductVO> getAdminProductList(int start, int end, ProductVO vo) {
		return productDAO.getAdminProductList(start, end, vo);
	}

	// 품목 갯수 카운트
	public int getCountProduct(ProductVO vo) {
		return productDAO.getCountProduct(vo);
	}

	// 관리자 품목 갯수 카운트
	public int getAdminCountProduct(ProductVO vo) {
		return productDAO.getAdminCountProduct(vo);
	}

	// 품목 상세보기
	public ProductVO productDetail(ProductVO vo) {
		return productDAO.productDetail(vo);
	}
}