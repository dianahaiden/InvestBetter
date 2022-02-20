package com.UGAHacks.InvestBetter.Request;

import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.ToString;

@Getter
@AllArgsConstructor
@EqualsAndHashCode
@ToString
public class UserRegistrationRequest {

	private String firstName;
	private String lastName;
	private String emailID;
	private String password;
	private String confirmPassword;
	
	public UserRegistrationRequest() {
		super();
		// TODO Auto-generated constructor stub
	}

}
