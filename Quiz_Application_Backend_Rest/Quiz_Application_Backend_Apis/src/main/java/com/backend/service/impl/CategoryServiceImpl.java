package com.backend.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.backend.entity.Category;
import com.backend.repo.CategoryRepo;
import com.backend.services.CategoryService;

@Service
public class CategoryServiceImpl implements CategoryService {

	@Autowired
	private CategoryRepo categoryRepo;
	@Override
	public Category addCategory(Category category) {
		Category savedCategory = this.categoryRepo.save(category);
		return savedCategory;
	}
	@Override
	public List<Category> getAll() {
		List<Category> findAll = this.categoryRepo.findAll();
		return findAll;
	}
	@Override
	public void deleteCategory(int categoryId) {
		System.out.println(categoryId);
		this.categoryRepo.deleteById(categoryId);
		
		
	}
	@Override
	public Category updateCategory(Category c, Integer categoryId) {
		Category categoryFromDb = this.categoryRepo.findById(categoryId).get();
		categoryFromDb.setContent(c.getContent());
		categoryFromDb.setTitle(c.getTitle());
		Category updatedCategory = this.categoryRepo.save(categoryFromDb);
		return updatedCategory;
	}
	@Override
	public Category getCategoryById(Integer categoryId) {
		
		return this.categoryRepo.findById(categoryId).get();
	}

}
