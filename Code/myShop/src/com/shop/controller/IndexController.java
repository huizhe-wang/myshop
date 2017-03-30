package com.shop.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shop.service.CategoryService;
import com.shop.service.ProductService;

@Controller
public class IndexController {
	@Resource
	private CategoryService categoryService;
	
	@Resource
	private ProductService productService;
	
	//index
	@RequestMapping(value="/index")
	public String showIndex(Map<String,Object> map,HttpSession session){
		//put all the category to session
		session.setAttribute("cList", categoryService.getCategory());;
		//put the newest list into map
		map.put("nList", productService.findNew());
		//put the Best Sales into map
		map.put("hList", productService.findHot());
		//put the lowest prices into map
		map.put("lList", productService.findLow());
		
		return "index"; 
	}
}
