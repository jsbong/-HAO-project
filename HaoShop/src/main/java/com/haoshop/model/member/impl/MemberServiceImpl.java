package com.haoshop.model.member.impl;

import java.util.List;
import java.util.Set;

import org.bouncycastle.jcajce.provider.digest.SHA3;
import org.bouncycastle.util.encoders.Hex;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.haoshop.model.member.MemberService;
import com.haoshop.model.member.MemberVO;
import com.haoshop.model.payment.PaymentVO;

@Service("memberService")
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDAO memberDAO;
	@Autowired
	private JavaMailSender mailSender;
	
	// 패스워드 암호화
	public void securityPWD(MemberVO vo) {
		SHA3.DigestSHA3 digestSHA3 = new SHA3.DigestSHA3(512);
		byte[] digest = digestSHA3.digest(vo.getM_pwd().getBytes());
		String securitypwd = Hex.toHexString(digest);
		vo.setM_pwd(securitypwd);
	}
	
	public void imsiPW(MemberVO vo) {
		char[] charSet = new char[] { 
				'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 
				'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 
				'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 
				'U', 'V', 'W', 'X', 'Y', 'Z' };
		int idx = 0;
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < 10; i++) {
			idx = (int) (charSet.length * Math.random());
			sb.append(charSet[idx]);
		}
		String imPW = sb.toString();
	}
	
	// 이메일 인증키 생성
	public String create(MemberVO vo) throws Exception {
		// 임의의 authkey 생성
		String authkey = new TempKey().getKey(10, false);

		// mail 작성 관련 
		MailUtils sendMail = new MailUtils(mailSender);

		sendMail.setSubject("[HAP Shop] 회원가입 이메일 인증");
		sendMail.setText(new StringBuffer().append("<h1>[이메일 인증]</h1>")
				.append(authkey)
				.toString());
		sendMail.setFrom("haoshop40@gmail.com ", "hao");
		sendMail.setTo(vo.getM_email());
		sendMail.send();
		return authkey;
	}
	
	// 이메일 인증키 생성(비번찾기)
		public String makePwd(MemberVO vo) throws Exception {
			// 임의의 authkey 생성
			String authkey = new TempKey().getKey(10, false);

			// mail 작성 관련 
			MailUtils sendMail = new MailUtils(mailSender);

			sendMail.setSubject("[HAP Shop] 임시 비밀번호 발급");
			sendMail.setText(new StringBuffer().append("<h1>[임시 비밀번호 입니다]</h1><Strong>")
					.append(authkey)
					.append("</Strong><br>즉시 비밀번호를 변경해 주세요")
					.toString());
			sendMail.setFrom("haoshop40@gmail.com ", "hao");
			sendMail.setTo(vo.getM_email());
			sendMail.send();
			return authkey;
		}
	
	// ID 중복검사
	public int checkID(MemberVO vo) {
		return memberDAO.checkID(vo);
	}

	// 회원 유무 검사
	public int checkMember(MemberVO vo) {
		securityPWD(vo);
		return memberDAO.checkMember(vo);
	}

	// 회원가입
	public void insertMember(MemberVO vo) {
		securityPWD(vo);
		memberDAO.insertMember(vo);
	}
	
	// 회원탈퇴
	public void deleteMember(MemberVO vo) {
		memberDAO.deleteMember(vo);
	}

	// 로그인
	public MemberVO login(MemberVO vo) {
		securityPWD(vo);
		return memberDAO.login(vo);
	}

	// 회원정보 수정
	public void updateMember(MemberVO vo) {
		securityPWD(vo);
		memberDAO.updateMember(vo);
	}

	// 회원 주문내역
	public List<PaymentVO> getOrderList(MemberVO vo, int start, int end) {
		return memberDAO.getOrderList(vo, start, end);
	}

	// 회원 주문내역 갯수
	public int getCountOrder(MemberVO vo) {
		return memberDAO.getCountOrder(vo);
	}
	
	// 임시비밀번호
	public String forgotPWChkMember(MemberVO vo) throws Exception {
		String email =memberDAO.forgotPWChkMember(vo);
		vo.setM_email(email);
		String newpwd = makePwd(vo);
		vo.setM_pwd(newpwd);
		securityPWD(vo);
		memberDAO.forgotPWUpdate(vo);
		return "ok";
	}
	
	public void forgotPWUpdate(MemberVO vo) throws Exception {
		memberDAO.forgotPWUpdate(vo);
	}

	
	public List<MemberVO> getMemberList(int start, int end, MemberVO vo) {
		return memberDAO.getMemberList(start, end, vo);
	}

	public int getCountMember(MemberVO vo) {
		return memberDAO.getCountMember(vo);
	}

	public MemberVO getMemberDetail(MemberVO vo) {
		return memberDAO.getMemberDetail(vo);
	}

	public int getTotalPay(MemberVO vo) throws NullPointerException{
		return memberDAO.getTotalPay(vo);
	}

	public int getCountMemberNow() {
		return memberDAO.getCountMemberNow();
	}

	public List<MemberVO> getMemberNow() {
		return memberDAO.getMemberNow();
	}
}