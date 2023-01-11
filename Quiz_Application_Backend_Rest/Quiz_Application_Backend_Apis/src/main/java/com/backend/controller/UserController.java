package com.backend.controller;

import java.security.Principal;
import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.backend.entity.Category;
import com.backend.entity.Question;
import com.backend.entity.Quiz;
import com.backend.entity.User;
import com.backend.services.CategoryService;
import com.backend.services.QuizService;
import com.backend.services.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private QuizService quizService;

	@ModelAttribute
	public void addCommonDataToAllHandlers(Principal principal,Model model) {
		String name = principal.getName();
		User findByUsername = this.userService.getUser(name);
		List<Category> all = this.categoryService.getAll();
		List<Quiz> allQuiz = this.quizService.getAllQuiz();
		model.addAttribute("allQuiz",allQuiz);
		model.addAttribute("allCategory",all);
		model.addAttribute("current_user",findByUsername);
	}
	
	//render user home page
	@GetMapping
	public String renderUserHomePage() {
		return "normal/userhome";
	}
	
	@GetMapping("/renderAllQuestions/{quizId}")
	public String allQuestionPage(@PathVariable int quizId,Model m) {
	
		Quiz singleQuiz = this.quizService.getSingleQuiz(quizId);
		m.addAttribute("quiz",singleQuiz);
		List<Question> question = singleQuiz.getQuestion();

		if(question.size()>Integer.parseInt(singleQuiz.getNumberOfQuestion())) {
			question=question.subList(0, Integer.parseInt(singleQuiz.getNumberOfQuestion()+1));
			m.addAttribute("question",question);
		}
		else {
			System.out.println("else");
			m.addAttribute("question",question);
		}
		
		
		return "normal/allquestionpage";
	}
	
	@GetMapping("/renderInstructionpageBeforeQuiz/{quizId}")
	public String renderInstructionpageBeforeQuiz(Model m,@PathVariable Integer quizId) {
		m.addAttribute("quizId",quizId);
		return "normal/instructionPage";
	}
	
	
}
