package com.shop.dao;

import java.util.List;

import com.shop.model.Product;

public interface ProductDao extends BaseDao<Product>{
	
	
	public List<Product> findHot();
	
	public List<Product> findNew();
	
	//query product by the second category
	public List<Product> findByCategorySecondCsid(Integer csid,Integer page);
	
	//query product by category
	public List<Product> findByCategorySecondCategoryCid(Integer cid,Integer page);

	public Integer CountPageProductFromCategory(Integer cid);
	
	public Integer CountPageProductFromCategorySecond(Integer csid);
	
	public Integer CountProduct();
	
	public Product findOne(Integer pid);
	
	public List<Product> findAll(Integer page);
	
	public List<Product> findLow();
	
	public List<Product> search(String value);
}
