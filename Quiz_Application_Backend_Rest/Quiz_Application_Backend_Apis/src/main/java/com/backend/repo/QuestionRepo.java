package com.backend.repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.backend.entity.Question;
import com.backend.entity.Quiz;

public interface QuestionRepo extends JpaRepository<Question, Integer> {

	List<Question> findByQuiz(Quiz quiz);
}
