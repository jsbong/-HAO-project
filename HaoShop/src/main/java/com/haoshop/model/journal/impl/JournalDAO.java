package com.haoshop.model.journal.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.haoshop.model.journal.JournalVO;

@Repository
public class JournalDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	// 컬렉션 등록
	public void insertJournal(JournalVO vo) {
		mybatis.insert("JournalDAO.insertJournal", vo);
	}
}
