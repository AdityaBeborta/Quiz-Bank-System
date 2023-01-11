package com.backend.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.backend.entity.Category;
import com.backend.entity.Question;
import com.backend.entity.Quiz;
import com.backend.entity.User;
import com.backend.repo.RoleRepo;
import com.backend.repo.UserRepo;
import com.backend.services.CategoryService;
import com.backend.services.QuestionService;
import com.backend.services.QuizService;
import com.backend.services.UserService;
import com.backend.utility.Message;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private UserService userService;

	@Autowired
	private RoleRepo roleRepo;

	@Autowired
	private UserRepo userRepo;
	
	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private QuizService quizService;

	
	@Autowired
	private QuestionService questionService;
	@ModelAttribute
	public void addCommonData(Principal principal, Model m) {
		String name = principal.getName();
		User user = this.userRepo.findByUsername(name);
		List<User> allUser = this.userRepo.findAll();
		List<Category> all = this.categoryService.getAll();
		List<Quiz> allQuiz = this.quizService.getAllQuiz();
		
		m.addAttribute("allquiz",allQuiz);
		m.addAttribute("allUser",allUser);
		m.addAttribute("allcategory",all);
		m.addAttribute("current_user", user);
	}

	@GetMapping("/")
	public String renderUserHomePage() {

		return "UserHomePage";
	}

	@GetMapping("/renderUserProfile")
	public String renderUserProfile() {
		return "profile";
	}

	@GetMapping("/renderAddCategoryForm")
	public String renderAddCategoryForm() {
		return "addcategoryform";
	}

	@PostMapping("/addCategory")
	public String addCategory(@ModelAttribute Category category,Model model) {
		this.categoryService.addCategory(category);
		model.addAttribute("message",new Message("successfully added","success"));
		return "addcategoryform";
	}
	
	@GetMapping("/renderAllCategory")
	public String renderAllCategory(Model model) {
		List<Category> all = this.categoryService.getAll();
		model.addAttribute("allcategory",all);
		return "showcategory";
	}
	@RequestMapping("/delete/{categoryId}")
	public String delete(@PathVariable Integer categoryId,Model model) {
		
		this.categoryService.deleteCategory(categoryId);
		Message message=new Message("deleted successfully","success");
		model.addAttribute("message",message);
		return "showcategory";
	}
	
	@GetMapping("/renderCategoryUpdateForm/{categoryId}")
	public String renderCategoryUpdateForm(@PathVariable Integer categoryId,Model model)
	{
		Category categoryById = this.categoryService.getCategoryById(categoryId);
		model.addAttribute("category", categoryById);
		return "updatecategory";
	}
	@PostMapping("/update/{categoryId}")
	public String update(@ModelAttribute Category category,@PathVariable Integer categoryId,Model model) {
		
		Category updateCategory = this.categoryService.updateCategory(category, categoryId);
		if(updateCategory!=null) {
			Message message=new Message("Successfully Updated!","primary");
			model.addAttribute("message",message);
		}
		else {
		Message message=new Message("Failed To Update!","danger");
		model.addAttribute("message",message);
		}
		return "showcategory";
	}
	
	//render add quiz form
	@GetMapping("/renderAddQuizForm")
	public String renderAddQuizForm() {
		return "addquizform";
	}
	
	@PostMapping("/addQuizInToDb")
	public String addQuiz(@ModelAttribute Quiz quiz,@RequestParam Integer categoryId,Model model) {
		
		
		
		Quiz addQuiz = this.quizService.addQuiz(quiz, categoryId);
		if(addQuiz!=null) {
			model.addAttribute("message",new Message("added successfully","success"));
		}
		else {
			model.addAttribute("message",new Message("Something went Wrong!!","danger"));
		}
		return "addquizform";
	}
	@GetMapping("/allQuiz")
	public String renderAllQuizes() {
		return "showallquiz";
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
		
		return "allquestionpage";
	}
	@GetMapping("/renderAddQuestionForm/{quizId}")
	public String renderAddQuestionForm(Model m,@PathVariable Integer quizId) {
		Quiz singleQuiz = this.quizService.getSingleQuiz(quizId);
		m.addAttribute("singlequiz",singleQuiz);
		return "addquestionform";
	}
	
	@PostMapping("/addQuestion/{quizId}")
	public String addQuestion(@ModelAttribute Question question,@PathVariable Integer quizId,Model m) {
		Question addQuestion = this.questionService.addQuestion(question, quizId);
		Quiz singleQuiz = this.quizService.getSingleQuiz(quizId);
		m.addAttribute("singlequiz",singleQuiz);
		m.addAttribute("message", new Message("added Successfully", "success"));
		return "addquestionform";
	}
}
