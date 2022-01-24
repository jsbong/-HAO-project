package com.haoshop.model.board;

import java.sql.Date;

public class BoardVO {
	private int b_no;					// 게시글 번호(기본 키)
	private int m_no;					// 멤버 번호 (외래 키)
	private String b_title;				// 게시글 제목
	private String b_content;			// 게시글 내용			
	private String m_id;				// 작성자 id
	private Date b_regdate;				// java.util.Date
	private int b_viewcnt;				// (추가)조회수
	private String name;				// (추가)작성자 이름
	private int cnt;					// (추가)댓글 갯수
	
	// board_comment
	private int bc_no; 
	private String bc_content;
	private Date bc_regdate;

	public int getB_no() {
		return b_no;
	}
	public void setB_no(int b_no) {
		this.b_no = b_no;
	}
	public int getM_no() {
		return m_no;
	}
	public void setM_no(int m_no) {
		this.m_no = m_no;
	}
	public String getB_title() {
		return b_title;
	}
	public void setB_title(String b_title) {
		this.b_title = b_title;
	}
	public String getB_content() {
		return b_content;
	}
	public void setB_content(String b_content) {
		this.b_content = b_content;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public Date getB_regdate() {
		return b_regdate;
	}
	public void setB_regdate(Date b_regdate) {
		this.b_regdate = b_regdate;
	}
	public int getB_viewcnt() {
		return b_viewcnt;
	}
	public void setB_viewcnt(int b_viewcnt) {
		this.b_viewcnt = b_viewcnt;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	
	
	// Board_comment
	public int getBc_no() {
		return bc_no;
	}
	public void setBc_no(int bc_no) {
		this.bc_no = bc_no;
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
		

}