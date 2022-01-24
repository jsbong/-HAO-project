package com.haoshop.controller.journal;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import com.haoshop.model.product.ProductVO;

@Controller
public class JournalController {
	
	@Autowired
	private JournalService journalService;
	
	//등록
	@RequestMapping("/insertJournal")
	public String insertCollection(MultipartHttpServletRequest multi, JournalVO vo) {
		String path = "resources/img/collection/";

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
		return "journal/journalList";
	} //헤더에서
	
	//저널 내용 보기
	@RequestMapping("/displayJour")
	public String displayJour(JournalVO vo, Model model) {
		model.addAttribute("journal", journalService.journalDetail(vo));
		return "journal/displayJour";
	} //이미지 클릭시

	@RequestMapping("/imageUpload.do")
	public void imageUpload(HttpServletRequest request,
			HttpServletResponse response,
			MultipartFile upload) throws Exception {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		//업로드한 파일 이름
		String fileName=upload.getOriginalFilename();
		//파일을 바이트 배열로 변환
		byte[] bytes=upload.getBytes();
		//이미지를 업로드할 디렉토리(배포 디렉토리로 설정)
		String uploadPath=
				"C:/Users/mrhi04-18/git/HAO-project/HaoShop/src/main/webapp/WEB-INF/views/images/";
		OutputStream out=new FileOutputStream(
				new File(uploadPath+fileName));
		//서버로 업로드
		out.write(bytes);
		//클라이언트에 결과 표시
		String callback=request.getParameter("CKEditorFuncNum");
		//서버=>클라이언트로 텍스트 전송(자바스크립트 실행)
		PrintWriter printWriter=response.getWriter();
				
		String fileUrl = request.getContextPath()+ "/images/"+fileName;
		
		printWriter.println(
					"<script>window.parent.CKEDITOR.tools.callFunction("
					+callback+",'"+fileUrl+"','이미지가 업로드되었습니다.')"
					+"</script>");
		printWriter.flush();
	}

}
