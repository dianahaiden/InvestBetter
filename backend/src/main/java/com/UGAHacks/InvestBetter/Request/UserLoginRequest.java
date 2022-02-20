package com.UGAHacks.InvestBetter.Request;

import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.ToString;

@Getter
@AllArgsConstructor
@EqualsAndHashCode
@ToString
public class UserLoginRequest {

	private String emailID;
	private String password;

}
