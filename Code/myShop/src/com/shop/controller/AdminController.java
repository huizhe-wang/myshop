package com.shop.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.RedirectView;

import com.shop.model.Admin;
import com.shop.model.User;
import com.shop.service.AdminService;

@Controller
public class AdminController {

	@Resource
	private AdminService adminService;

	@ModelAttribute(value="user")
	public void getUser(@RequestParam(value="uid",required=false) Integer uid,Map<String,Object> map){
		 if(uid != null){
			 User user = adminService.findUserByUid(uid);
			 map.put("user", user);
		 }
	}
	//update User
	@RequestMapping(value="/updateUser")
	public ModelAndView updateUser(@ModelAttribute("user") User user,@RequestParam("upload")  CommonsMultipartFile upload,HttpServletRequest request){
		ServletContext servletContext = request.getSession().getServletContext();
		
		String uploadFilename = upload.getOriginalFilename();
       

		if(uploadFilename != null && !uploadFilename.equals("")){
			   String path = servletContext.getRealPath("/userurl");
			   System.out.println(path);
				try {
					FileUtils.writeByteArrayToFile(new File(path,uploadFilename), upload.getBytes());
				} catch (IOException e) {
					e.printStackTrace();
				}
		
		       user.setUrl("userurl/"+uploadFilename);
		       
		}
		
		adminService.updateUser(user);
		ModelAndView model = new ModelAndView();
		model.setViewName("redirect:/listUser/1");
		return model;
	}
	//edit user
	@RequestMapping(value="/editUser/{uid}")
	public String editUser(@PathVariable("uid") Integer uid,@ModelAttribute("user") User user,Map<String,Object> map){
		user = adminService.findUserByUid(uid);
		map.put("user", user);
		return "admin/user/edit";
	}
	
	
	// delete user  uid: the ID of user  page: the current page
	@RequestMapping(value="/deleteUser/{uid}/{page}")
	public ModelAndView deleteUser(@PathVariable("uid") Integer uid,@PathVariable("page") Integer page){
		adminService.deleteUser(uid);
		ModelAndView model = new ModelAndView();
		model.setViewName("redirect:/listUser/"+page);
		return model;
	}
	//queries users
	@RequestMapping(value="/listUser/{page}")
	public String listUser(@PathVariable("page") Integer page,Map <String,Object> map) {
		//store the list of users
        List<User> users= adminService.findUser(page);
        //count the pages
        Integer count = adminService.countUser();
        map.put("count", count);
        map.put("page", page);
        map.put("users",users);
		return "admin/user/list";
	}

	@RequestMapping(value ="/adminLogin")
	public View adminLogin(HttpServletRequest request,Model model){
		Set<String> role = AuthorityUtils.authorityListToSet(SecurityContextHolder.getContext().getAuthentication().getAuthorities());
		if(role.contains("ROLE_ADMIN")){
			return new RedirectView(request.getContextPath()+"/admin/home");
		}else{
			return new RedirectView(request.getContextPath()+"/admin/index");
		}
	}
	// login admin
	@RequestMapping(value = "/adminLogin", method = RequestMethod.POST)
	public String adminLogin(Admin admin,
			HttpSession session) {
		Admin checkUser = adminService.checkUser(admin);
		if (null == checkUser) {
			return "admin/index";
		} else {
			session.setAttribute("admin", admin);
		}
		return "admin/home";
	}
	// admin index
	@RequestMapping(value = "/adminIndex")
	public String adminIndex() {
		return "admin/index";
	}
    //the top of admin index
	@RequestMapping("/adminTop")
	public String adminTop() {
		return "admin/top";
	}
	//the left of admin index
	@RequestMapping("/adminLeft")
	public String adminLeft() {
		return "admin/left";
	}
	//the right of admin index
	@RequestMapping("/adminWelcome")
	public String adminWelcome() {
		return "admin/welcome";
	}
    //the bottom of admin index
	@RequestMapping("/adminBottom")
	public String adminButtom() {
		return "admin/bottom";
	}
}
