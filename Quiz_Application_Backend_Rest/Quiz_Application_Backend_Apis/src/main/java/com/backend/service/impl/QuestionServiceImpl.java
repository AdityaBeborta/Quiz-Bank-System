package com.backend.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.backend.entity.Question;
import com.backend.entity.Quiz;
import com.backend.repo.QuestionRepo;
import com.backend.repo.QuizRepo;
import com.backend.services.QuestionService;
@Service
public class QuestionServiceImpl implements QuestionService {

	@Autowired
	private QuestionRepo questionRepo;
	
	@Autowired
	private QuizRepo quizRepo;
	@Override
	public Question addQuestion(Question question,Integer quizId) {
		
		Quiz quiz = this.quizRepo.findById(quizId).get();
		
		question.setQuiz(quiz);
		return this.questionRepo.save(question);
	}

	@Override
	public Question updateQuestion(Question question, Integer questionId) {
		Question question2 = this.questionRepo.findById(questionId).get();
		question2.setAnswer(question.getAnswer());
		question2.setOption1(question.getOption1());
		question2.setOption2(question.getOption2());
		question2.setOption3(question.getOption3());
		question2.setOption4(question.getOption4());
		question2.setQuestion_Name(question.getQuestion_Name());
		return this.questionRepo.save(question2);
		
	}

	@Override
	public List<Question> getAllQuestion() {
		
		return this.questionRepo.findAll();
	}

	@Override
	public Question getQuestion(Integer questionId) {
		Question question = this.questionRepo.findById(questionId).get();
		return question;
	}

	@Override
	public List<Question> getQuestionsOfQuiz(Quiz quiz) {
		
		return this.questionRepo.findByQuiz(quiz);
	}

}
