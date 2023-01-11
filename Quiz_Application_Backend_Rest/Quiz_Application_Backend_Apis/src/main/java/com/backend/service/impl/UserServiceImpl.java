package com.backend.service.impl;

import java.util.HashSet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.backend.entity.Role;
import com.backend.entity.User;
import com.backend.repo.RoleRepo;
import com.backend.repo.UserRepo;
import com.backend.service.exception.UserAlreadyExistException;
import com.backend.services.UserService;
import com.backend.utility.Message;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserRepo userRepo;

	@Autowired
	private RoleRepo roleRepo;

	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;


	@Override
	public User registerUser(User user) {
		if (userRepo.findByUsername(user.getUsername()) != null)
			throw new UserAlreadyExistException("user " + user.getUsername() + " already exist");
		user.setProfile("default.png");
		HashSet<Role> hs = new HashSet<Role>();
		Role role = this.roleRepo.findById(2).get();
		hs.add(role);
		user.setRoles(hs);
		user.setPassword(this.bCryptPasswordEncoder.encode(user.getPassword()));
		User registeredUser = this.userRepo.save(user);
		return registeredUser;
	}

	@Override
	public User getUser(String userName) {
		User findByUserName = this.userRepo.findByUsername(userName);
		return findByUserName;
	}

	@Override
	public void deleteUser(Long id) {
		User user = this.userRepo.findById(id)
				.orElseThrow(() -> new UsernameNotFoundException("sorry user does not exist"));
		this.userRepo.delete(user);

	}

	@Override
	public Message updatePassword(User user, String oldPassword, String newPassword) {
		Message message=null;
		boolean matches = this.bCryptPasswordEncoder.matches(oldPassword,user.getPassword());
		if(matches) {
			user.setPassword(this.bCryptPasswordEncoder.encode(newPassword));
			this.userRepo.save(user);
			return new Message("changed Successfuly", "success");
		}
		
		return new Message("old password is incorrect", "danger");
	}

}
