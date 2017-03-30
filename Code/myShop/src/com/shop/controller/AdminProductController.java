package com.shop.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.shop.model.CategorySecond;
import com.shop.model.Product;
import com.shop.service.AdminCategorySecondService;
import com.shop.service.AdminProductService;

@Controller
public class AdminProductController {
	
	@Resource
	private AdminProductService adminProductService;
	@Resource
	private AdminCategorySecondService adminCategorySecondService;
	
	//update product
	@RequestMapping(value="/updateProduct")
	public ModelAndView updateProduct(@ModelAttribute("product") Product product
			,@RequestParam("upload")  CommonsMultipartFile upload,HttpServletRequest request,Integer csid){
		ServletContext servletContext = request.getSession().getServletContext();
		//query product
		Product oldProduct = adminProductService.findProduct(product.getPid());
		//getImage()
		int begin = oldProduct.getImage().lastIndexOf("/");
		String filename = oldProduct.getImage().substring(begin+1,oldProduct.getImage().length());
		System.out.println(filename);
		//getName()
		String uploadFilename = upload.getOriginalFilename();
		//the new one isn't the old image
		if(filename != uploadFilename && !"".equals(uploadFilename)){
			//get path
			String path = servletContext.getRealPath("/products/3");
			try {
				FileUtils.writeByteArrayToFile(new File(path,uploadFilename), upload.getBytes());
			} catch (IOException e) {
				e.printStackTrace();
			}
			//reset image path
			product.setImage("products/3/"+uploadFilename);
			//update date
			product.setPdate(new Date());
			//delete old image
			path = request.getSession().getServletContext().getRealPath("/"+oldProduct.getImage());
			File file = new File(path);
			file.delete();
		}else{
			product.setPdate(new Date());
		}
		//update image
		if(csid != null){
			//the second category
			CategorySecond categorySecond = adminCategorySecondService.findCategorySecond(csid);
			product.setCategorySecond(categorySecond);
		}
		adminProductService.updateProduct(product);
		ModelAndView modelAndView = new ModelAndView("redirect:/listProduct/1");
		return modelAndView;
	}
	
	//edit product
	@RequestMapping(value="/editProduct/{pid}")
	public ModelAndView editProduct(@PathVariable("pid") Integer pid){
			ModelAndView modelAndView = new ModelAndView("admin/product/edit");
			//query the set of second category
			List<CategorySecond> categorySeconds = adminCategorySecondService.listCategorySecond();
			modelAndView.addObject("categorySeconds", categorySeconds);
			//query product
			Product product = adminProductService.findProduct(pid);
			modelAndView.addObject("product", product);
			return modelAndView;	
	}
	
	//delete product
	@RequestMapping(value="/deleteProduct/{pid}")
	public ModelAndView deleteProduct(@PathVariable("pid") Integer pid,HttpServletRequest request){
		//get object
		Product product = adminProductService.findProduct(pid);
		//get path
		String path = request.getSession().getServletContext().getRealPath("/" + product.getImage());
		File file = new File(path);
		// delete image
		file.delete();
		//delete from product
		adminProductService.deleteProduct(product);
		ModelAndView modelAndView = new ModelAndView("redirect:/listProduct/1");
		return modelAndView;
	}
	
	//add product
	@RequestMapping(value="/addProduct",method=RequestMethod.POST)
	public ModelAndView addProduct(@ModelAttribute("product") Product product,
			@RequestParam("upload")  CommonsMultipartFile upload,HttpServletRequest request, Integer csid){	
		//get path
		ServletContext servletContext = request.getSession().getServletContext();
		String path = servletContext.getRealPath("/products/3");
		//get name
		String filename = upload.getOriginalFilename();
		try {
			FileUtils.writeByteArrayToFile(new File(path,filename), upload.getBytes());
		} catch (IOException e) {
			e.printStackTrace();
		}
		//setImage path
		product.setImage("products/3/"+filename);
		//set data
		product.setPdate(new Date());
		//set the second category
		CategorySecond categorySecond = adminCategorySecondService.findCategorySecond(csid);
		product.setCategorySecond(categorySecond);
		//save product
		adminProductService.saveProduct(product);
		ModelAndView modelAndView = new ModelAndView("redirect:/listProduct/1");
		return modelAndView;
	}
	
	//turn to add page
	@RequestMapping(value="/gotoAddProduct")
	public ModelAndView gotoAddProduct(){
		ModelAndView modelAndView = new ModelAndView("admin/product/add");
		//query all the second category
		List<CategorySecond> categorySeconds = adminCategorySecondService.listCategorySecond();
		modelAndView.addObject("categorySeconds", categorySeconds);
		return modelAndView;
	}
	
	//query all the products
	@RequestMapping(value="/listProduct/{page}")
	public String listProduct(@PathVariable("page") Integer page,Map<String,Object> map){
		//query products
		List<Product> products = adminProductService.listProduct(page);
		//query page
		Integer count = adminProductService.countProduct();
		map.put("products",products);
		map.put("page", page);
		map.put("count", count);
		return "admin/product/list";
	}
}
