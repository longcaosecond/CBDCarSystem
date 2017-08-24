package com.lovo.dao;

import java.util.List;

import com.lovo.bean.Park;

public interface CompanyCarDao {
	public List<Park> selectAllCompanyCar(int currentPage, int enterpriseId);
	public List<Park> selectAllCompanyCarIsRent(int currentPage, int enterpriseId);
	public List<Park> selectAllCompanyCarIsNotRent(int currentPage, int enterpriseId);
	public int selectAllCompanyCarNums();
}
