package com.lovo.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.lovo.bean.Want;
import com.lovo.dao.WantDao;
import com.lovo.service.WantService;
@Service("wantServiceImpl")
public class WantServiceImpl implements WantService {
@Resource(name="wantDao")
private WantDao wdao;
	@Override
	public void addWant(int rentId, int userId, String message) {
		// TODO Auto-generated method stub
		wdao.addWant(rentId, userId, message);
	}
	@Override
	public List<Want> selectWantsByUserId(int userId) {
		// TODO Auto-generated method stub
		return wdao.selectWantsByUserId(userId);
	}
	
	@Override
	public List<Want> findWantInfo(int userId, int wantType,int currentPage, int pageSize) {
		// TODO Auto-generated method stub
		return wdao.findWantInfo(userId,wantType, currentPage, pageSize);
	}
	
	@Override
	public List<Want> findWantInfoByZ(int userId, int currentPage, int pageSize) {
		// TODO Auto-generated method stub
		return wdao.findWantInfoByZ(userId, currentPage, pageSize);
	}
	
	@Override
	public Want findWantByWantId(int wantId) {
		// TODO Auto-generated method stub
		return wdao.findWantByWantId(wantId);
	}

	@Override
	public void updateWantTypeByWantId(int wantId, int wantType) {
		// TODO Auto-generated method stub
		wdao.updateWantTypeByWantId(wantId, wantType);
	}

	@Override
	public int findWantCountByWantTypeAndId(int userId, int wantType) {
		// TODO Auto-generated method stub
		return wdao.findWantCountByWantTypeAndId(userId, wantType);
	}

	@Override
	public int findWantCountByWantTypeAndUserId(int userId, int wantType) {
		// TODO Auto-generated method stub
		return wdao.findWantCountByWantTypeAndUserId(userId, wantType);
	}
}
