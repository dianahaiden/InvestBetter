package com.UGAHacks.InvestBetter.Service;

public interface EmailSender {

	void send(String to, String email);
	
	String sendConfirmation(String emailID, String buildEmail);
}
