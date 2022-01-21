package com.haoshop.model.board;

import java.sql.Date;

public class Board_CommentVO {
	private int bc_no;
	private int b_no;
	private String m_id;
	private String bc_content;
	private Date bc_regdate;
	
	public int getBc_no() {
		return bc_no;
	}
	public void setBc_no(int bc_no) {
		this.bc_no = bc_no;
	}
	public int getB_no() {
		return b_no;
	}
	public void setB_no(int b_no) {
		this.b_no = b_no;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getBc_content() {
		return bc_content;
	}
	public void setBc_content(String bc_content) {
		this.bc_content = bc_content;
	}
	public Date getBc_regdate() {
		return bc_regdate;
	}
	public void setBc_regdate(Date bc_regdate) {
		this.bc_regdate = bc_regdate;
	}
	
	@Override
	public String toString() {
		return "Board_CommentVO [bc_no=" + bc_no + ", b_no=" + b_no + ", m_id=" + m_id + ", bc_content=" + bc_content
				+ ", bc_regdate=" + bc_regdate + "]";
	}
	
	
	}