package com.haoshop.controller.member;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.haoshop.home.Pager;
import com.haoshop.model.member.MemberService;
import com.haoshop.model.member.MemberVO;
import com.haoshop.model.payment.PaymentVO;

@Controller
public class MemberController {
	@Autowired
	private MemberService memberService;

	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public String signUpView(MemberVO vo) { return "member/signup"; }
	
	//회원 관리뷰(관리자)
	@RequestMapping("/memberList")
	public String getMemberpage(@RequestParam(defaultValue = "1") int curPage, MemberVO vo, Model model) { 
		int count = memberService.getCountMember(vo);
		Pager pager = new Pager(count, curPage); // (레코드 개수, 현재 페이지 번호(default = 1) )
		int start = pager.getPageBegin(); //  
		int end = pager.getPageEnd(); // 
		
		List<MemberVO> list = memberService.getMemberList(start, end, vo);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("count", count);
		map.put("pager", pager);
		model.addAttribute("map", map);
		return "admin/memberList";
	}
	
	//회원 상세 관리뷰(관리자)
	@RequestMapping(value = "/memberDetail", method = RequestMethod.GET)
	public String getMemberDetail(MemberVO vo, HttpSession session, Model model, @RequestParam(defaultValue = "1") int myp) {
		model.addAttribute("memberdetail", memberService.getMemberDetail(vo));
		int totalpay = memberService.getTotalPay(vo);
		int count = memberService.getCountOrder(vo);
		
		Pager pager = new Pager(count, myp);
		int start = pager.getPageBegin();
		int end = pager.getPageEnd();
		
		session.setAttribute("myp", myp);
		List<PaymentVO> list = memberService.getOrderList(vo, start, end);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("mypL", list); // map에 자료 저장
		map.put("count", count);
		map.put("pager", pager); // 페이지 네버게이션을 위한 변수
		map.put("totalpay", totalpay);
		session.setAttribute("map", map);
		return "admin/memberDetail";
	}

	// 회원 주문내역 뷰 (페이징 처리)
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String mypageView(MemberVO vo, HttpSession session, Model model, @RequestParam(defaultValue = "1") int myp) {
		int count = memberService.getCountOrder(vo);
		Pager pager = new Pager(count, myp);
		int start = pager.getPageBegin();
		int end = pager.getPageEnd();
		
		session.setAttribute("myp", myp);
		session.setAttribute("m_no", vo.getM_no());
		
		List<PaymentVO> list = memberService.getOrderList(vo, start, end);

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("mypL", list); // map에 자료 저장
		map.put("count", count);
		map.put("pager", pager); // 페이지 네버게이션을 위한 변수
		session.setAttribute("map", map);
		return "member/mypage";
	}
	
	
	

	// 마이페이지-비밀번호 view
	@RequestMapping(value = "/mypage2", method = RequestMethod.GET)
	public String mypageView2(MemberVO vo) {
		return "member/mypage2";
	}

	// 마이페이지-비밀번호 확인 처리
	@RequestMapping(value = "/mypage2", method = RequestMethod.POST)
	public String mypage2(MemberVO vo) {
		memberService.login(vo);
		return "member/mypage3";
	}
	
	// 마이페이지-비밀번호 view
	@RequestMapping(value = "/mypage5", method = RequestMethod.GET)
	public String mypageView5(MemberVO vo) {
		return "member/mypage5";
	}

	// 마이페이지-회원정보수정 view
	@RequestMapping(value = "/mypage3", method = RequestMethod.GET)
	public String mypageView3(MemberVO vo) {
		return "member/mypage3";
	}

	// 마이페이지-회원정보수정 처리
	@RequestMapping(value = "/mypage3", method = RequestMethod.POST)
	public String mypage3(MemberVO vo) {
		memberService.updateMember(vo);
		return "member/mypage";
	}

	// 마이페이지-완료 view
	@RequestMapping("/mypage4")
	public String mypage4(MemberVO vo) {
		return "member/mypage4";
	}

	// 로그아웃
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "member/login";
	}

	// 아이디 중복검사
	@ResponseBody
	@RequestMapping(value = "/checkID")
	public int checkID(MemberVO vo) {
		int checkID = memberService.checkID(vo);
		return checkID;
	}

	@ResponseBody
	@RequestMapping(value = "/checkMember")
	public int checkMember(MemberVO vo) {
		int checkMember = memberService.checkMember(vo);
		return checkMember;
	}

	// 회원가입
	@RequestMapping("/join")
	public String signUp(MemberVO vo, HttpSession session) {
		System.out.println("가입 성공....");
		memberService.insertMember(vo);
		session.removeAttribute("key");
		return "main";
	}
	
	// 회원탈퇴
	@RequestMapping("/distroy")
	public String withdrawal(MemberVO vo) {
		System.out.println("탈퇴 완료....");
		memberService.deleteMember(vo);
		return "main";
	}

	@RequestMapping(value = "/email", method = RequestMethod.GET)
	public String emailView(MemberVO vo) {
		return "member/email";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginView(MemberVO vo) {
		return "member/login";
	}

	// 로그인
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(MemberVO vo, HttpSession session) {
		MemberVO member = memberService.login(vo);
		if (member != null) {
			session.setAttribute("member", member);
			return "main";				
		} else {
			return "member/login";
		}
	}
	
	@RequestMapping("/forgotPW")
	public String forgotPWView(MemberVO vo) { 
		return "member/forgotPW"; 
	}
	
	@ResponseBody
	@RequestMapping(value="/forgotPWChkm")
	public String forgotPWChkm(MemberVO vo) throws Exception {
		String forgotPWChkm = memberService.forgotPWChkMember(vo);
		return forgotPWChkm;
	}
	
	@RequestMapping(value="/forgotPW", method = RequestMethod.POST)
	public String forgotPW(MemberVO vo) throws Exception {
		memberService.forgotPWUpdate(vo);
		return "";
	}
	
	@ResponseBody
	@RequestMapping(value="/joinPost", method=RequestMethod.POST)
	public String joinPost(@ModelAttribute("vo") MemberVO vo, HttpSession session) throws Exception {
		String key = memberService.create(vo);
		session.setAttribute("key", key);
		System.out.println(key);
		return "ok";
	}
	
	@ResponseBody
	@RequestMapping(value="/joinConfirm", method=RequestMethod.POST)
	public String emailConfirm(@ModelAttribute("vo") MemberVO vo, HttpSession session) throws Exception {
		String key = (String)session.getAttribute("key");
		return key;
	}
}
