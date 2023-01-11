package com.backend.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.backend.entity.Category;
import com.backend.entity.Quiz;
import com.backend.repo.CategoryRepo;
import com.backend.repo.QuizRepo;
import com.backend.services.QuizService;
@Service
public class QuizServiceImpl implements QuizService {

	@Autowired
	private QuizRepo quizRepo;
	
	@Autowired
	private CategoryRepo categoryRepo;

	@Override
	public Quiz addQuiz(Quiz quiz,int categoryId) {
		Category category = this.categoryRepo.findById(categoryId).get();
		quiz.setCategory(category);
		Quiz save = this.quizRepo.save(quiz);
		return save;
	}

	@Override
	public Quiz updateQuiz(Quiz quiz, Integer quizId) {
		Quiz quizFromDb = this.quizRepo.findById(quizId).get();
		quizFromDb.setTitle(quiz.getTitle());
		quizFromDb.setDescription(quiz.getDescription());
		Quiz savedQuiz = this.quizRepo.save(quizFromDb);
		return savedQuiz;
	}

	@Override
	public List<Quiz> getAllQuiz() {
		// TODO Auto-generated method stub
		return this.quizRepo.findAll();
	}

	@Override
	public Quiz getSingleQuiz(Integer quizId) {
		
		return this.quizRepo.findById(quizId).get();
	}

	@Override
	public void deleteQuiz(Integer quizId) {
		this.quizRepo.deleteById(quizId);

	}

}
