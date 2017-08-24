package com.lovo.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.lovo.bean.Enterprise;
import com.lovo.bean.Park;
import com.lovo.dao.EnterpriseDao;
import com.lovo.service.EnterpriseService;

@Service("enterpriseService")
public class EnterpriseServiceImpl implements EnterpriseService {

	@Resource
	private EnterpriseDao dao;
	
	@Override
	public Enterprise login(String enterpriseAccount, String enterprisePwd,String ipAdess) {
		return dao.login(enterpriseAccount, enterprisePwd);
	}

	@Override
	public Enterprise checkoldenterprisePwd(int id) {
		// TODO Auto-generated method stub
		return dao.findEnterPriceById(id);
	}

	@Override
	public List<Park> findEnterpriseParking(int parkType) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public int checkenterpriseAccount(String checkenterpriseAccount) {
		// TODO Auto-generated method stub
		return dao.checkenterpriseAccount(checkenterpriseAccount);
	}

	@Override
	public void addEnterPrice(Enterprise enterprise) {
		// TODO Auto-generated method stub
		dao.addEnterPrice(enterprise);
	}
	@Override
	public List<Enterprise> showAllEnterprise(int currentPage, String enterpriseName, String enterpriseAddress,
			String enterpriseContact, String enterprisePhone) {
		List<Enterprise> enterprises=dao.selectAllEnterprise(currentPage, enterpriseName, enterpriseAddress, enterpriseContact, enterprisePhone);
		return enterprises;
	}
	@Override
	public void deleteEnterpriseById(int enterpriseId) {
		dao.deleteEnterpriseById(enterpriseId);
	}
	@Override
	public int findAllEnterPriceNums() {
		// TODO Auto-generated method stub
		return dao.findEnterPriceCount();
	}

	@Override
	public Enterprise findEnterPriceById(int id) {
		// TODO Auto-generated method stub
		return dao.findEnterPriceById(id);
	}

	@Override
	public void updateEnterpriselc(Enterprise enterprise) {
		dao.updateEnterpriselc(enterprise);
		
	}
}
