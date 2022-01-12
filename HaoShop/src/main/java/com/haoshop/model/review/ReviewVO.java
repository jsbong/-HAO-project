package com.haoshop.model.review;

import java.sql.Date;

public class ReviewVO {
	private int r_no;					// 게시글 번호(기본 키)
	private String p_name;					// 상품 이름
	private int m_no;					// 멤버 번호 (외래 키)
	private String r_title;				// 게시글 제목
	private String r_content;			// 게시글 내용			
	private String m_id;				// 작성자 id
	private Date r_regdate;				// java.util.Date
	private int reviewcnt;				// (추가)조회수
	private String name;				// (추가)작성자 이름
	private int cnt;					// (추가)댓글 갯수
	
	public int getR_no() {
		return r_no;
	}
	public void setR_no(int r_no) {
		this.r_no = r_no;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public int getM_no() {
		return m_no;
	}
	public void setM_no(int m_no) {
		this.m_no = m_no;
	}
	public String getR_title() {
		return r_title;
	}
	public void setR_title(String r_title) {
		this.r_title = r_title;
	}
	public String getR_content() {
		return r_content;
	}
	public void setR_content(String r_content) {
		this.r_content = r_content;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public Date getR_regdate() {
		return r_regdate;
	}
	public void setR_regdate(Date r_regdate) {
		this.r_regdate = r_regdate;
	}
	public int getReviewcnt() {
		return reviewcnt;
	}
	public void setReviewcnt(int reviewcnt) {
		this.reviewcnt = reviewcnt;
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
	
	@Override
	public String toString() {
		return "ReviewVO [r_no=" + r_no + ", p_name=" + p_name + ", m_no=" + m_no + ", r_title=" + r_title
				+ ", r_content=" + r_content + ", m_id=" + m_id + ", r_regdate=" + r_regdate + ", reviewcnt="
				+ reviewcnt + ", name=" + name + ", cnt=" + cnt + "]";
	}
	
}