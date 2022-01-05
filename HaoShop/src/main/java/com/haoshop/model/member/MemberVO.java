package com.haoshop.model.member;

import java.sql.Date;

public class MemberVO {
	private int m_id; // 회원 고유코드
	private String m_email; // 회원 아이디
	private String m_pwd; // 회원 이름
	private String m_name; // 회원 비밀번호
	private Date m_date; // 회원 생년월일
	private String m_phone; // 회원 가입날짜
	private String m_zipcode; // 회원 연락처
	private String m_faddr;
	private String m_laddr;
	
	public int getM_id() {
		return m_id;
	}
	public void setM_id(int m_id) {
		this.m_id = m_id;
	}
	public String getM_email() {
		return m_email;
	}
	public void setM_email(String m_email) {
		this.m_email = m_email;
	}
	public String getM_pwd() {
		return m_pwd;
	}
	public void setM_pwd(String m_pwd) {
		this.m_pwd = m_pwd;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public Date getM_date() {
		return m_date;
	}
	public void setM_date(Date m_date) {
		this.m_date = m_date;
	}
	public String getM_phone() {
		return m_phone;
	}
	public void setM_phone(String m_phone) {
		this.m_phone = m_phone;
	}
	public String getM_zipcode() {
		return m_zipcode;
	}
	public void setM_zipcode(String m_zipcode) {
		this.m_zipcode = m_zipcode;
	}
	public String getM_faddr() {
		return m_faddr;
	}
	public void setM_faddr(String m_faddr) {
		this.m_faddr = m_faddr;
	}
	public String getM_laddr() {
		return m_laddr;
	}
	public void setM_laddr(String m_laddr) {
		this.m_laddr = m_laddr;
	}
	@Override
	public String toString() {
		return "MemberVO [m_email=" + m_email + ", m_name=" + m_name + "]";
	}

}
