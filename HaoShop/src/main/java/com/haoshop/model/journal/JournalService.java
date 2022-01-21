package com.haoshop.model.journal;

import java.util.List;

public interface JournalService {
	
	void insertJournal(JournalVO vo);

	int getCountJournal(JournalVO vo);

	List<JournalVO> getJournalList(int start, int end, JournalVO vo);
	
	JournalVO journalDetail(JournalVO vo);
}
