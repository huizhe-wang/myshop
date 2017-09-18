package com.shop.service;

import java.util.List;

import com.shop.model.Product;

public interface ProductService {
	
	//query product by second category
	public List<Product> findByCsid(Integer csid, Integer page);

	//query product by category
	public List<Product> findByCid(Integer cid,Integer page);
	
	//query the hottest products
	public List<Product> findHot();
	
	//query the lowest price
	public List<Product> findLow();
	
	//query the newest products
	public List<Product> findNew();

	//query products by id
	public Product findByPid(Integer pid);
	
	//count pages (category)
	public Integer CountPageProductFromCategory(Integer cid);

	//count pages (second category)
	public Integer CountPageProductFromCategorySecond(Integer csid);
	
	//search products
	public List<Product> search(String value) ;

}
