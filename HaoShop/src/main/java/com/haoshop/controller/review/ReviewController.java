package com.haoshop.controller.review;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.haoshop.home.Pager;
import com.haoshop.model.review.ReviewService;
import com.haoshop.model.review.ReviewVO;

@Controller
@SessionAttributes("review")
public class ReviewController {

	@Autowired
	private ReviewService reviewService;

	// 게시글 등록 뷰
	@RequestMapping("/r_write")
	public String review_write(ReviewVO vo) throws Exception {
		return "review/r_write";
	}

	// 게시글 등록
	@RequestMapping(value = "/createReview", method = RequestMethod.POST)
	public String createReview(ReviewVO vo) throws Exception {
		reviewService.createReview(vo);
		return "review/r_list";
	}

	// 게시글 수정 뷰
	@RequestMapping("/r_updateWrite")
	public String r_updateWrite(ReviewVO vo) throws Exception {
		return "review/r_updateWrite";
	}

	// 게시글 수정
	@RequestMapping(value = "/updateReview", method = RequestMethod.POST)
	public String updateReview(ReviewVO vo) throws Exception {
		if (vo.getR_title() != null) {
			reviewService.updateReview(vo);
			return "review/r_view";
		} else {
			return "review/r_write";
		}
		// return "redirect:/board";
	}

	// 게시글 삭제
	@RequestMapping("/r_delete")
	public String deleteReview(int r_no) throws Exception {
		reviewService.deleteReview(r_no); // 삭제 처리
		return "redirect:/review"; // 목록으로 이동
	}

	// 게시글 목록 + 검색 + 페이징
	@RequestMapping("/review")
	public String listAllReview(Model model, HttpSession session,
			@RequestParam(defaultValue = "R_TITLE") String searchOption, 
			@RequestParam(defaultValue = "") String keyword,
			@RequestParam(defaultValue = "") String search, 
			@RequestParam(defaultValue = "1") int curPage)
			throws Exception {

		// 게시글 갯수 계산
		int count = reviewService.getCountReview(searchOption, keyword);

		session.setAttribute("searchOption", searchOption);
		session.setAttribute("keyword", keyword);
		session.setAttribute("search", search);
		session.setAttribute("curPage", curPage);

		// 페이지 관련 설정
		Pager pager = new Pager(count, curPage);
		int start = pager.getPageBegin();
		int end = pager.getPageEnd();

		List<ReviewVO> list = reviewService.listAllReview(searchOption, keyword, start, end); // 게시글 목록

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("list", list); // map에 자료 저장
		map.put("count", count);
		map.put("pager", pager); // 페이지 네버게이션을 위한 변수
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("search", search);
		model.addAttribute("map", map);

		return "review/list";
	}

	// 게시글 상세보기
	@RequestMapping("/r_view")
	public String readBoard(@RequestParam("r_no") int r_no, Model model, HttpSession session,
							@RequestParam(defaultValue = "R_TITLE") String searchOption,
							@RequestParam(defaultValue = "") String keyword, 
							@RequestParam(defaultValue = "") String search,
							@RequestParam(defaultValue = "1") int curPage) throws Exception {

		

		reviewService.reviewCnt(r_no, session); // 조회수
		model.addAttribute("review", reviewService.readReview(r_no)); // 게시글 읽기

		// 세션 저장
		searchOption = (String) session.getAttribute("searchOption");
		session.setAttribute("searchOption", searchOption);

		keyword = (String) session.getAttribute("keyword");
		session.setAttribute("keyword", keyword);

		search = (String) session.getAttribute("search");
		session.setAttribute("search", search);

//		curPage = (int) session.getAttribute("curPage");
		curPage = (Integer) session.getAttribute("curPage");
		session.setAttribute("curPage", curPage);

		ReviewVO plist = reviewService.previousB(r_no);
		ReviewVO nlist = reviewService.nextB(r_no);

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("previousB", plist);
		map.put("nextB", nlist);
		model.addAttribute("map", map);

		return "review/r_view";
	}
}