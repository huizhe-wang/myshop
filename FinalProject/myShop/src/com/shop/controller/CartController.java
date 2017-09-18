package com.shop.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shop.model.Cart;
import com.shop.model.CartItem;
import com.shop.model.Product;
import com.shop.service.ProductService;

@Controller
public class CartController {
	@Resource
	private ProductService productService;
	
	//turn to cart page
	@RequestMapping("/myCart")
	public String myCart() {
		return "cart";
	}
	
	//clear cart
	@RequestMapping(value="/clearCart")
	public String clearCart(HttpSession session){
		Cart cart = (Cart) session.getAttribute("cart");
		cart.clearCart();
		return "cart";
	}
	
	//remove product in cart
	@RequestMapping(value="/removeCart/{pid}")
	public String removeCart(@PathVariable("pid") Integer pid, HttpSession session){
		//get object
		Cart cart = (Cart) session.getAttribute("cart");
		//remove product by id
		cart.removeCart(pid);
		return "cart";
	}
	
	//add cart
	@RequestMapping(value="/addCart")
	public String addCart(Integer pid, Integer count, HttpSession session){
		Product product = productService.findByPid(pid);
		CartItem cartItem = new CartItem();
		cartItem.setCount(count);
		cartItem.setProduct(product);
		Cart cart = (Cart) session.getAttribute("cart");
		if(cart == null) {
			cart = new Cart();
			session.setAttribute("cart", cart);
		}
		// add product to cart
		cart.addCart(cartItem);
		return "cart";
	}
	
}
