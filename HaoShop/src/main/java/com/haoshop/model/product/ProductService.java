package com.haoshop.model.product;

import java.util.List;

public interface ProductService {

	// 관리자 체크
	int prdCheckID(ProductVO vo);

	// 물품 검색
	List<ProductVO> listSearchPrd(String sPrd, int start, int end);

	int countSearchPrd(String sPrd);

	// 물품 등록
	void insertProduct(ProductVO vo);

	// 물품 리스트
	List<ProductVO> getProductList(int start, int end, ProductVO vo);
	
	List<ProductVO> getProductListAll(int start, int end, ProductVO vo);

	List<ProductVO> getAdminProductList(int start, int end, ProductVO vo);

	int getCountProduct(ProductVO vo);
	
	int getCountProductAll(ProductVO vo);

	int getAdminCountProduct(ProductVO vo);

	ProductVO productDetail(ProductVO vo);
	
	// 물품 상태 변경
	void updatePrd(ProductVO vo);

	void deletePrd(ProductVO vo);
}