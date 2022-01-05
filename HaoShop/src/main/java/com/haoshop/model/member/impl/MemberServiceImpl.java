package com.haoshop.model.member.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.haoshop.model.member.MemberService;
import com.haoshop.model.member.MemberVO;

@Service("memberService")
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDAO memberDAO;


	// 회원가입
	public void insertMember(MemberVO vo) {
		System.out.println("==> insertMember 처리");
		memberDAO.insertMember(vo);
	}

}