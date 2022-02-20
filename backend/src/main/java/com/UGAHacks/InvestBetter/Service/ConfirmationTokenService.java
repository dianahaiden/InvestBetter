package com.UGAHacks.InvestBetter.Service;

import java.time.LocalDateTime;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.UGAHacks.InvestBetter.Model.ConfirmationTokenRepository;
import com.UGAHacks.InvestBetter.View.ConfirmationToken;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class ConfirmationTokenService {

private final ConfirmationTokenRepository confirmationTokenRepository;
	
	public void saveConfirmationToken(ConfirmationToken token) {
		confirmationTokenRepository.save(token);
	}
	
	public Optional<ConfirmationToken> getToken(String token) {
        return confirmationTokenRepository.findByToken(token);
    }

    public int setConfirmedTime(String token) {
        return confirmationTokenRepository.updateConfirmedTime(
                token, LocalDateTime.now());
    }
}
