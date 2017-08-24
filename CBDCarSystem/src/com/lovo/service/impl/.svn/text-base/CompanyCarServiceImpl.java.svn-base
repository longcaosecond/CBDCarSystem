package com.lovo.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.lovo.bean.Park;
import com.lovo.dao.CompanyCarDao;
import com.lovo.service.CompanyCarService;
@Service
public class CompanyCarServiceImpl implements CompanyCarService {
	@Resource
	private CompanyCarDao dao;
	@Override
	public List<Park> findAllCompanyCar(int currentPage, int enterpriseId) {
		// TODO Auto-generated method stub
		return dao.selectAllCompanyCar(currentPage, enterpriseId);
	}
	@Override
	public int findAllCompanyCarNums() {
		// TODO Auto-generated method stub
		return dao.selectAllCompanyCarNums();
	}
	@Override
	public List<Park> findAllCompanyCarIsRent(int currentPage, int enterpriseId) {
		// TODO Auto-generated method stub
		return dao.selectAllCompanyCarIsRent(currentPage, enterpriseId);
	}
	@Override
	public List<Park> findAllCompanyCarIsNotRent(int currentPage, int enterpriseId) {
		// TODO Auto-generated method stub
		return dao.selectAllCompanyCarIsNotRent(currentPage, enterpriseId);
	}

}
