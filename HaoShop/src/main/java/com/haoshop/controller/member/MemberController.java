package com.haoshop.controller.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.haoshop.model.member.MemberService;
import com.haoshop.model.member.MemberVO;

@Controller
public class MemberController {
	@Autowired
	private MemberService memberService;

	@RequestMapping("/main.do")
	public String main() { return "main"; }

	@RequestMapping(value = "/register.do", method = RequestMethod.GET)
	public String signUpView(MemberVO vo) { 
		memberService.insertMember(vo);
		return "main"; 
	}
}
