package com.UGAHacks.InvestBetter.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.UGAHacks.InvestBetter.Request.UserRegistrationRequest;
import com.UGAHacks.InvestBetter.Service.UserRegistrationService;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
@RequestMapping
public class UserRegistrationController {
	private final UserRegistrationService userRegistrationService;
	
	@PostMapping(path="/registerConfirmation")
	 public String registerUser(@RequestParam String fNameReg,
			 @RequestParam String lNameReg,
			 @RequestParam String emailReg,
			 @RequestParam String passwordReg,
			 @RequestParam String cpasswordReg,
			 Model model) {
	 	System.out.println("In controller");
	 	System.out.println(passwordReg);
		
	 	UserRegistrationRequest request = new UserRegistrationRequest(fNameReg,
	 			lNameReg,
	 			emailReg,
	 			passwordReg,
	 			cpasswordReg);
	 	
	 	String token = userRegistrationService.registerUser(request);
	 	model.addAttribute("email", emailReg);
	 	model.addAttribute("confirm", "Registration confirmed! Please check your inbox to validate your email id and continue to login.");
	 	System.out.println("4 " +token);
		return "login";
	 }
	
	@GetMapping("/registerUser/confirm")
    public String confirm(String token, Model model) {
		 System.out.println("Inside ru confirm");
		 System.out.println("2 "+token);
		 
	     model.addAttribute("emailConfirm", "Your account has been successfully validated. Please login to continue.");
        return userRegistrationService.confirmToken(token);
    }
}
