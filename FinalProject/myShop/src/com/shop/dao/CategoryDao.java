package com.shop.dao;

import java.util.List;

import com.shop.model.Category;

public interface CategoryDao extends BaseDao<Category>{
	
	//count number
	public Integer countCategory();
	//find all
	public List<Category> findAll(Integer page);
	
	public List<Category> findAll();
	
	public Category findOne(Integer cid);
}
