package com.backend.services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.backend.entity.Quiz;

public interface QuizService {

	public Quiz addQuiz(Quiz quiz,int categoryId);
	
	public Quiz updateQuiz(Quiz quiz,Integer quizId);
	
	public List<Quiz> getAllQuiz();
	
	public Quiz getSingleQuiz(Integer quizId);
	
	public void deleteQuiz(Integer quizId);
}
