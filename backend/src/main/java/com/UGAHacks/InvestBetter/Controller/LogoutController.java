package com.UGAHacks.InvestBetter.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.support.SessionStatus;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
@RequestMapping
public class LogoutController {
	
	@GetMapping(path = "/logout")
	public String logout(HttpServletRequest request, HttpServletResponse response, SessionStatus session) {
		System.out.println("in logout");
		session.setComplete();
		request.getSession().invalidate();
		return "Home";
	}

}
