package com.shop.service;

import java.util.List;

import com.shop.model.Order;
import com.shop.model.OrderItem;

public interface OrderService {
	
	// save order
	public void save(Order order) ;

	// query orders by id
	public List<Order> findByUid(Integer uid,Integer page);

	// query order by id
	public Order findByOid(Integer oid) ;

	// update order
	public void update(Order currOrder) ;

	// query all order
	public List<Order> findAll(Integer page) ;

	// query orderItem
	public List<OrderItem> findOrderItem(Integer oid) ;

	public Integer findCountByUid(Integer uid);
	
}
