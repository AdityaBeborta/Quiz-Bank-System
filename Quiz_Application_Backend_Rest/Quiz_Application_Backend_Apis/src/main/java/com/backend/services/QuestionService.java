package com.backend.services;

import java.util.List;

import com.backend.entity.Question;
import com.backend.entity.Quiz;

public interface QuestionService {

	public Question addQuestion(Question question,Integer quizId);
	
	public Question updateQuestion(Question question,Integer questionId);
	
	public List<Question> getAllQuestion();
	
	public Question getQuestion(Integer questionId);
	
	public List<Question> getQuestionsOfQuiz(Quiz quiz);
}
