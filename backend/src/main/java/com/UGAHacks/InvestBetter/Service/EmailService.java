package com.UGAHacks.InvestBetter.Service;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.slf4j.Logger;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class EmailService implements EmailSender{
	
	private final static Logger LOGGER = org.slf4j.LoggerFactory.getLogger(EmailService.class);

	private final JavaMailSender mailSender;
	
	@Override
	@Async
	public void send(String to, String email) {
		// TODO Auto-generated method stub
		try {
			MimeMessage mimeMessage = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, "utf-8");
			helper.setText(email, true);
			helper.setTo(to);
			helper.setSubject("Confirm your email");
			helper.setFrom("Confirmation@InvestBetter.tech");
			mailSender.send(mimeMessage);
		} catch (MessagingException e) {
			LOGGER.error("failed to send an email", e);
			throw new IllegalStateException("failed to send an email");
		}
	}
	
	@Async
	public String sendConfirmation(String to, String email) {
		// TODO Auto-generated method stub
		try {
			MimeMessage mimeMessage = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, "utf-8");
			helper.setText(email, true);
			helper.setTo(to);
			helper.setSubject("Stocks Added!");
			helper.setFrom("Updates@InvestBetter.tech");
			mailSender.send(mimeMessage);
		} catch (MessagingException e) {
			LOGGER.error("failed to send an email", e);
			throw new IllegalStateException("failed to send an email");
		}
		return "Email sent successfully";
	}

}
