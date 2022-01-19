package com.haoshop.model.journal.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.haoshop.model.journal.JournalService;
import com.haoshop.model.journal.JournalVO;

@Service("JournalService")
public class JournalServiceImpl implements JournalService {

	@Autowired
	private JournalDAO JournalDAO;
	
	@Override
	public void insertJournal(JournalVO vo) {
		JournalDAO.insertJournal(vo);
	}
	
}
