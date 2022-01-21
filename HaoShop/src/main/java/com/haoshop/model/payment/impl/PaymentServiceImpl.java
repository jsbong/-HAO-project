package com.haoshop.model.payment.impl;

import java.util.List;

import org.bouncycastle.jcajce.provider.digest.SHA3;
import org.bouncycastle.util.encoders.Hex;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.haoshop.model.payment.PaymentService;
import com.haoshop.model.payment.PaymentVO;

@Service("paymentService")
public class PaymentServiceImpl implements PaymentService {
	@Autowired
	private PaymentDAO paymentDAO;
	
	// 신용카드 정보 암호화
	public void securityCREDIT(PaymentVO vo) {
		SHA3.DigestSHA3 digestSHA3 = new SHA3.DigestSHA3(512);
		byte[] digest = digestSHA3.digest(vo.getPay_creditcard().getBytes());
		String securitycredit = Hex.toHexString(digest);
		vo.setPay_creditcard(securitycredit);
		System.out.println("SHA3-512: " + vo.getPay_creditcard());
	}
	
	// 구매
	public List<PaymentVO> getPaymentProduct(PaymentVO vo) {
		return paymentDAO.getPaymentProduct(vo);
	}
	
	// 장바구니 구매
	public List<PaymentVO> cartPaymentProduct(PaymentVO vo) {
		return paymentDAO.cartPaymentProduct(vo);
	}
	
	// 결제
	public void insertPayment(PaymentVO vo) {
		paymentDAO.insertPayment(vo);
	}
	
	// 주문내역 - 전체
	public List<PaymentVO> getOrderListAll(String sPrd, int start, int end) {
		return paymentDAO.getOrderListAll(sPrd, start, end);
	}

	// 주문내역 갯수
	public int getCountOrderAll(String sPrd) {
		return paymentDAO.getCountOrderAll(sPrd);
	}
	
	public void deleteCartPayment(PaymentVO vo) {
		paymentDAO.deleteCartPayment(vo);
	}
	
	public void updateState(PaymentVO vo) {
		paymentDAO.updateState(vo);
	}

	public int getCountOrderNow() {
		return paymentDAO.getCountOrderNow();
	}

	public List<PaymentVO> getOrderListNow(PaymentVO vo, int start, int end) {
		return paymentDAO.getOrderListNow(vo, start, end);
	}

	public int getCountWait() {
		return paymentDAO.getCountWait();
	}

	public List<Integer> paymentMonth() {
		return paymentDAO.paymentMonth();
	}

}
