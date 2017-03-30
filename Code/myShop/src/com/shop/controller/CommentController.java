package com.shop.controller;

import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.shop.model.Comment;
import com.shop.model.User;
import com.shop.service.CommentService;

@Controller
public class CommentController {
  
	@Autowired
	private CommentService commentService;
	
	/**
	 * add comments
	 * @param comment
	 * @param session
	 * @return
	 */
	@RequestMapping(value="addComment")
	public String addComment(@ModelAttribute("comment")Comment comment,HttpSession session){
		User user = (User)session.getAttribute("user");
		comment.setName(user.getName());
		comment.setTime(new Date());
		commentService.save(comment);
		return "comment";	
	}
	/**
	 * display comments
	 * @param req
	 * @return
	 */
	@RequestMapping(value="showComment/{page}")
	public ModelAndView showComment(@PathVariable("page") Integer page,HttpServletRequest req,Map<String,Object> map){
		ModelAndView modelAndView = new ModelAndView("admin/comment/list");
		req.setAttribute("cList", commentService.getAllComment(page));
		//query page
	   Integer count =commentService.countComment();
		map.put("page", page);
		map.put("count", count);
		return modelAndView;
	}
	
	@RequestMapping(value="deleteComment/{cid}")
	public String deleteComment(@PathVariable("cid") int cid){
		Comment c= new Comment();
		c.setCid(cid);
		commentService.deleteComment(c);
		return "redirect:/showComment/1";
	}
}
