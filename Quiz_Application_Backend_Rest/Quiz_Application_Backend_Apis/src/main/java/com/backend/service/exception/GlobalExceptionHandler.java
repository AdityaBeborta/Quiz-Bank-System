package com.backend.service.exception;

import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import com.backend.utility.Message;

@ControllerAdvice
public class GlobalExceptionHandler {

	@ExceptionHandler(UserAlreadyExistException.class)
	public String ex1(UserAlreadyExistException e,Model m) {
		String message = e.getMessage();
		System.out.println(message);
		Message msg=new Message(message, "danger");
		m.addAttribute("message",msg);
		System.out.println("called ");
		return "register";
	}
	
	@ExceptionHandler(UsernameNotFoundException.class)
	public String ex2(UsernameNotFoundException e,Model m) {
		String message = e.getMessage();
		System.out.println(message);
		Message msg=new Message(message, "danger");
		m.addAttribute("message",msg);
		System.out.println("called ");
		return "register";
	}
	
	@ExceptionHandler(Exception.class)
	public String ex3(Exception e) {
		return "forbidden";
	}
}
