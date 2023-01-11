package com.backend.services;

import java.util.List;

import com.backend.entity.Category;

public interface CategoryService {
	
	public Category addCategory(Category c);
	
	List<Category> getAll();
	
	void deleteCategory(int categoryId);
	
	Category updateCategory(Category c,Integer categoryId);
	
	Category getCategoryById(Integer categoryId);

}
