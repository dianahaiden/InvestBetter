package com.UGAHacks.InvestBetter.Model;

import java.util.Optional;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.UGAHacks.InvestBetter.View.State;
import com.UGAHacks.InvestBetter.View.User;

@Repository
@Transactional(readOnly = true)
public interface UserRepository extends CrudRepository<User, Integer>{
	
	Optional<User> findByEmailID(String emailID);
	
	@Query("SELECT u from Users u where u.emailID = :email")
	public User findEmailID(@Param("email") String emailID);
	
	@Transactional
    @Modifying
    @Query("UPDATE Users u " +
            "SET u.enabled = TRUE, u.state = ?2 WHERE u.emailID = ?1")
    int enableUser(String emailID, State state);

}
