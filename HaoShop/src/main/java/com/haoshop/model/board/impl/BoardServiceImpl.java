package com.haoshop.model.board.impl;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.haoshop.model.board.BoardService;
import com.haoshop.model.board.BoardVO;
import com.haoshop.model.board.Board_CommentVO;

@Service("BoardService")
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDAO boardDAO;
	
	
	// 게시글 쓰기
	public void createBoard(BoardVO vo) throws Exception {
		boardDAO.createBoard(vo);
	}

	// 게시글 수정
	public void updateBoard(BoardVO vo) throws Exception {
		boardDAO.updateBoard(vo);
	}

	// 게시글 삭제
	public void deleteBoard(int b_no) throws Exception {
		boardDAO.deleteBoard(b_no);
	}
	
	// 게시글 삭제 체크
	public int checkBoard(int b_no) throws Exception {
		return boardDAO.checkBoard(b_no);
	}

	// 게시글 읽기
	public BoardVO readBoard(int b_no) throws Exception {
		return boardDAO.readBoard(b_no);
	}
	
	// 게시글 목록
	public List<BoardVO> listAllBoard(String searchOption, String keyword, int start, int end)
			throws Exception {
		return boardDAO.listAllBoard(searchOption, keyword, start, end);
	}
	
	// 이전글
	public BoardVO previousB(int b_no) throws Exception {
		return boardDAO.previousB(b_no);
	}
	
	// 다음글
	public BoardVO nextB(int b_no) throws Exception {
		return boardDAO.nextB(b_no);
	}
	
	// 조회수
	public void b_viewCnt(int b_no, HttpSession session) throws Exception {
		// 타이머 설정
		long update_time = 0;

		if (session.getAttribute("update_time_" + b_no) != null) {
			// 최근에 조회수를 올린 시간
			update_time = (Long) session.getAttribute("update_time_" + b_no);
		}
		long current_time = System.currentTimeMillis();
		// 일정 시간이 경과한 후 조회수 증가 처리
		if (current_time - update_time > 5 * 10000) {
			// 조회수 증가 처리
			boardDAO.b_viewCnt(b_no);
			// 조회수를 올린 시간 저장
			session.setAttribute("update_time_" + b_no, current_time);
		}
	}
	
	
	// 게시글 갯수
	public int getCountBoard(String searchOption, String keyword) throws Exception {
		return boardDAO.getCountBoard(searchOption, keyword);
	}

	// 댓글
	// 게시글 쓰기
	public void createCommentBoard(Board_CommentVO vo) throws Exception {
		boardDAO.createCommentBoard(vo);
	}

	@Override
	public List<Board_CommentVO> readComment(int b_no) {
		return boardDAO.readComment(b_no);
	}
	

}
