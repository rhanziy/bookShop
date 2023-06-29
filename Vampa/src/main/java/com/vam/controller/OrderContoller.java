package com.vam.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.vam.model.MemberVO;
import com.vam.model.OrderDTO;
import com.vam.model.OrderPageDTO;
import com.vam.service.MemberService;
import com.vam.service.OrderService;

import lombok.extern.log4j.Log4j;


@Log4j
@Controller
public class OrderContoller {
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private MemberService memberService;
	
	
	@GetMapping("/order/{memberId}")
	public String orderPageGET(@PathVariable("memberId") String memberId, OrderPageDTO opd, Model model) {

			model.addAttribute("orderList", orderService.getGoodsInfo(opd.getOrders()));
			model.addAttribute("memberInfo", memberService.getMemberInfo(memberId));
			
			return "/order";
		
	}
	
	@PostMapping("/order")
	public String orderPagePost(OrderDTO ord, HttpServletRequest request) {
		
		log.info(ord);
		orderService.order(ord);
		
		/* main.jsp member point update */

		MemberVO member = new MemberVO();
		member.setMemberId(ord.getMemberId());
		
		HttpSession session = request.getSession();
		
		try {
			
			MemberVO memberLogin = memberService.memberLogin(member);
			memberLogin.setMemberPw("");
			session.setAttribute("member", memberLogin);
			
		} catch(Exception e) {
			
			e.printStackTrace();
		}
		
		return "redirect:/main";
		
	}
}
