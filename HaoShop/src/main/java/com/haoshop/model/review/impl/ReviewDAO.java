package com.haoshop.model.review.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.haoshop.model.review.ReviewVO;

@Repository
public class ReviewDAO {
	@Autowired
	private SqlSessionTemplate mybatis;

	
	// 게시글 쓰기
	public void createReview(ReviewVO vo) {
		mybatis.insert("ReviewDAO.createReview", vo);
	}

	// 게시글 수정
	public void updateReview(ReviewVO vo) {
		mybatis.update("ReviewDAO.updateReview", vo);
	}

	// 게시글 삭제
	public void deleteReview(int r_no) {
		mybatis.update("ReviewDAO.deleteReview", r_no);
	}
	
	// 게시글 삭제 체크
	public int checkReview(int r_no) throws Exception {
		return mybatis.selectOne("ReviewDAO.checkReview", r_no);
	}

	// 게시글 읽기
	public ReviewVO readReview(int r_no) {
		return (ReviewVO) mybatis.selectOne("ReviewDAO.readReview", r_no);
	}
	
	// 이전글
	public ReviewVO previousB(int r_no) {
		return (ReviewVO) mybatis.selectOne("ReviewDAO.previousB", r_no);
	}

	// 다음글
	public ReviewVO nextB(int r_no) {
		return (ReviewVO) mybatis.selectOne("ReviewDAO.nextB", r_no);
	}
	
	// 게시물 목록
	public List<ReviewVO> listAllReview(String searchOption, String keyword, int start, int end) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("start", start);
		map.put("end", end);
		return mybatis.selectList("ReviewDAO.listAllReview", map);
	}

	// 조회수
	public void reviewCnt(int r_no) {
		mybatis.update("ReviewDAO.reviewCnt", r_no);
	}

	// 게시글 갯수
	public int getCountReview(String searchOption, String keyword) throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		return mybatis.selectOne("ReviewDAO.getCountReview", map);
	}

}
