package com.lovo.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.lovo.bean.OutContract;
import com.lovo.bean.Park;
import com.lovo.dao.OutContractDao;
import com.lovo.util.PageBean;

import jdk.nashorn.internal.ir.annotations.Ignore;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="/applicationContext.xml")
@Transactional
public class OutContractServiceImplTest {

	@Resource
	private OutContractDao dao;
	
	@Ignore
	@Test
	public void testGetTotalCount() {
		Date date = new Date();
		String nowTime = (date.getYear()+1900)+"-"+(date.getMonth()+1)+"-"+date.getDate();
		int count = dao.getTotalCount("",new Date(),1);
		System.out.println(count);
	}

//	@Ignore
	@Test
	public void testFindAllOutContract() {
		Date date = new Date();
		String nowTime = (date.getYear()+1900)+"-"+(date.getMonth()+1)+"-"+date.getDate();
		PageBean page = new PageBean();
		page.setCurrentPage(1);
		page.setPageSize(5);
		List<OutContract> list = dao.findAllOutContract("", new Date(),1, page);
		System.out.println(list.size());
	}

	@Ignore
	@Test
	public void testAddOutContract() {
		OutContract o = new OutContract();
		o.setOutContractAddress("成都市锦江区xxx号");
		o.setOutContractCarNo("AP22");
		o.setOutContractContact("李四");
		o.setOutContractType(1);
		dao.saveOutContract(o);
	}

	@Ignore
	@Test
	public void testUpdateOutContract() {
		dao.updateOutContract("11");
	}

	@Ignore
	@Test
	public void testDeleteOutContract(){
		dao.deleteOutContract("88");
	}
	
	@Ignore
	@Test
	public void testFindOutContractByNewNo(){
		OutContract outContract = dao.findOutContractByNewNo("2017080801");
		System.out.println(outContract);
	}
}
