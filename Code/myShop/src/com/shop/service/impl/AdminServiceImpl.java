package com.shop.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.shop.dao.AdminDao;
import com.shop.dao.UserDao;
import com.shop.model.Admin;
import com.shop.model.User;
import com.shop.service.AdminService;

@Transactional
@Service("adminService")
public class AdminServiceImpl implements AdminService{

	@Resource
	private AdminDao adminDao;
	@Resource
	private UserDao userDao;

	//update user
	public void updateUser(User user){
		userDao.update(user);
	}
	// select from Adminname and password
	public Admin checkUser(Admin adminUser) {
		return adminDao.findByAdminnameAndPassword(
				adminUser.getUsername(), adminUser.getPassword());
	}

	// delete user from uid
	public void deleteUser(Integer uid) {
		userDao.delete(uid);
	}

	// select all users
	public List<User> findUser(Integer page){
		return userDao.findAll(page);
	}

	// count the pages of users
	public Integer countUser() {
		Integer count = userDao.countUser();
		return (count % 20 == 0 ? (count / 20) : (count / 20 + 1));
	}

	// select users information from uid
	public User findUserByUid(Integer uid) {
		return userDao.findOne(uid);
	}
}
