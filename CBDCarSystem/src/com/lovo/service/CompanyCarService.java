package com.lovo.service;

import java.util.List;

import com.lovo.bean.Park;

public interface CompanyCarService {
	public List<Park> findAllCompanyCar(int currentPage,int enterpriseId);
	public List<Park> findAllCompanyCarIsRent(int currentPage,int enterpriseId);
	public List<Park> findAllCompanyCarIsNotRent(int currentPage,int enterpriseId);
	public int findAllCompanyCarNums();
}
