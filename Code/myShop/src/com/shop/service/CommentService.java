package com.shop.service;


import java.util.List;

import com.shop.model.Comment;

public interface CommentService {
	//save comment
       public void save(Comment comment);
       //get comment
       public List<Comment> getAllComment(Integer page);
       
       //delete comment
       public void deleteComment(Comment comment);
       
     //query page
   	public Integer countComment();
}
