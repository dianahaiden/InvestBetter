package com.UGAHacks.InvestBetter.Controller;

import java.io.IOException;
import java.text.ParseException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import com.UGAHacks.InvestBetter.Request.UserLoginRequest;
import com.UGAHacks.InvestBetter.Service.UserLoginService;
import com.UGAHacks.InvestBetter.View.User;
import com.UGAHacks.InvestBetter.View.UserType;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
@RequestMapping
public class UserLoginController {
	
	private final UserLoginService userLoginService;
	
	@RequestMapping(path = "/userAccount")
	public String userAccount(HttpServletRequest req, HttpServletResponse response, Model model) throws ParseException, IOException{
		//try {//remove try catch
		HttpSession session = req.getSession();

		session.setAttribute("error", null);
		if (session.getAttribute("emailID") == null) {
			response.sendRedirect("/login");
			return "login";
		}
		
		String email = session.getAttribute("emailID").toString();
		String password = session.getAttribute("password").toString();
		UserLoginRequest request = new UserLoginRequest(email, password);
		User user = loginUser(request, response, model, session);
		
		session.setAttribute("loggedInUser", user);

//		if(session.getAttribute("ongoingBooking") != null) {
//			response.sendRedirect("/checkout");
//			return "Checkout";
//		}
		if (user.getUserType()==UserType.Registered_User) {
			String firstName = user.getFirstName();
			String fullName = user.getFirstName()+" "+user.getLastName();
			model.addAttribute("firstName", firstName);
			model.addAttribute("fullName", fullName);
			model.addAttribute("emailID", email);
			return "home";
		}
		else {
			return "login";
		}
	}
	
	 @PostMapping(path="/loginUser")
	 public User loginUser(@RequestBody UserLoginRequest request, HttpServletResponse response, Model model, HttpSession session) {
		 System.out.println("In login controller");
		return userLoginService.loginUser(request, response, model, session);
	 }

}
