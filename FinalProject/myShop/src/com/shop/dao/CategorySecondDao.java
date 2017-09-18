package com.shop.dao;

import java.util.List;

import com.shop.model.CategorySecond;

public interface CategorySecondDao extends BaseDao<CategorySecond>{
	
	//count number
	public Integer countCategorySecond();
	//find all
	public List<CategorySecond> findAll(Integer page);
	
	public List<CategorySecond> findAll();
	
	public CategorySecond findOne(Integer cid);
	
}
