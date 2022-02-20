package com.UGAHacks.InvestBetter.Controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.UGAHacks.InvestBetter.Service.UserRegistrationService;

import lombok.AllArgsConstructor;

@RestController
@AllArgsConstructor
@RequestMapping("/registerUser/confirm1")
public class ConfirmationTokenController {
	private final UserRegistrationService userRegistrationService;

	private HttpServletRequest request;
	
	@GetMapping
    public String confirm(String link) {
		System.out.println(((HttpServletRequest)request).getRequestURI());
		System.out.println(link);
		String token = link.substring(link.indexOf("="), link.length()); 
		 System.out.println("Inside ru confirm");
		 System.out.println("2 "+token);

        return userRegistrationService.confirmToken(token);
    }

}
