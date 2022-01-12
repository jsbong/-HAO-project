package com.haoshop.model.review.impl;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.haoshop.model.review.ReviewService;
import com.haoshop.model.review.ReviewVO;

@Service("ReviewService")
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	private ReviewDAO reviewDAO;
	
	
	// 게시글 쓰기
	public void createReview(ReviewVO vo) throws Exception {
		reviewDAO.createReview(vo);
	}

	// 게시글 수정
	public void updateReview(ReviewVO vo) throws Exception {
		reviewDAO.updateReview(vo);
	}

	// 게시글 삭제
	public void deleteReview(int r_no) throws Exception {
		reviewDAO.deleteReview(r_no);
	}
	
	// 게시글 삭제 체크
	public int checkReview(int r_no) throws Exception {
		return reviewDAO.checkReview(r_no);
	}

	// 게시글 읽기
	public ReviewVO readReview(int r_no) throws Exception {
		return reviewDAO.readReview(r_no);
	}
	
	// 게시글 목록
	public List<ReviewVO> listAllReview(String searchOption, String keyword, int start, int end)
			throws Exception {
		return reviewDAO.listAllReview(searchOption, keyword, start, end);
	}
	
	// 이전글
	public ReviewVO previousB(int r_no) throws Exception {
		return reviewDAO.previousB(r_no);
	}
	
	// 다음글
	public ReviewVO nextB(int r_no) throws Exception {
		return reviewDAO.nextB(r_no);
	}
	
	// 조회수
	public void reviewCnt(int r_no, HttpSession session) throws Exception {
		// 타이머 설정
		long update_time = 0;

		if (session.getAttribute("update_time_" + r_no) != null) {
			// 최근에 조회수를 올린 시간
			update_time = (Long) session.getAttribute("update_time_" + r_no);
		}
		long current_time = System.currentTimeMillis();
		// 일정 시간이 경과한 후 조회수 증가 처리
		if (current_time - update_time > 5 * 10000) {
			// 조회수 증가 처리
			reviewDAO.reviewCnt(r_no);
			// 조회수를 올린 시간 저장
			session.setAttribute("update_time_" + r_no, current_time);
		}
	}
	
	
	// 게시글 갯수
	public int getCountReview(String searchOption, String keyword) throws Exception {
		return reviewDAO.getCountReview(searchOption, keyword);
	}

}
