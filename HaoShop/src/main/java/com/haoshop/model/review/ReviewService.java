package com.haoshop.model.review;

import java.util.List;

import javax.servlet.http.HttpSession;

public interface ReviewService {
	
	void createReview(ReviewVO vo) throws Exception;					// 게시글 쓰기 
	void updateReview(ReviewVO vo) throws Exception;					// 게시글 수정
	void deleteReview(int r_no) throws Exception;						// 게시글 삭제
	int checkReview(int r_no) throws Exception;						// 게시글 삭제 체크, 숨김
	ReviewVO readReview(int r_no) throws Exception;					// 게시글 읽기
	void reviewCnt(int r_no, HttpSession session) throws Exception;	// 조회수
	ReviewVO previousB(int r_no) throws Exception;					// 이전글
	ReviewVO nextB(int r_no) throws Exception;						// 다음글
	List<ReviewVO> listAllReview(String searchOption,String keyword,int start, int end) throws Exception;	// 게시글 목록
	int getCountReview(String searchOption,String keyword) throws Exception;	// 게시글 갯수
	
}
