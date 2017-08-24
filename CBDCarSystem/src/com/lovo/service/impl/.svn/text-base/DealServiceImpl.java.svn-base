package com.lovo.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.lovo.bean.Complaint;
import com.lovo.bean.Deal;
import com.lovo.bean.Rent;
import com.lovo.dao.ComplaintDao;
import com.lovo.dao.DealDao;
import com.lovo.service.DealService;
@Service("dealServiceImpl")
public class DealServiceImpl implements DealService {
	@Resource(name = "dealDaoImpl")
	private DealDao dao;
	@Resource(name = "complaintDaoImpl")
	private ComplaintDao cdao;
	
	@Override
	public List<Deal> findDealByUserIdByz(int userId,int currentPage,int pageSize) {
		// TODO Auto-generated method stub
		
		List<Deal> deals = dao.findDealByUserIdByZ(userId, currentPage, pageSize);
		return deals;
	}

	@Override
	public Deal findDealByDealId(int dealId) {
		// TODO Auto-generated method stub
		return dao.findDealByDealId(dealId);
	}
	
	@Override
	public int findDealCountByUserId(int userId) {
		// TODO Auto-generated method stub
		return dao.findDealCountByUserId(userId);
	}
	
	@Override
	public void addDealInfo(Deal deal) {
		// TODO Auto-generated method stub
		dao.addDealInfo(deal);
	}

	@Override
	public List<Deal> findDealByUserId(int userId, int currentPage, int pageSize) {
		// TODO Auto-generated method stub
		List<Deal> deals = dao.findDealByUserId(userId, currentPage, pageSize);
		return deals;
	}

	@Override
	public int findDealCountByUserIdByZ(int userId) {
		// TODO Auto-generated method stub
		return dao.findDealCountByUserIdByZ(userId);
	}

	@Override
	public Deal findDealByRentIdAndDealType(int rentId) {
		// TODO Auto-generated method stub
		return dao.findDealByRentIdAndDealType(rentId);
	}
}
