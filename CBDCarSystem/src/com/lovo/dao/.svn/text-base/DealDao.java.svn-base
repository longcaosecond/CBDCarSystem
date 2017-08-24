package com.lovo.dao;

import java.util.List;

import com.lovo.bean.Deal;

public interface DealDao {
	
	/**
	 * 根据成交记录的id值 获取到指定的成交记录对象
	 * @param dealId 页面传递过来的值
	 * @return 根据id查出来的deal对象
	 */
	public Deal findDealByDealId(int dealId);
	
	/**
	 *  用户的id查找出对应状态下的条约数   针对包租婆
	 * @param userId 页面传递过来的用户id
	 * @return 返回的是总的信息的条数
	 */
	public int findDealCountByUserId(int userId);
	
	/**
	 *  用户的id查找出对应状态下的条约数   针对找租客
	 * @param userId 页面传递过来的用户id
	 * @return 返回的是总的信息的条数
	 */
	public int findDealCountByUserIdByZ(int userId);
	
	/**
	 * 根据传递过来封装好的deal对象把其加入数据库中
	 * @param deal 封装好的一个deal对象
	 */
	public void addDealInfo(Deal deal);
	
	/**
	 * 根据用户id查找到所有 自己租过车位的所有成交记录
	 * @param userId 用户的id
	 * @return 查找出的所有记录
	 */
	public List<Deal> findDealByUserId(int userId,int currentPage, int pageSize);
	
	/**
	 * 根据用户id查找出所有的成交记录里面还没结束的成交记录
	 * @param userId 用于id
	 * @param currentPage 当前页
	 * @param pageSize 最大页码
	 * @return  查询出来的结合
	 */
	public List<Deal> findDealByUserIdByZ(int userId,int currentPage,int pageSize);
	
	/**
	 * 在用户选择同意按钮的时候先判断一下改出租信息是否已经达成交易了
	 * @param rentId
	 * @return
	 */
	public Deal findDealByRentIdAndDealType(int rentId);
}
