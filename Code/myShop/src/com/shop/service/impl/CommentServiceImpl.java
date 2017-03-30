package com.shop.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.shop.dao.CommentDao;
import com.shop.model.Comment;
import com.shop.service.CommentService;
@Transactional
@Service("commentService")
public class CommentServiceImpl implements CommentService {
   
	@Resource
	private CommentDao commentDao;
	
	public void save(Comment comment) {
       commentDao.save(comment);
	}

	public List<Comment> getAllComment(Integer page) {
		return commentDao.findAll(page);
	}

	public void deleteComment(Comment comment) {
		commentDao.delete(comment);
		
	}

	public Integer countComment() {
		Integer count = commentDao.CountComment();
		return (count % 8 == 0 ? (count / 8) : (count / 8 + 1));
	}



}
