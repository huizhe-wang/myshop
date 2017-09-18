package com.shop.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.shop.model.User;
import com.shop.service.AdminService;
import com.shop.service.UserService;

@Controller
public class UserController{

	@Resource
	private UserService userService;
	@Resource
	private AdminService adminService;
	
	@ModelAttribute
	public User getUser(){
		return new User();
	}
	
	//exit
	@RequestMapping("/quit")
	public String quit(HttpSession session,HttpServletRequest request){
		request.getSession().invalidate();
		return "redirect:index";
	}
	//login
	@RequestMapping(value="login")
	public String login(@ModelAttribute("user") User user, String checkcode,
			HttpSession session,Map<String,Object> map){
		//get code from session
		String checkCode = (String) session.getAttribute("checkcode");
		//check code: if not match, return login page
		if(! checkCode.equalsIgnoreCase(checkcode)){
			map.put("errorCheckCode", "errorCheckCode");
			return "login"; 
		}
		//whether user exist or not
		User isExistUser = userService.existUser(user.getUsername());
		if(isExistUser == null){
			map.put("notUser", "notUser");
			return "login";
		}
		//whether active or not
		User u = userService.existUser(user.getUsername());
		if(u.getState() == 0){
			map.put("notActive","notActive");
			return "login";
		}
		//match the username and password
		u = userService.findUserByUsernameAndPassword(user);
		if(u == null){
			map.put("notPassword", "notPassword");
			return "login";
		}
		session.setAttribute("user", u);
		return "redirect:index";
	}
	
	//turn to login page
	@RequestMapping(value="/userLogin")
	public String userLogin(){
		return "login";
	}
	
	//active user
	@RequestMapping(value="/active/{code}")
	public String active(@PathVariable("code") String code,Map<String,Object> map){
		//select users from user where code = ?
		User user = userService.active(code);
		if(user == null){
			map.put("notUser", "notUser");
			return "msg";
		}
		user.setCode("");
		user.setState(1);
		userService.update(user);
		map.put("activeSuccess","activeSuccess");
		return "msg";
	}
	
	// register
	//BindingResult parameter follows @Valid to avoid throwing exception
	@RequestMapping(value = "register",method=RequestMethod.POST)
	public String register(@ModelAttribute @Valid User user,BindingResult result,HttpSession session,
			String checkcode,Map<String,Object> map) {
		//if Error, turn to register page
		if (result.hasErrors()){
			//print error for each
            List<ObjectError> errorList = result.getAllErrors();
            for(ObjectError error : errorList){
                System.out.println(error.getDefaultMessage());
            }
            //return register page
            return "regist";
        }
		//get code form session
		String checkCode = (String) session.getAttribute("checkcode");
		System.out.println("admin code"+checkCode);
		System.out.println("user code"+checkcode);		
		//return register page if not match
		if(! checkCode.equalsIgnoreCase(checkcode)){
			map.put("errorCheckCode", "errorCheckCode");
			return "regist"; 
		}
		userService.register(user);
		return "msg";
	 }
	// judge whether user exist or not by using ajax
	@RequestMapping(value="/checkUser/{userName}",method=RequestMethod.POST)
	@ResponseBody
	public String existUser(@PathVariable("userName") String userName, HttpServletResponse response) 
			throws IOException {
		System.out.println(userName);
		response.setContentType("text/html;charset=UTF-8");
		if (userService.existUser(userName) != null) {
			// this username has been exist
			response.getWriter().println("1");
		} else {
			// no this username
			response.getWriter().println("0");
		}
		return null;
	}

	// turn page
	@RequestMapping("userRegister")
	public String register() {
		return "regist";
	}
	
	//edit user information
	//edit
		@RequestMapping(value="/edituser/{uid}")
		public String editUser(@PathVariable("uid") Integer uid,@ModelAttribute("user") User user,Map<String,Object> map){
			user = adminService.findUserByUid(uid);
			map.put("user", user);
			return "edit";
		}
		//updates
		@RequestMapping(value="/updateuser")
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
			model.setViewName("redirect:/edituser/"+user.getUid());
			return model;
		}	
		
		/**
		 * find  password
		 */
		@RequestMapping(value="findpass")
		public String findpass(){
			return "findpass";
		}
		
		/**
		 * start finding 
		 */
		@RequestMapping(value="updatepass")
		public String updatepass(@ModelAttribute("user")User user){
			
			User u = userService.existUser(user.getUsername());
			System.out.println("gotothrere");
			if(u.getEmail().equals(user.getEmail())){
				u.setEmail(user.getEmail());
				u.setPassword(user.getPassword());
				userService.update(u);
				return "success";
			}else{
				return "emailError";
			}
			
			
			
		}
		
	
}