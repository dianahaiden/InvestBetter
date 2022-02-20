package com.UGAHacks.InvestBetter.View;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@Entity
public class ConfirmationToken {
	@SequenceGenerator(
			name = "confirmation_token_sequence",
			sequenceName = "confirmation_token_sequence",
			allocationSize = 1
			)
	@Id
	@GeneratedValue(
			strategy = GenerationType.SEQUENCE,
			generator = "confirmation_token_sequence"
			)	
	private int id;
	@Column(nullable = false)
	private String token;
	
	@Column(nullable = false)
	private LocalDateTime createdTime;
	@Column(nullable = false)
	private LocalDateTime expiryTime;
	
	private LocalDateTime confirmedTime;
	
	@ManyToOne
	@JoinColumn(nullable = false, name = "userId")
	private User user;
	
	public ConfirmationToken(String token, LocalDateTime createdTime, LocalDateTime expiryTime,
			User user) {
		this.token = token;
		this.createdTime = createdTime;
		this.expiryTime = expiryTime;
		this.user = user;
	}
}
