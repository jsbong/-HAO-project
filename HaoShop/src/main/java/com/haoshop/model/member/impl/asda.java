package com.haoshop.model.member.impl;

import java.util.List;

import com.haoshop.model.member.MemberVO;
import com.haoshop.model.payment.PaymentVO;

public interface asda {
	// ID 중복검사
		int checkID(MemberVO vo);
		
		// 로그인시 회원 체크
		int checkMember(MemberVO vo);

		// 회원가입
		void insertMember(MemberVO vo);
		
		// 회원탈퇴
		void deleteMember(MemberVO vo);
		
		//이메일 인증코드
		String create(MemberVO vo) throws Exception;
		
		// 마이페이지
		// 회원 주문내역
		List<PaymentVO> getOrderList(MemberVO vo, int start, int end);
		// 회원 주문내역 갯수
		int getCountOrder(MemberVO vo);
		// 회원정보 수정
		void updateMember(MemberVO vo);
		
		// 로그인
		MemberVO login(MemberVO vo);
		
		// 비밀번호 찾기
		int forgotPWChkMember(MemberVO vo);
		void forgotPWUpdate(MemberVO vo);
		
		// 회원 리스트
		List<MemberVO> getMemberList(int start, int end, MemberVO vo);
		int getCountMember(MemberVO vo);
}
