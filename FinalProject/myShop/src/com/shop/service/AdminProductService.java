package com.shop.service;

import java.util.List;

import com.shop.model.Product;

public interface AdminProductService {
	//query products 
	public List<Product> listProduct(Integer page);
	
	//query page
	public Integer countProduct();
	
	//save product
	public void saveProduct(Product product);

	//query one product
	public Product findProduct(Integer pid);
	
	//delete product
	public void deleteProduct(Product product);
	
	//update product
	public void updateProduct(Product product);
}
