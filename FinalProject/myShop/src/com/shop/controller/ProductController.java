package com.shop.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.shop.model.Product;
import com.shop.service.ProductService;

@Controller
public class ProductController {
	
	@Resource
	private ProductService productService;
	
	//query product by second category
	@RequestMapping(value="findByCsid/{csid}/{page}")
	public String findByCsid(@PathVariable("csid") Integer csid,@PathVariable("page") Integer page
			,Map<String,Object> map){
		Integer count = productService.CountPageProductFromCategorySecond(csid);
		if(page > count){
			page = 1;
		}
		List<Product> products = productService.findByCsid(csid, page);
		map.put("products", products);
		//put pages in map
		map.put("page", page);
		//count pages
		map.put("count",count);
		map.put("csid", csid);
		return "productList";
	}
	
	//query product by category
	@RequestMapping(value="/findByCid/{cid}/{page}")
	public String findByCid(@PathVariable("cid") Integer cid,@PathVariable("page") Integer page
			,Map<String,Object> map){
		List<Product> products = productService.findByCid(cid, page);
		Integer count = productService.CountPageProductFromCategory(cid);
		if(page > count){
			page = 1;
		}
		map.put("products", products);
		map.put("page", page);
		map.put("count",count);
		map.put("cid", cid);
		return "productList";
	}
	
	//query product by id
	@RequestMapping(value="findByPid/{pid}",method=RequestMethod.GET)
	public String findByPid(@PathVariable("pid") Integer pid,Map<String,Product> map){
		map.put("product", productService.findByPid(pid));
		return "product";
	}
	
	//search product by information
	@RequestMapping(value="searchProduct",method=RequestMethod.GET)
	public String searchProduct(HttpServletRequest request) throws UnsupportedEncodingException{
		 String search = new String(request.getParameter("search").getBytes("ISO-8859-1"),"UTF-8");
		 if(productService.search(search) != null){
		 request.setAttribute("pList", productService.search(search));
		 }
		return "search";
	}
	
	
}
