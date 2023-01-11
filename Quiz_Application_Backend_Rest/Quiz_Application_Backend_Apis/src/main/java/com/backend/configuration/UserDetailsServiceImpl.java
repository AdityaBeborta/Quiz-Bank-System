package com.backend.configuration;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.backend.entity.User;
import com.backend.repo.UserRepo;
@Service
public class UserDetailsServiceImpl implements UserDetailsService{

	@Autowired
	private UserRepo userRepo;
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		User findByUsername = this.userRepo.findByUsername(username);
		
		if(findByUsername==null)
			throw new UsernameNotFoundException(username+" not found");
		
		return new UserDetailsImpl(findByUsername);
	}

}
