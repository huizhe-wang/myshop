package com.shop.service;

import java.util.List;

import com.shop.model.Category;

public interface AdminCategoryService {
	
	// query all categories
	public List<Category> listCategory(Integer page);
	
	// count pages of category
	public Integer countCategory();
	
	//add category
	public void addCategory(Category category);
	
	//delete category
	public void deleteCategory(Integer cid);

	//find one category
	public Category findCategory(Integer cid);

	//update category
	public void updateCategory(Category category);

	public List<Category> findCategory();
}
