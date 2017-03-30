package com.shop.service;

import java.util.List;

import com.shop.model.Admin;
import com.shop.model.User;

public interface AdminService {
	
	public void updateUser(User user);
	
	public Admin checkUser(Admin admin);
	
	public void deleteUser(Integer uid) ;

	// query all users
	public List<User> findUser(Integer page);

	// count the pages of uers
	public Integer countUser() ;

	// select users information from uid
	public User findUserByUid(Integer uid);
}
