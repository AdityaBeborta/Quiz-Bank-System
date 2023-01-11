package com.backend.repo;

import org.springframework.data.jpa.repository.JpaRepository;

import com.backend.entity.Quiz;

public interface QuizRepo extends JpaRepository<Quiz, Integer>{

}
