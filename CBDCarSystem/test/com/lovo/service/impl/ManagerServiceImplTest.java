package com.lovo.service.impl;

import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.lovo.bean.Manager;
import com.lovo.bean.Power;
import com.lovo.dao.ManagerDao;
import com.lovo.util.PageBean;

import jdk.nashorn.internal.ir.annotations.Ignore;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="/applicationContext.xml")
@Transactional
public class ManagerServiceImplTest {

	@Resource
	private ManagerDao dao;
	@Resource
	private PageBean page;
	
	@Test
	public void testLoginManager() {
		fail("Not yet implemented");
	}

	@Test
	public void testUpdateManager() {
		fail("Not yet implemented");
	}

	@Test
	public void testFindManagerById() {
		fail("Not yet implemented");
	}

	@Test
	public void testUpadateManagerById() {
		fail("Not yet implemented");
	}

	@Test
	public void testDeleteManagerById() {
		fail("Not yet implemented");
	}

	@Test
	public void testAddManager() {
		fail("Not yet implemented");
	}

	@Ignore
	@Test
	public void testFindAllManager() {
		page.setCurrentPage(1);
		List<Manager> list = dao.selectAllManager(page,"");
		System.out.println(list.get(0).getPowers().size());
		
	}
	
	@Ignore
	@Test
	public void testGetManagerTotalCount() {
		int count = dao.getManagerTotalCount("");
		System.out.println(count);
	}

	@Test
	public void testShowAllEnterprise() {
		fail("Not yet implemented");
	}

	@Test
	public void testAddEnterprise() {
		fail("Not yet implemented");
	}

	@Test
	public void testDeleteEnterpriseById() {
		fail("Not yet implemented");
	}

	@Test
	public void testShowAllUserBaoZuPo() {
		fail("Not yet implemented");
	}

	@Test
	public void testAddContract() {
		fail("Not yet implemented");
	}

	@Test
	public void testUpdateContractById() {
		fail("Not yet implemented");
	}

	@Test
	public void testUpdateContractTypeById() {
		fail("Not yet implemented");
	}

	@Test
	public void testShowAllComplain() {
		fail("Not yet implemented");
	}

	@Test
	public void testUpdateComplaintById() {
		fail("Not yet implemented");
	}

	@Test
	public void testShowComplaintById() {
		fail("Not yet implemented");
	}

	@Test
	public void testShowAllCBDParking() {
		fail("Not yet implemented");
	}

	@Test
	public void testAddCBDParking() {
		fail("Not yet implemented");
	}

	@Test
	public void testAddCBDParkings() {
		fail("Not yet implemented");
	}

	@Ignore
	@Test
	public void upadateManagerPowers() {
		List<String> list = new ArrayList<String>();
		list.add("1002");
		list.add("1");
		list.add("2");
		list.add("3");
		list.add("4");
		Manager manager = dao.selectManagerById(Integer.parseInt(list.get(0)));
		String powersId = "";
		for (int i = 1; i < list.size(); i++) {
			if (i==list.size()-1) {
				powersId += list.get(i);
			}else {
				powersId += list.get(i)+",";
			}
		}
		List<Power> powerList = dao.selectPowersById(powersId);
		Set<Power> powers = new HashSet<Power>();
		for (Power power : powerList) {
			powers.add(power);
		}
		manager.setPowers(powers);
		dao.updateManagerPowers(manager);
	}
}
