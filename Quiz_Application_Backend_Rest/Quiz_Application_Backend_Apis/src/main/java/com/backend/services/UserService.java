package com.backend.services;

import com.backend.entity.User;
import com.backend.utility.Message;

public interface UserService {

	public User registerUser(User user);
	
	public User getUser(String userName);
	
	public void deleteUser(Long id);
	
	public Message updatePassword(User user,String oldPassword,String newPassword);
	
	
}
