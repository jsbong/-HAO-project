package com.haoshop.home;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.haoshop.model.member.MemberService;
import com.haoshop.model.payment.PaymentService;
import com.haoshop.model.payment.PaymentVO;

@Controller
public class HomeController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private PaymentService paymentService;
	@Autowired
	private MemberService memberService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
		model.addAttribute("serverTime", formattedDate);
		return "main";
	}
	
	@RequestMapping(value = "/about", method = RequestMethod.GET)
	public String about() {
		return "common/about";
	}
	
	@RequestMapping(value = "/member", method = RequestMethod.GET)
	public String member() {
		return "admin/member";
	}
	
	
	@RequestMapping(value = "/journal", method = RequestMethod.GET)
	public String collection() {
		return "admin/journal";
	}
	
	@RequestMapping(value = "/adminpage", method = RequestMethod.GET)
	public String adminpage(@RequestParam(defaultValue = "1") int curPage, PaymentVO vo, Model model) {
		int count = paymentService.getCountOrderNow();
		Pager pager = new Pager(count, curPage);
		int start = pager.getPageBegin(); 
		int end = pager.getPageEnd();
		
		List<PaymentVO> list = paymentService.getOrderListNow(vo, start, end);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("count", count);
		map.put("pager", pager);
		model.addAttribute("map", map);
		return "admin/adminpage";
	}
	
}