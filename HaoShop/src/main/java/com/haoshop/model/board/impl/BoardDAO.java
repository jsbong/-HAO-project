package com.haoshop.model.board.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.haoshop.model.board.BoardVO;
import com.haoshop.model.board.Board_CommentVO;

@Repository
public class BoardDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	// 게시글 쓰기
	public void createBoard(BoardVO vo) {
		mybatis.insert("BoardDAO.createBoard", vo);
	}

	// 게시글 수정
	public void updateBoard(BoardVO vo) {
		mybatis.update("BoardDAO.updateBoard", vo);
	}

	// 게시글 삭제
	public void deleteBoard(int b_no) {
		mybatis.update("BoardDAO.deleteBoard", b_no);
	}
	
	// 게시글 삭제 체크
	public int checkBoard(int b_no) throws Exception {
		return mybatis.selectOne("BoardDAO.checkBoard", b_no);
	}

	// 게시글 읽기
	public BoardVO readBoard(int b_no) {
		return (BoardVO) mybatis.selectOne("BoardDAO.readBoard", b_no);
	}
	
	// 이전글
	public BoardVO previousB(int b_no) {
		return (BoardVO) mybatis.selectOne("BoardDAO.previousB", b_no);
	}

	// 다음글
	public BoardVO nextB(int b_no) {
		return (BoardVO) mybatis.selectOne("BoardDAO.nextB", b_no);
	}
	
	// 게시물 목록
	public List<BoardVO> listAllBoard(String searchOption, String keyword, int start, int end) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("start", start);
		map.put("end", end);
		return mybatis.selectList("BoardDAO.listAllBoard", map);
	}

	// 조회수
	public void b_viewCnt(int b_no) {
		mybatis.update("BoardDAO.b_viewCnt", b_no);
	}

	// 게시글 갯수
	public int getCountBoard(String searchOption, String keyword) throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		return mybatis.selectOne("BoardDAO.getCountBoard", map);
	}
	
	// 댓글
	// 게시글 쓰기
	public void createCommentBoard(Board_CommentVO vo) {
		mybatis.insert("BoardDAO.createCommentBoard", vo);
	}
	
	public List<Board_CommentVO> readComment(int b_no){
		mybatis.selectList("BoardDAO.readComment", b_no);
		
		return mybatis.selectList("BoardDAO.readComment", b_no);
	}
	

}
