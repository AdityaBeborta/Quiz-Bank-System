package com.backend.repo;

import org.springframework.data.jpa.repository.JpaRepository;import com.backend.entity.Role;

public interface RoleRepo extends JpaRepository<Role, Integer>{

}
