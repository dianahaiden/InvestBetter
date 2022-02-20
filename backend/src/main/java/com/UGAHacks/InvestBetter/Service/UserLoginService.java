package com.UGAHacks.InvestBetter.Service;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.UGAHacks.InvestBetter.Model.UserRepository;
import com.UGAHacks.InvestBetter.Request.UserLoginRequest;
import com.UGAHacks.InvestBetter.View.User;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class UserLoginService {
	private final UserRepository userRepository;
	private final BCryptPasswordEncoder bCryptPasswordEncoder;

	public User loginUser(UserLoginRequest request, HttpServletResponse response, Model model, HttpSession session) {
		System.out.println(request.getEmailID());
		boolean present = userRepository.findByEmailID(request.getEmailID()).isPresent();
		String name = null;
		String error = null;
		
		try {
		
		if (!present) {
			error = "Sorry! This email ID is not registered with us.";
			model.addAttribute("error", error);
			session.setAttribute("error", error);
			response.sendRedirect("http://localhost:8080/login");
			throw new IllegalStateException("Sorry! This email ID is not registered with us.");
		}
		else if (present && !bCryptPasswordEncoder.matches(request.getPassword(), userRepository.findEmailID(request.getEmailID()).getPassword())) {
			error = "Wrong password!";
			model.addAttribute("error", error);
			session.setAttribute("error", error);
			response.sendRedirect("http://localhost:8080/login");
			throw new IllegalStateException("Wrong password!");
		}
		else if (present && userRepository.findEmailID(request.getEmailID()).getEnabled()) {
			name = userRepository.findEmailID(request.getEmailID()).getFirstName();
		}
		else {
			error = "Kindly verify your email ID";
			model.addAttribute("error", error);
			session.setAttribute("error", error);
			response.sendRedirect("http://localhost:8080/login");
			throw new IllegalStateException("Kindly verify your email ID");
		}
		
		}catch(Exception e) {
			e.printStackTrace();
		}
		User user = userRepository.findEmailID(request.getEmailID());
		System.out.println(name);
		return user;
	}
}
