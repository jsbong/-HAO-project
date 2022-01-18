package com.haoshop.model.product.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.haoshop.model.product.ProductVO;

@Repository
public class ProductDAO {
	@Autowired
	private SqlSessionTemplate mybatis;

	// 관리자 상품 코드 중복검사
	public int prdCheckID(ProductVO vo) {
		return mybatis.selectOne("ProductDAO.prdCheckID", vo);
	}

	// 상품 검색
	public List<ProductVO> listSearchPrd(String sPrd, int start, int end) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("sPrd", sPrd);
		map.put("start", start);
		map.put("end", end);
		return mybatis.selectList("ProductDAO.listSearchPrd", map);
	}
	
	// 검색 품목 카운트
	public int countSearchPrd(String sPrd) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("sPrd", sPrd);
		return mybatis.selectOne("ProductDAO.countSearchPrd", map);
	}

	// 상품 등록
	public void insertProduct(ProductVO vo) {
		mybatis.insert("ProductDAO.insertProduct", vo);
	}

	// 품목 리스트
	public List<ProductVO> getProductList(int start, int end, ProductVO vo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("product", vo);
		return mybatis.selectList("ProductDAO.getProductList", map);
	}
	
	// 품목 리스트
	public List<ProductVO> getProductListAll(int start, int end, ProductVO vo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("product", vo);
		return mybatis.selectList("ProductDAO.getProductListAll", map);
	}

	// 관리자 품목 리스트
	public List<ProductVO> getAdminProductList(int start, int end, ProductVO vo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("product", vo);
		return mybatis.selectList("ProductDAO.getAdminProductList", map);
	}

	// 서브 카테고리 상품 갯수 체크
	public int getCountProduct(ProductVO vo) {
		return mybatis.selectOne("ProductDAO.getCountProduct", vo);
	}
	
	// 메인 카테고리 상품 갯수 체크
		public int getCountProductAll(ProductVO vo) {
			return mybatis.selectOne("ProductDAO.getCountProductAll", vo);
		}

	// 관리자 페이지 리스트 갯수 체크
	public int getAdminCountProduct(ProductVO vo) {
		return mybatis.selectOne("ProductDAO.getAdminCountProduct", vo);
	}

	// 물품 상세보기
	public ProductVO productDetail(ProductVO vo) {
		return (ProductVO) mybatis.selectOne("ProductDAO.productDetail", vo);
	}

	public void updatePrd(ProductVO vo) {
		mybatis.update("ProductVO.updatePrd", vo);
	}
}