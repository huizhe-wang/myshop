package com.shop.dao;

import java.util.List;
import com.shop.model.User;

public interface UserDao extends BaseDao<User>{
	
    //select user from username
	public User findByUsername(String userName);
	//select user from username and password
	public User findByUsernameAndPassword(String username,String password);
	//select user by activation code
	public User findByCode(String code);
	//count user number
	public Integer countUser();
	//select all users
	public List<User> findAll(Integer page);
	//select one user
	public User findOne(Integer uid);
	
}
