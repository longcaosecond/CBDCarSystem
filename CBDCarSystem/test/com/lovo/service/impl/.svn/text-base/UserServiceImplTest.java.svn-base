package com.lovo.service.impl;

import static org.junit.Assert.*;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.lovo.bean.Deal;
import com.lovo.bean.Rent;
import com.lovo.bean.User;
import com.lovo.bean.Want;
import com.lovo.dao.UserDao;
import com.lovo.service.UserService;

import jdk.nashorn.internal.ir.annotations.Ignore;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="/applicationContext.xml")
@Transactional
public class UserServiceImplTest {
	
	@Resource
	private UserDao dao;
	@Resource(name = "userServiceImpl")
	private UserService service;

	@Ignore
	@Test
	public void testRegistUser() {
		
	}

	@Ignore
	@Test
	public void testLogin() {
		User user = dao.login("lisi", "123");
		System.out.println(user.getUserName());
	}

	
	@Ignore
	@Test
	public void testFindUserAccount(){
		int count = dao.findUserAccount("lisi");
		System.out.println(count);
	}
	@Test
	public void testFindUserById(){
		int userId = 1;
		User user = dao.selectUserById(userId);
		System.out.println(user.getUserName());
	}
	/*@Test
	public void testFindRentByUserId(){
		int userId = 3;
		List<Rent> list = dao.findRentByUserIdAndRentType(userId);
		System.out.println(list.get(0).getRentMessage());
	}
	@Test
	public void testFindDealByUserId(){
		int userId = 3;
		List<Deal> list = service.findDealByUserId(userId);
		System.out.println(list.size());
	}*/
	
	
}
