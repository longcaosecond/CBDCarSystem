package com.lovo.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.lovo.bean.Rent;
import com.lovo.dao.LandLordDao;
import com.lovo.service.LandLordService;
@Service
public class LandLordServiceImple implements LandLordService {
	@Resource
	private LandLordDao dao;
	@Override
	public List<Rent> findAllLandLordApply(int currentPage) {
		// TODO Auto-generated method stub
		return dao.selectAllLandLordApplyRent(currentPage);
	}
	@Override
	public int findAllLandLordApplyNums() {
		// TODO Auto-generated method stub
		return dao.selectAllLandLordApplyRentNums();
	}
	@Override
	public int passApply(int n) {
		// TODO Auto-generated method stub
		return dao.passUpdateRentType(n);
	}
	@Override
	public int refuseApply(int n) {
		// TODO Auto-generated method stub
		return dao.refuseUpdateRentType(n);
	}

}
