package com.UGAHacks.InvestBetter.Service;

import java.io.IOException;
import java.time.LocalDateTime;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.UGAHacks.InvestBetter.Request.UserRegistrationRequest;
import com.UGAHacks.InvestBetter.View.ConfirmationToken;
import com.UGAHacks.InvestBetter.View.State;
import com.UGAHacks.InvestBetter.View.User;
import com.UGAHacks.InvestBetter.View.UserType;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class UserRegistrationService {
	private final UserService userService;
	//private User user;
	//private Address address;
	private final EmailValidator emailValidator = new EmailValidator();
    private final ConfirmationTokenService confirmationTokenService;
    private final EmailSender emailSender;

    //To register user
	public String registerUser(UserRegistrationRequest request) {
		System.out.println("in service");
		String token = null;
		boolean isValidEmailID = emailValidator.test(request.getEmailID());
		if (!isValidEmailID) {
			throw new IllegalStateException("Email ID is not valid");
		}
		
		if (!request.getPassword().equals(request.getConfirmPassword())) {
			throw new IllegalStateException("Passwords do not match");
		}
		System.out.println("before user service");
		System.out.println(request.getFirstName() + ""+ request.getPassword());
		//signing up user
		token = userService.signUpUser(new User(
					request.getFirstName(),
					request.getLastName(),
					request.getEmailID(),
					request.getPassword(),
					UserType.Registered_User,
					State.Inactive));
		
		System.out.println("after user service");

		//Sending email
		String link = "http://localhost:8080/registerUser/confirm?token=" + token;
		emailSender.send(request.getEmailID(), buildEmail(request.getFirstName(), link));
		System.out.println("1 "+token);
		return token;
	}	
	
	//To validate user using email
		@Transactional
	    public String confirmToken(String token) {
			
			 System.out.println("Inside token confirm");
			 System.out.println("3 "+token);
	        ConfirmationToken confirmationToken = confirmationTokenService
	                .getToken(token)
	                .orElseThrow(() ->
	                        new IllegalStateException("token not found"));

	        if (confirmationToken.getConfirmedTime() != null) {
	            throw new IllegalStateException("email already confirmed");
	        }

	        LocalDateTime expiredAt = confirmationToken.getExpiryTime();

	        if (expiredAt.isBefore(LocalDateTime.now())) {
	            throw new IllegalStateException("token expired");
	        }
	        System.out.println(token);

	        confirmationTokenService.setConfirmedTime(token);
	        userService.enableUser(
	                confirmationToken.getUser().getEmailID(),
	                confirmationToken.getUser().getState());
	        
	        return "login";
	    }
	
		private String buildEmail(String name, String link) {
	        return "<div style=\"font-family:Helvetica,Arial,sans-serif;font-size:16px;margin:0;color:#0b0c0c\">\n" +
	                "\n" +
	                "<span style=\"display:none;font-size:1px;color:#fff;max-height:0\"></span>\n" +
	                "\n" +
	                "  <table role=\"presentation\" width=\"100%\" style=\"border-collapse:collapse;min-width:100%;width:100%!important\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\">\n" +
	                "    <tbody><tr>\n" +
	                "      <td width=\"100%\" height=\"53\" bgcolor=\"#0b0c0c\">\n" +
	                "        \n" +
	                "        <table role=\"presentation\" width=\"100%\" style=\"border-collapse:collapse;max-width:580px\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\" align=\"center\">\n" +
	                "          <tbody><tr>\n" +
	                "            <td width=\"70\" bgcolor=\"#0b0c0c\" valign=\"middle\">\n" +
	                "                <table role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"border-collapse:collapse\">\n" +
	                "                  <tbody><tr>\n" +
	                "                    <td style=\"padding-left:10px\">\n" +
	                "                  \n" +
	                "                    </td>\n" +
	                "                    <td style=\"font-size:28px;line-height:1.315789474;Margin-top:4px;padding-left:10px\">\n" +
	                "                      <span style=\"font-family:Helvetica,Arial,sans-serif;font-weight:700;color:#ffffff;text-decoration:none;vertical-align:top;display:inline-block\">Confirm your email</span>\n" +
	                "                    </td>\n" +
	                "                  </tr>\n" +
	                "                </tbody></table>\n" +
	                "              </a>\n" +
	                "            </td>\n" +
	                "          </tr>\n" +
	                "        </tbody></table>\n" +
	                "        \n" +
	                "      </td>\n" +
	                "    </tr>\n" +
	                "  </tbody></table>\n" +
	                "  <table role=\"presentation\" class=\"m_-6186904992287805515content\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"border-collapse:collapse;max-width:580px;width:100%!important\" width=\"100%\">\n" +
	                "    <tbody><tr>\n" +
	                "      <td width=\"10\" height=\"10\" valign=\"middle\"></td>\n" +
	                "      <td>\n" +
	                "        \n" +
	                "                <table role=\"presentation\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"border-collapse:collapse\">\n" +
	                "                  <tbody><tr>\n" +
	                "                    <td bgcolor=\"#1D70B8\" width=\"100%\" height=\"10\"></td>\n" +
	                "                  </tr>\n" +
	                "                </tbody></table>\n" +
	                "        \n" +
	                "      </td>\n" +
	                "      <td width=\"10\" valign=\"middle\" height=\"10\"></td>\n" +
	                "    </tr>\n" +
	                "  </tbody></table>\n" +
	                "\n" +
	                "\n" +
	                "\n" +
	                "  <table role=\"presentation\" class=\"m_-6186904992287805515content\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"border-collapse:collapse;max-width:580px;width:100%!important\" width=\"100%\">\n" +
	                "    <tbody><tr>\n" +
	                "      <td height=\"30\"><br></td>\n" +
	                "    </tr>\n" +
	                "    <tr>\n" +
	                "      <td width=\"10\" valign=\"middle\"><br></td>\n" +
	                "      <td style=\"font-family:Helvetica,Arial,sans-serif;font-size:19px;line-height:1.315789474;max-width:560px\">\n" +
	                "        \n" +
	                "            <p style=\"Margin:0 0 20px 0;font-size:19px;line-height:25px;color:#0b0c0c\">Hi " + name + ",</p><p style=\"Margin:0 0 20px 0;font-size:19px;line-height:25px;color:#0b0c0c\"> Thank you for registering. Please click on the below link to activate your account: </p><blockquote style=\"Margin:0 0 20px 0;border-left:10px solid #b1b4b6;padding:15px 0 0.1px 15px;font-size:19px;line-height:25px\"><p style=\"Margin:0 0 20px 0;font-size:19px;line-height:25px;color:#0b0c0c\"> <a href=\"" + link + "\">Activate Now</a> </p></blockquote>\n Link will expire in 60 minutes. <p>See you soon</p>" +
	                "        \n" +
	                "      </td>\n" +
	                "      <td width=\"10\" valign=\"middle\"><br></td>\n" + 
	                "    </tr>\n" +
	                "    <tr>\n" +
	                "      <td height=\"30\"><br></td>\n" +
	                "    </tr>\n" +
	                "  </tbody></table><div class=\"yj6qo\"></div><div class=\"adL\">\n" +
	                "\n" +
	                "</div></div>";
	    }

}
