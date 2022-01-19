package com.haoshop.model.journal.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.haoshop.model.journal.JournalVO;
import com.haoshop.model.product.ProductVO;

@Repository
public class JournalDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	// 컬렉션 등록
	public void insertJournal(JournalVO vo) {
		mybatis.insert("JournalDAO.insertJournal", vo);
	}

	public int getCountJournal(JournalVO vo) {
		return mybatis.selectOne("JournalDAO.getCountJournal", vo);
	}

	public List<JournalVO> getJournalList(int start, int end, JournalVO vo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("journal", vo);
		return mybatis.selectList("JournalDAO.getJournalList", map);
	}

}
