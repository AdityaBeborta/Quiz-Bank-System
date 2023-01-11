package com.backend.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.backend.entity.Role;
import com.backend.entity.User;
import com.backend.repo.QuizRepo;
import com.backend.repo.RoleRepo;
import com.backend.repo.UserRepo;
import com.backend.services.UserService;
import com.backend.utility.Message;

@Controller
@RequestMapping("/home")
public class UtilityController {

	@Autowired
	private UserService userService;
	
	@Autowired
	private RoleRepo roleRepo;
	
	@Autowired
	private UserRepo userRepo;
	
	@Autowired
	private QuizRepo quizRepo;

	@PostMapping("/addUser")
	public String doRegister(@ModelAttribute User user, Model m) {

		User registerUser = this.userService.registerUser(user);
		Message msg = new Message(user.getUsername() + " registered successfully", "success");

		m.addAttribute("message", msg);
		return "register";
	}

	@GetMapping("/")
	public String renderHomePage() {
		return "home";
	}

	@GetMapping("/renderRegPage")
	public String renderregPage() {
		return "register";
	}

	@GetMapping("/renderLoginPage")
	public String renderLoginPage() {
		return "login";
	}

	@PostMapping("/doLogin")
	public String doLogin(Model m) {
		System.out.println("hello");
		return "login";
	}
	
	@GetMapping("/accessDenied")
	public String renderAccessDenied() {
		return "forbidden";
	}
	
	@GetMapping("/renderChangePassword")
	public String renderChangePassword(Principal p,Model m) {
		String name = p.getName();
		User user = this.userRepo.findByUsername(name);
		m.addAttribute("current_user",user);
		
		return "changepassword";
	}
	
	@PostMapping("/processChangePasswordForm")
	public String processChangePasswordForm(Model m,Principal p,@RequestParam String oldPassword,@RequestParam String newPassword) {
		String name = p.getName();
		User user = this.userRepo.findByUsername(name);
		Message msg = this.userService.updatePassword(user, oldPassword, newPassword);
		m.addAttribute("current_user",user);
		m.addAttribute("message", msg);
		return "changepassword";
	}
	

	}
	
		


