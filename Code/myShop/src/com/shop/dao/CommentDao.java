package com.shop.dao;

import java.util.List;

import com.shop.model.Comment;

public interface CommentDao extends BaseDao<Comment>{
	public List<Comment> findAll(Integer page);
	public Integer CountComment();
}
