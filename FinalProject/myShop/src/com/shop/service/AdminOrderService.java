package com.shop.service;

import java.util.List;

import com.shop.model.Order;

public interface AdminOrderService {
	
	//query order
	public Order findOrder(Integer oid);
	
	//save or update order
	public void saveOrUpdateOrder(Order order);
	
	//delete order
	public void deleteOrder(Order order);
	
	//query orders
	public List<Order> listOrder(Integer page,Integer rows);
	
	//count pages
	public Integer countOrder();
	
}
