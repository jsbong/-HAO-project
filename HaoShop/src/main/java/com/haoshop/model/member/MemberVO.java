package com.haoshop.model.member;

import java.sql.Date;

public class MemberVO {
	private int m_no; // 회원 고유코드
	private String m_id; // 회원 아이디
	private String m_pwd; // 회원 비밀번호
	private String m_email; // 회원 이메일
	private String m_name; // 회원 이름
	private Date m_birth; // 회원 생년월일
	private String m_phone; // 회원 연락처
	private String m_addr; // 회원 주소
	private Date m_regdate; // 회원 가입일
	private String authkey;
	private int authstatus;

	public int getM_no() {
		return m_no;
	}

	public void setM_no(int m_no) {
		this.m_no = m_no;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getM_pwd() {
		return m_pwd;
	}

	public void setM_pwd(String m_pwd) {
		this.m_pwd = m_pwd;
	}

	public String getM_email() {
		return m_email;
	}

	public void setM_email(String m_email) {
		this.m_email = m_email;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public Date getM_birth() {
		return m_birth;
	}

	public void setM_birth(Date m_birth) {
		this.m_birth = m_birth;
	}

	public String getM_phone() {
		return m_phone;
	}

	public void setM_phone(String m_phone) {
		this.m_phone = m_phone;
	}

	public String getM_addr() {
		return m_addr;
	}

	public void setM_addr(String m_addr) {
		this.m_addr = m_addr;
	}

	public Date getM_regdate() {
		return m_regdate;
	}

	public void setM_regdate(Date m_regdate) {
		this.m_regdate = m_regdate;
	}

	public String getAuthkey() {
		return authkey;
	}

	public void setAuthkey(String authkey) {
		this.authkey = authkey;
	}

	public int getAuthstatus() {
		return authstatus;
	}

	public void setAuthstatus(int i) {
		this.authstatus = i;
	}

}
