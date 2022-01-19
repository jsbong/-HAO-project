package com.haoshop.controller.journal;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.haoshop.home.Pager;
import com.haoshop.model.journal.JournalService;
import com.haoshop.model.journal.JournalVO;
import com.haoshop.model.product.ProductService;
import com.haoshop.model.product.ProductVO;

@Controller
public class JournalController {
	

	@Autowired
	private JournalService journalService;
	
	//등록
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
	
	
	//리스트 가져오기
	@RequestMapping("/journalList")
	public String journalList(@RequestParam(defaultValue = "1") int curPage, JournalVO vo, Model model){
		int count = journalService.getCountJournal(vo); // 서브 카테고리에 해당하는 상품 개수 리턴
		Pager pager = new Pager(count, curPage); // (레코드 개수, 현재 페이지 번호(default = 1) )
		int start = pager.getPageBegin(); //  
		int end = pager.getPageEnd(); // 
		
		List<JournalVO> list = journalService.getJournalList(start, end, vo);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("count", count);
		map.put("pager", pager);
		model.addAttribute("map", map);
		return "common/journalList";
	}

	
}
