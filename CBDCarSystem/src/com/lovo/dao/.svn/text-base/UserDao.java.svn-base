package com.lovo.dao;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import com.lovo.bean.Deal;
import com.lovo.bean.Rent;
import com.lovo.bean.User;
import com.lovo.bean.Want;

public interface UserDao {
	/**
	 * 添加用户
	 */
	public void insertUser(User user);

	/**
	 * 个人用户登录(包租婆、抢租客)
	 * 
	 * @param userAccount
	 *            用户账号
	 * @param userPwd
	 *            用户密码
	 * @return 登录成功后，返回查找到的用户对象，登录失败则返回null
	 */
	public User login(String userAccount, String userPwd);

	/**
	 * 个人用户修改功能
	 * 
	 * @param user
	 *            user对象
	 */
	public void updateUser(String userAccount, String userAddress, String userPhone, String userEmail, int userId);//冯伟

	/**
	 * 查找个人用户注册账号
	 * 
	 * @param userAccount
	 *            用户账号
	 * @return int 查找到的数量，存在返回1，不存在返回0
	 */
	public int findUserAccount(String userAccount);

	/**
	 * 根据用户Id查找用户信息
	 * 
	 * @param userId
	 *            查找用户的Id
	 * @return 返回一个用户对象
	 */
	public User selectUserById(int userId);

	/**
	 * 查找所有的用户信息 后台审核包租婆信息及车位信息,需要分页和根据用户名模糊查询
	 * 
	 * @param currentPage
	 *            当前页
	 * @param userName
	 *            用户名
	 * @return 返回一个用户对象的集合
	 */
	public List<User> selectAllUser(int currentPage, String userName);

	/**
	 * 包租婆发布招租信息及包租婆向后台发送招租申请
	 * 
	 * @param rent
	 *            招租信息
	 */
	public void insertPakingByBaoZuPo(Rent rent);

	/**
	 * 包租婆查看所有抢租客的预定招租车位信息
	 * 
	 * @param rentStartDate
	 *            租借开始时间
	 * @param rentEndDate
	 *            租借结束时间
	 * @param currentPage
	 *            当前页码
	 * @param rentPrice
	 *            租赁价格
	 * @param rentAddress
	 *            租赁地址
	 * @return 返回对应查询条件下的所有预定招租信息的集合
	 */
	public List<Want> selectAllWant(Date rentStartDate, Date rentEndDate, int currentPage, BigDecimal rentPrice,
			String rentAddress);

	/**
	 * 根据预定招租车位Id查看预定车位信息
	 * 
	 * @param wantId
	 *            预定招租车位Id
	 * @return 返回预定车位信息对象
	 */
	public Want selectWantById(int wantId);

	/**
	 * 抢租客给包租婆发送留言信息 抢租客找到合适的招租车位可以预定该车位，给包租婆留言
	 * 
	 * @param want
	 *            留言信息
	 */
	public void insertMessageToBaoZuPo(Want want, int currentPage);

	/**
	 * 用户查看自己的历史成交记录
	 * 
	 * @return 返回成交记录对象的集合
	 * @param currentPage
	 *            当前页码
	 */
	public List<Deal> selectAllDeal(int currentPage);

	/**
	 * 根据用户输入的新密码 设置新的密码
	 * 
	 * @param userPwd
	 *            传递过来的密码值
	 */
	public void updateUserPwd(String userPwd, int userId);

	/**
	 * 当后台管理受理了投诉者的投诉之后，要对被投诉者的信誉做出修改
	 * @param userId 被投诉者的id
	 */
	public void updateUserCreditByUserId(int userId);
}
