package com.backend.repo;

import org.springframework.data.jpa.repository.JpaRepository;

import com.backend.entity.User;

public interface UserRepo extends JpaRepository<User, Long>{

	User findByUsername(String userName);
}
