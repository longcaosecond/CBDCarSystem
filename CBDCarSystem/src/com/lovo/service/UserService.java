package com.lovo.service;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import com.lovo.bean.Complaint;
import com.lovo.bean.Deal;
import com.lovo.bean.Enterprise;
import com.lovo.bean.Rent;
import com.lovo.bean.User;
import com.lovo.bean.Want;

public interface UserService {

	/**
	 * 注册用户
	 * 
	 * @param user
	 *            注册用户的信息
	 */
	public void registUser(User user);

	/**
	 * 个人用户登录(包租婆、抢租客)
	 * 
	 * @param userAccount
	 *            用户账号
	 * @param userPwd
	 *            用户密码
	 * @return 登录成功后，返回查找到的用户对象，登录失败则返回null
	 */
	public User login(String userAccount, String userPwd, String ipAdess);

	/**
	 * 个人用户修改功能 不允许修改用户名、真实姓名和身份证号码
	 * 
	 * @param user
	 *            用户对象
	 *
	 */
	public void updateUser(User user);

	/**
	 * 根据用户Id查找用户信息
	 * 
	 * @param userId
	 *            查找用户的Id
	 * @return 返回一个用户对象
	 */
	public User showUserById(int userId);

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
	public void publishPakingByBaoZuPo(Rent rent);

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
	public void sendMessageToBaoZuPo(Want want, int currentPage);

	/**
	 * 用户查看自己的历史成交记录
	 * 
	 * @return 返回成交记录对象的集合
	 * @param currentPage
	 *            当前页码
	 */
	public List<Deal> selectAllDeal(int currentPage);

	/**
	 * 查找个人用户注册账号
	 * 
	 * @param userAccount
	 *            用户账号
	 * @return int 查找到的数量，存在返回1，不存在返回0
	 */
	public int findUserAccount(String userAccount);

	/**
	 * 根据用户输入的新密码 设置新的密码
	 * 
	 * @param userPwd
	 *            传递过来的密码值
	 */
	public void updateUserPwd(String userPwd, int userId);

	/**
	 * 根据用户到id得到所有的对应的成交记录
	 * 
	 * @param userId
	 *            传递过来的ID值
	 * @return 返回对应的deal对象集合
	 */
	public List<Deal> findDealByUserId(int userId, int currentPage, int pageSize);

	/**
	 * 根据合约的id获取到指定的deal对象 到页面显示信息
	 * 
	 * @param dealId
	 *            传递过来的id值
	 * @return 查找出来的对应对象
	 */
	public Deal findDealByDealId(int dealId);

	/**
	 * 根据页面传递过来的信息添加投诉
	 * 
	 * @param complaint
	 *            传递过来的封装好了的对象
	 */
	public void addComplaint(Complaint complaint);

	/**
	 * 根据用户的个人信息返回所有的发送过来的信息
	 * 
	 * @param currentPage
	 *            当前页
	 * @param pageSize
	 *            每页显示的信息条数
	 * @return 放回一个want对象
	 */
	public List<Want> findWantInfo(int userId, int wantType, int currentPage, int pageSize);

	/**
	 * 用户的id查找出对应状态下的条约数
	 * 
	 * @param userId
	 *            页面传递过来的用户id
	 * @return 返回的是总的信息的条数
	 */
	public int findDealCountByUserId(int userId);

	/**
	 * 根据want的id获取到指定的want对象
	 * 
	 * @param wantId
	 *            传递过来的额want的id
	 * @return 查询到的want对象
	 */
	public Want findWantByWantId(int wantId);

	/**
	 * 根据传递过来的id值和type值 修改指定want的状态
	 * 
	 * @param wantId
	 *            页面传递过来的want的id
	 * @param wantType
	 *            页面传递过来的type的值
	 */
	public void updateWantTypeByWantId(int wantId, int wantType);

	/**
	 * 根据userId 查出对应的want信息的条数 针对包租婆
	 * 
	 * @param wantId
	 *            传递火来的用户的id
	 * @param wantType
	 *            wnat信息的状态
	 * @return
	 */
	public int findWantCountByWantTypeAndId(int userId, int wantType);

	/**
	 * 根据userId 查出对应的want信息的条数 针对找租客
	 * 
	 * @param wantId
	 *            传递火来的用户的id
	 * @param wantType
	 *            wnat信息的状态
	 * @return
	 */
	public int findWantCountByWantTypeAndUserId(int userId, int wantType);

	/**
	 * 根据用户的个人信息返回所有的发送过来的信息 针对找租客
	 * 
	 * @param currentPage
	 *            当前页
	 * @param pageSize
	 *            每页显示的信息条数
	 * @return 放回一个want对象
	 */
	public List<Want> findWantInfoByZ(int userId, int currentPage, int pageSize);

	/**
	 * 根据传递过来封装好的deal对象把其加入数据库中
	 * 
	 * @param deal
	 *            封装好的一个deal对象
	 */
	public void addDealInfo(Deal deal);

	/**
	 * z注销用户
	 * 
	 * @param user
	 */
	public void logout(User user);
	public void logout(Enterprise enterprise);
	

}
