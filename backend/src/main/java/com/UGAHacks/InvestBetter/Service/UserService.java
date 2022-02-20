package com.UGAHacks.InvestBetter.Service;

import java.time.LocalDateTime;
import java.util.UUID;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.UGAHacks.InvestBetter.Model.UserRepository;
import com.UGAHacks.InvestBetter.View.ConfirmationToken;
import com.UGAHacks.InvestBetter.View.State;
import com.UGAHacks.InvestBetter.View.User;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class UserService implements UserDetailsService{
	private final static String USER_NOT_FOUND_ERROR = "User with email ID %s does not exist";
	private final UserRepository userRepository;
	private final BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
	private final ConfirmationTokenService confirmationTokenService;
	
	//To find user in repository
	@Override
	public UserDetails loadUserByUsername(String emailID) 
			throws UsernameNotFoundException {
		return userRepository.findByEmailID(emailID)
				.orElseThrow(() -> new UsernameNotFoundException(String.format(USER_NOT_FOUND_ERROR, emailID)));
	}
	
	//To sign up new user
	public String signUpUser(User user) {
		boolean userExists = userRepository.findByEmailID(user.getEmailID())
		.isPresent();
		
		if (userExists) {
			throw new IllegalStateException("Email already taken");
		}	
		
		String encodedPassword = bCryptPasswordEncoder.encode(user.getPassword());
		
		user.setPassword(encodedPassword);
		userRepository.save(user);

		//Generating new user token
		String token = UUID.randomUUID().toString();
		ConfirmationToken confirmationToken = new ConfirmationToken(
				token,
				LocalDateTime.now(),
				LocalDateTime.now().plusMinutes(60),
				user
				);
		
		confirmationTokenService.saveConfirmationToken(confirmationToken);
		return token;

	//To activate user account after email verification
	}
	public int enableUser(String emailID, State state) {
		if (state == State.Inactive)
			state = State.Active;
        return userRepository.enableUser(emailID,state);
    }
}
