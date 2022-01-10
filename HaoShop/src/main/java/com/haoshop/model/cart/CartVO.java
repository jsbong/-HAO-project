package com.haoshop.model.cart;

import java.util.Date;

public class CartVO {
	private int c_no;
	private int m_no;
	private int p_no;
	private int pay_quantity;
	private Date cart_created;

	private String p_name;
	private int p_price;
	private String p_img;
	private String p_color;
	private String p_size;
	private int p_sum;

	public int getC_no() {
		return c_no;
	}

	public void setC_no(int c_no) {
		this.c_no = c_no;
	}

	public int getM_no() {
		return m_no;
	}

	public void setM_no(int m_no) {
		this.m_no = m_no;
	}

	public int getP_no() {
		return p_no;
	}

	public void setP_no(int p_no) {
		this.p_no = p_no;
	}

	public int getPay_quantity() {
		return pay_quantity;
	}

	public void setPay_quantity(int pay_quantity) {
		this.pay_quantity = pay_quantity;
	}

	public Date getCart_created() {
		return cart_created;
	}

	public void setCart_created(Date cart_created) {
		this.cart_created = cart_created;
	}

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public int getP_price() {
		return p_price;
	}

	public void setP_price(int p_price) {
		this.p_price = p_price;
	}

	public String getP_img() {
		return p_img;
	}

	public void setP_img(String p_img) {
		this.p_img = p_img;
	}

	public int getP_sum() {
		return p_sum;
	}

	public void setP_sum(int pay_quantity, int p_price) {
		this.p_sum = pay_quantity * p_price;
	}

	public String getP_color() {
		return p_color;
	}

	public void setP_color(String p_color) {
		this.p_color = p_color;
	}

	public String getP_size() {
		return p_size;
	}

	public void setP_size(String p_size) {
		this.p_size = p_size;
	}

}
