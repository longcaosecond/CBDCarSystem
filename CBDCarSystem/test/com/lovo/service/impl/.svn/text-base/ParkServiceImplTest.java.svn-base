package com.lovo.service.impl;

import static org.junit.Assert.*;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.lovo.bean.Park;
import com.lovo.dao.ParkDao;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="/applicationContext.xml")
@Transactional
public class ParkServiceImplTest {

	@Resource
	private ParkDao dao;
	
	@Test
	public void testAddParkIntIntStringString() {
		fail("Not yet implemented");
	}

	@Test
	public void testSelectParkIntStringString() {
		fail("Not yet implemented");
	}

	@Test
	public void testAddParkIntIntListOfStringString() {
		fail("Not yet implemented");
	}

	@Test
	public void testSelectParkIntListOfStringString() {
		fail("Not yet implemented");
	}

	@Test
	public void testFindParkByOutContractNewNo() {
		List<Park> list = dao.findParkByOutContractNewNo("2017080801");
		for (Park park : list) {
			System.out.println(park.getParkType());
		}
	}

}
