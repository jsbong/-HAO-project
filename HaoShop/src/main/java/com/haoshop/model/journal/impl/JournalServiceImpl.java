package com.haoshop.model.journal.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.haoshop.model.journal.JournalService;
import com.haoshop.model.journal.JournalVO;
import com.haoshop.model.product.ProductVO;

@Service("JournalService")
public class JournalServiceImpl implements JournalService {

	@Autowired
	private JournalDAO journalDAO;
	
	@Override
	public void insertJournal(JournalVO vo) {
		journalDAO.insertJournal(vo);
	}

	public int getCountJournal(JournalVO vo) {
		return journalDAO.getCountJournal(vo);
	}

	public List<JournalVO> getJournalList(int start, int end, JournalVO vo) {
		return journalDAO.getJournalList(start, end, vo);
	}

}
