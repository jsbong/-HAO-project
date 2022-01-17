package com.haoshop.model.payment;

import java.util.List;

public interface PaymentService {
	// 구매
	List<PaymentVO> getPaymentProduct(PaymentVO vo);
	
	// 장바구니 구매
	List<PaymentVO> cartPaymentProduct(PaymentVO vo);
	
	// 결제
	void insertPayment(PaymentVO vo);
	
	// 결제 후 장바구니 비우기
	void deleteCartPayment(PaymentVO vo);
	
	//주문 상태 변경
	void updateState(PaymentVO vo);

	int getCountOrderAll(PaymentVO vo);

	List<PaymentVO> getOrderListAll(PaymentVO vo, int start, int end);
}