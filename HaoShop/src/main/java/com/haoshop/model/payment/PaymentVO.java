package com.haoshop.model.payment;

import java.util.Date;

public class PaymentVO {
	private int pay_no;
	private int m_no;
	private int p_no;//
	private int pay_quantity;
	private String m_addr;
	private String m_phone;
	private int pay_price;
	private String pay_method;
	private String pay_creditcard;
	private String pay_state;
	private Date pay_regdate;
	private String p_img;
	
	private String p_size;

	public int getPay_no() {
		return pay_no;
	}

	public void setPay_no(int pay_no) {
		this.pay_no = pay_no;
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

	public String getM_addr() {
		return m_addr;
	}

	public void setM_addr(String m_addr) {
		this.m_addr = m_addr;
	}

	public String getM_phone() {
		return m_phone;
	}

	public void setM_phone(String m_phone) {
		this.m_phone = m_phone;
	}

	public int getPay_price() {
		return pay_price;
	}

	public void setPay_price(int pay_price) {
		this.pay_price = pay_price;
	}

	public String getPay_method() {
		return pay_method;
	}

	public void setPay_method(String pay_method) {
		this.pay_method = pay_method;
	}

	public String getPay_creditcard() {
		return pay_creditcard;
	}

	public void setPay_creditcard(String pay_creditcard) {
		this.pay_creditcard = pay_creditcard;
	}

	public String getPay_state() {
		return pay_state;
	}

	public void setPay_state(String pay_state) {
		this.pay_state = pay_state;
	}

	public Date getPay_regdate() {
		return pay_regdate;
	}

	public void setPay_regdate(Date pay_regdate) {
		this.pay_regdate = pay_regdate;
	}

	public String getP_size() {
		return p_size;
	}

	public void setP_size(String p_size) {
		this.p_size = p_size;
	}

}
