package com.UGAHacks.InvestBetter.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
@RequestMapping
public class HomeController {
	
	@GetMapping("/home")
	public String home(HttpServletRequest request, HttpServletResponse response, Model model){
		HttpSession session = request.getSession();
//		session.setAttribute("requestingFrom", "Home");
//		try {
//			response.sendRedirect("/fetchCarouselMovies");
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
	model.addAttribute("emailID", session.getAttribute("emailID"));
		return "home";
	}
	
	@GetMapping(path= "/register")
	 public String register() {
	 	return "registration";
	 }
	
	@GetMapping(path= "/investing")
	 public String invest() {
	 	return "investing";
	 }
	
	@GetMapping(path= "/portfolio")
	 public String portfolio() {
	 	return "portfolio";
	 }
	
	
	@GetMapping(path= "/login")
	 public String login(HttpSession session, Model model) {
		model.addAttribute("error",session.getAttribute("error"));
		session.setAttribute("error", null);
	 	return "login";
	 }
}
