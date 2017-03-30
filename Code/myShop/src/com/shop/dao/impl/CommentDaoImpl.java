package com.shop.dao.impl;



import java.util.List;

import org.springframework.stereotype.Repository;

import com.shop.dao.CommentDao;
import com.shop.model.Comment;

@Repository("commentDao")
public class CommentDaoImpl extends BaseDaoImpl<Comment> implements CommentDao {

	public List<Comment> findAll(Integer page) {
		String hql = "from Comment";
		int rows = 12;
		int page1 = page;
		return find(hql,page1,rows);
	}
	
	public Integer CountComment() {
		String hql = "select count(*) from Comment";
		return count(hql);
	}



}
