package com.shop.service;

import java.util.List;

import com.shop.model.CategorySecond;

public interface AdminCategorySecondService {
	
	public List<CategorySecond> listCategorySecond(Integer page);

	//count pages of the second category
	public Integer countCategorySecond();
	
	//add second category
	public void addCategorySecond(CategorySecond categorySecond); 

	//delete second category
	public void deleteCategorySecond(Integer csid); 

	//find one second category
	public CategorySecond findCategorySecond(Integer csid); 

	//update second category
	public void updateCategorySecond(CategorySecond categorySecond);
	
	//find all second category
	public List<CategorySecond> listCategorySecond();
}
