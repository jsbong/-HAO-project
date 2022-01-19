package com.haoshop.controller.journal;

import java.util.Iterator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.haoshop.model.journal.JournalService;
import com.haoshop.model.journal.JournalVO;

@Controller
public class JournalController {
	

	@Autowired
	private JournalService journalService;
	
	@RequestMapping("/insertJournal")
	public String insertCollection(MultipartHttpServletRequest multi, JournalVO vo) {
		String path = "resources/collection/";

		Iterator<String> files = multi.getFileNames();
		while(files.hasNext()) {
			String uploadFile = files.next();

			MultipartFile mFile = multi.getFile(uploadFile);
			String fileName = mFile.getOriginalFilename();
			
			vo.setJour_img(path + fileName);

		}
		
		journalService.insertJournal(vo);
		
		return "main";
	}
}
