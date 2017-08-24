package com.lovo.service;

import java.util.List;

import com.lovo.bean.Deal;

public interface DealService {
	/**
	 * 根据用户到id得到所有的对应的成交记录
	 * @param userId 传递过来的ID值
	 * @return 返回对应的deal对象集合
	 */
	public List<Deal> findDealByUserIdByz(int userId,int currentPage,int pageSize);
	
	/**
	 * 根据用户到id得到所有的对应的成交记录
	 * @param userId 传递过来的ID值
	 * @return 返回对应的deal对象集合
	 */
	public List<Deal> findDealByUserId(int userId,int currentPage,int pageSize);
	
	/**
	 * 根据合约的id获取到指定的deal对象 到页面显示信息
	 * @param dealId 传递过来的id值
	 * @return 查找出来的对应对象
	 */
	public Deal findDealByDealId(int dealId);
	
	/**
	 *  用户的id查找出对应状态下的条约数
	 * @param userId 页面传递过来的用户id
	 * @return 返回的是总的信息的条数
	 */
	public int findDealCountByUserId(int userId);
	
	/**
	 * 根据传递过来封装好的deal对象把其加入数据库中
	 * @param deal 封装好的一个deal对象
	 */
	public void addDealInfo(Deal deal);
	
	/**
	 *  用户的id查找出对应状态下的条约数   针对找租客
	 * @param userId 页面传递过来的用户id
	 * @return 返回的是总的信息的条数
	 */
	public int findDealCountByUserIdByZ(int userId);
	
	/**
	 * 在用户选择同意按钮的时候先判断一下改出租信息是否已经达成交易了
	 * @param rentId
	 * @return
	 */
	public Deal findDealByRentIdAndDealType(int rentId);
}
