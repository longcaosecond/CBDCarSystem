package com.lovo.service.impl;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.lovo.bean.Rent;
import com.lovo.dao.RentDao;
import com.lovo.service.RentService;
import com.lovo.util.PageBean;
@Service("rentServiceImpl")
public class RentServiceImpl implements RentService {
	@Resource(name = "rentDaoImpl")
  private RentDao dao;
	
	@Override
	public List<Rent> selectAllRent(Date rentStartDate, Date rentEndDate, PageBean page, BigDecimal minPrice,
			BigDecimal maxPrice, String rentAddress) {
		return dao.selectAllRent(rentStartDate, rentEndDate, page, minPrice, maxPrice, rentAddress);
	}

	@Override
	public int selectAllRentCount(Date rentStartDate, Date rentEndDate, int currentPage, BigDecimal minPrice,
			BigDecimal maxPrice, String rentAddress) {
		return dao.selectAllRentCount(rentStartDate, rentEndDate, currentPage, minPrice, maxPrice, rentAddress);
	}

	@Override
	public Rent selectRentById(int renId) {
		return dao.selectRentById(renId);
	}

	@Override //包租婆查看自己的所有车位
	public List<Rent> findMyRents(int userId, PageBean page, String address, Date startDate, Date endDate,
			BigDecimal minPrice, BigDecimal maxPrice) {
		// TODO Auto-generated method stub
		return dao.findMyRents(userId, page, address, startDate, endDate, minPrice, maxPrice);
	}

	@Override
	public int findMyRentsCount(int userId, PageBean page, String address, Date startDate, Date endDate,
			BigDecimal minPrice, BigDecimal maxPrice) {
		return dao.findMyRentsCount(userId, page, address, startDate, endDate, minPrice, maxPrice);
	}

	@Override //包租婆上传新车位
	public void addRent(Rent rent) {	
		dao.addRent(rent);
	}

	@Override // 包租婆修改车位的部分信息
	public void updataMyRent(Rent rent) {
		String carPic = rent.getRentCarPicture();
		String disc = rent.getRentMessage();
		Rent oldRent = dao.selectRentById(rent.getRentId());
		//如果页面传入的车位图片和详细信息为空,则使用以前的值
		if (disc == null || "".equals(disc)) {
			rent.setRentMessage(oldRent.getRentMessage());
		}
		if (!(carPic.endsWith(".jpg")) && !(carPic.endsWith(".png"))) {
			rent.setRentCarPicture(oldRent.getRentCarPicture());
		}
		dao.updataMyRent(rent);
	}

	@Override // 包租婆删除未出租的空闲车位 不可删除: 0，删除成功:1
	public int deleteMyRent(Integer rentId) {
		Rent rent = dao.selectRentById(rentId);
		int rentType = rent.getRentType();
		if (rentType == 1) {
			dao.deleteMyRent(rentId);
			return 1;
		}
		return 0;
	}

	@Override // 根据产权号码验是否证重复 --没有重复:0 已经存在:1
	public int findRentByNum(String rentCnum) {
		int r = dao.selectRentByNum(rentCnum);
		if (r != 0) return 1;

		return 0;
	}
	
	@Override
	public void updateRentTypeWhenSuccess(int rentId, int rentType) {
			dao.updateRentTypeWhenSuccess(rentId, rentType);
	}
}
