package com.haoshop.model.journal;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class JournalVO {
	private int jour_no;
	private int m_no;
	private String jour_name;
	private String jour_img;
	private String jour_explain;
	private Date jour_regdate;
	private MultipartFile uploadFile; // 이미지파일

	public int getJour_no() {
		return jour_no;
	}
	public void setJour_no(int jour_no) {
		this.jour_no = jour_no;
	}
	public int getM_no() {
		return m_no;
	}
	public void setM_no(int m_no) {
		this.m_no = m_no;
	}
	public String getJour_name() {
		return jour_name;
	}
	public void setJour_name(String jour_name) {
		this.jour_name = jour_name;
	}
	public String getJour_img() {
		return jour_img;
	}
	public void setJour_img(String jour_img) {
		this.jour_img = jour_img;
	}
	public String getJour_explain() {
		return jour_explain;
	}
	public void setJour_explain(String jour_explain) {
		this.jour_explain = jour_explain;
	}
	public Date getJour_regdate() {
		return jour_regdate;
	}
	public void setJour_regdate(Date jour_regdate) {
		this.jour_regdate = jour_regdate;
	}
	public MultipartFile getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}
	
	@Override
	public String toString() {
		return "JournalVO [jour_no=" + jour_no + ", m_no=" + m_no + ", jour_name=" + jour_name + ", jour_img="
				+ jour_img + ", jour_explain=" + jour_explain + ", jour_regdate=" + jour_regdate + ", uploadFile="
				+ uploadFile + "]";
	}

	
}
