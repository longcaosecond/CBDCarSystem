package com.lovo.dao;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import com.lovo.bean.Rent;
import com.lovo.util.PageBean;

public interface RentDao {
	/**
	 * 抢租客查看包租婆发布的所有车位招租信息 可以根据租借开始/结束时间模糊查询： 1.如果输入查询时间则查询该时间段的车位信息；
	 * 2.如果不输入查询时间则查询所有的车位信息
	 * 
	 * @param rentStartDate
	 *            租借开始时间
	 * @param rentEndDate
	 *            租借结束时间
	 * @param currentPage
	 *            当前页码
	 * @return 返回一个招租对象的集合
	 */
	public List<Rent> selectAllRent(Date rentStartDate, Date rentEndDate, PageBean page, BigDecimal minPrice,
			BigDecimal maxPrice, String rentAddress);

	/**
	 * 抢租客查看包租婆发布的所有车位招租信息 可以根据租借开始/结束时间模糊查询： 1.如果输入查询时间则查询该时间段的车位信息；
	 * 2.如果不输入查询时间则查询所有的车位信息
	 * 
	 * @param rentStartDate
	 *            租借开始时间
	 * @param rentEndDate
	 *            租借结束时间
	 * @param currentPage
	 *            当前页码
	 * @return 返回一个int数字
	 */
	public int selectAllRentCount(Date rentStartDate, Date rentEndDate, int currentPage, BigDecimal minPrice,
			BigDecimal maxPrice, String rentAddress);

	/**
	 * 查询包租婆自己的发布信息
	 * 
	 * @param userId
	 * @param address
	 * @param startDate
	 * @param endDate
	 * @param minPrice
	 * @param maxPrice
	 * @return 包租婆自己的发布信息
	 */
	public List<Rent> findMyRents(int userId, PageBean page, String address, Date startDate, Date endDate,
			BigDecimal minPrice, BigDecimal maxPrice);

	/**
	 * 查询包租婆自己的发布信息的总条数
	 * 
	 * @param userId
	 * @param address
	 * @param startDate
	 * @param endDate
	 * @param minPrice
	 * @param maxPrice
	 * @return 包租婆自己的发布信息的总条数
	 */
	public int findMyRentsCount(int userId, PageBean page, String address, Date startDate, Date endDate,
			BigDecimal minPrice, BigDecimal maxPrice);

	/**
	 * 添加新待审核的车位出租信息
	 * 
	 * @param rent
	 *            新车位信息
	 */
	public void addRent(Rent rent);

	/**
	 * 包租婆修改车位的部分信息
	 * 
	 * @param rent
	 */
	public void updataMyRent(Rent rent);

	/**
	 * 包租婆删除未出租的空闲车位
	 * 
	 * @param rent
	 */
	public void deleteMyRent(Integer rentId);
	
	/**
	 * 根据产权号码验是否证重复
	 * @param rentCnum
	 * @return 
	 */
	public int selectRentByNum(String rentCnum);
	
	/**
	 * 抢租客根据包租婆发布的车位信息Id查看车位详细信息
	 * 
	 * @param renId
	 *            车位信息Id
	 * @return 招租车位对象
	 */
	public Rent selectRentById(int renId);
	
	/**
	 * 当双方达成交易的时候，更改车位的状态为以出租
	 * @param rentId
	 * @param rentType
	 */
	public void updateRentTypeWhenSuccess(int rentId,int rentType);


	public List<Rent> findRentByUserIdAndRentType(int userId);
}
