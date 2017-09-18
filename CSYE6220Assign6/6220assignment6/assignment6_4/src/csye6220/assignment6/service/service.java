package csye6220.assignment6.service;

import javax.annotation.Resource;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import csye6220.assignment6.account.*;
import csye6220.assignment6.dao.*;

@Service
@Transactional
public class service implements accountDao{
	
	@Resource
	private SessionFactory sessionFactory;

	@Override
	public void add(account account) {
		// TODO Auto-generated method stub
		System.out.println(sessionFactory);
		sessionFactory.getCurrentSession().persist(account);
		System.out.println("Service called!");
	}

}