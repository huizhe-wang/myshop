package com.shop.controller;

import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shop.model.Cart;
import com.shop.model.CartItem;
import com.shop.model.Order;
import com.shop.model.OrderItem;
import com.shop.model.User;
import com.shop.service.OrderService;

@Controller
public class OrderController {
	
	@Resource
	private OrderService orderService;
	
	//query order by id
	@RequestMapping(value="findByOid/{oid}")
	public String findByOid(@PathVariable("oid") Integer oid,
			Map<String,Object> map){
		Order order = orderService.findByOid(oid);
		map.put("order",order);
		return "order";
	} 
	
	//query order
	@RequestMapping(value="findOrderByUid/{page}")
	public String findOrderByUid(HttpSession session,Map<String,Object> map
			,@PathVariable("page") Integer page){
		//get object from session
		User user = (User) session.getAttribute("user");
		if(user == null){
			map.put("notLogin", "notLogin");
			return "msg";
		}
		//count pages
		Integer count = orderService.findCountByUid(user.getUid());
		if(page > count){
			page = 1;
		}
		//query order by id
		List<Order> orders = orderService.findByUid(user.getUid(), page);
		map.put("orders", orders);
		map.put("page", page);
		map.put("count",count);
		return "orderList";
	}
	
	//save order
	@RequestMapping(value="saveOrder")
	public String saveOrder(HttpSession session,Map<String,Object> map){
		//session: judge whether users login or not
		User user = (User) session.getAttribute("user");
		if(user == null){
			map.put("notLogin","noLogin");
			return "msg";
		}
		//get my cart
		Cart cart = (Cart) session .getAttribute("cart");
		//if null, return myCart
		if(cart == null){
			return "redirect:myCart";
		}
		//object of order
		Order order = new Order();
		order.setTotal(cart.getTotal());
		// state
		order.setState(1);
		// setOrderTime
		order.setOrdertime(new Date());
		// setUser
		order.setUser(user);
		// order set
		Set<OrderItem> sets = new HashSet<OrderItem>();
		for (CartItem cartItem : cart.getCartItems()) {
			// get order information from cart
			OrderItem orderItem = new OrderItem();			
			orderItem.setCount(cartItem.getCount());
			orderItem.setSubtotal(cartItem.getSubtotal());
			orderItem.setProduct(cartItem.getProduct());
			orderItem.setOrder(order);
			//add orderItem to sets
			sets.add(orderItem);
		}
		
		order.setOrderItems(sets);
		orderService.save(order);
		//clear cart
		cart.clearCart();
		map.put("order",order);
		return "order";
	}
	
	/* 
	 * address, name, phone, order id
	 */
	@RequestMapping(value="/payOrder")
	public String payOrder(Integer oid, String addr,String name, String phone,
			String pd_FrpId,HttpServletResponse response){
		Order order = orderService.findByOid(oid);
		order.setAddr(addr);
		order.setName(name);
		order.setPhone(phone);
		//update order
		orderService.update(order);
		
		return "payOrder";
	}

}
