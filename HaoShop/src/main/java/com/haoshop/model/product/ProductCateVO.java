package com.haoshop.model.product;

public class ProductCateVO {
	private int cate_no; 		// 카테고리 번호
	private String main_name; 	// 메인 카테고리
	private String sub_name; 	// 서브 카테고리

	public int getCate_no() {
		return cate_no;
	}

	public void setCate_no(int cate_no) {
		this.cate_no = cate_no;
	}

	public String getMain_name() {
		return main_name;
	}

	public void setMain_name(String main_name) {
		this.main_name = main_name;
	}

	public String getSub_name() {
		return sub_name;
	}

	public void setSub_name(String sub_name) {
		this.sub_name = sub_name;
	}

}
