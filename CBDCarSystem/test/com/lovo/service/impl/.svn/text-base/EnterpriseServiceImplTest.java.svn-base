package com.lovo.service.impl;

import static org.junit.Assert.*;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.lovo.bean.Enterprise;
import com.lovo.dao.EnterpriseDao;

import jdk.nashorn.internal.ir.annotations.Ignore;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="/applicationContext.xml")
@Transactional
public class EnterpriseServiceImplTest {

	@Resource
	private EnterpriseDao dao;
	
	@Ignore
	@Test
	public void testLogin() {
		Enterprise enterprise = dao.login("lisi", "123");
		System.out.println(enterprise.getEnterpriseName());
	}

}
