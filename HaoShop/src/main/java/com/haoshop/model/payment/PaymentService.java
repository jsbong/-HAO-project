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

	int getCountOrderAll(String sPrd);

	List<PaymentVO> getOrderListAll(String sPrd, int start, int end);

	int getCountOrderNow();
	int getCountWait();

	List<PaymentVO> getOrderListNow(PaymentVO vo, int start, int end);

	List<Integer> paymentMonth();

	List<Long> paymentMonthPrice();

}