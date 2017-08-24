package com.lovo.dao;

import java.util.List;
import java.util.Set;

import com.lovo.bean.Complaint;
import com.lovo.bean.Contract;
import com.lovo.bean.Enterprise;
import com.lovo.bean.Manager;
import com.lovo.bean.Park;
import com.lovo.bean.Power;
import com.lovo.bean.User;
import com.lovo.util.PageBean;

public interface ManagerDao {

	/***********************后台个人信息管理功能************************/
	/**
	 * 管理员登录
	 * @param ManagerName 管理员姓名
	 * @param ManagerPwd 管理员密码
	 * @return 登录成功就返回一个管理员对象，登录失败则返回null
	 */
	public Manager selectManager(String managerName,String managerPwd);
	
	/**
	 *修改管理员信息
	 *普通管理员只运行修改登录密码和电话号码，不允许修改工号、真实姓名和管理权限
	 * @param Manager 要修改的管理员对象
	 */
	public void updateManager(Manager manger);
	
	/**
	 * 修改管理员权限
	 * @param manger 管理员
	 */
	public void updateManagerPowers(Manager manger);
	
	/**
	 * 根据权限ID查询权限
	 * @param powersId 权限ID
	 * @return 返回查找到的权限
	 */
	public List<Power> selectPowersById(String powersId);
	
	/***********************后台操作权限管理功能************************/
	
	/**
	 * 超级管理员根据管理员Id查找管理员
	 * @param managerId 管理员Id
	 * @return 返回管理员对象
	 */
	public Manager selectManagerById(int managerId);
	
	/**
	 * 超级管理员查找所有的管理员
	 * @param 	page page对象
	 * @param managerName 根据管理员名字模糊查询
	 * @return 返回一个管理员的集合
	 */
	public List<Manager> selectAllManager(PageBean page,String managerName);
	
	/**
	 * 获取管理员总数量
	 * @param managerName 根据管理员名字模糊查询
	 * @return 返回查找到的数量
	 */
	public int getManagerTotalCount(String managerName);
	
	/**
	 * 超级管理员根据管理员Id修改管理员
	 * @param managerId 被修改管理员的Id
 	 * @param manager  修改后的管理员对象信息
	 */
	public void upadateManagerById(int managerId,Manager manager);
	
	/**
	 * 超级管理员根据管理员Id删除管理员
	 * @param managerId 被删除管理员的Id
	 */
	public void deleteManagerById(int managerId);
	
	/**
	 * 超级管理员增加普通管理员
	 * @param manager
	 */
	public void addManager(Manager manager);
	
	/***********************后台企业管理功能************************/
	
	/**
	 * 查看所有的企业用户
	 * 需要做分页功能,能够根据企业名称、楼层位置、联系人、联系电话的模糊查询，当不输入查询条件，默认查看所有的企业信息
	 * @param page page对象	
	 * @param enterpriseName 企业名称
	 * @param enterpriseAddress 楼层位置
	 * @param enterpriseContact 联系人
	 * @param enterprisePhone 联系电话
	 * @return 返回企业用户对象的集合
	 */
	public List<Enterprise> selectAllEnterprise(PageBean page,String enterpriseName,String enterpriseAddress,String enterpriseContact,String enterprisePhone);

	/**
	 * 新增企业
	 * @param enterprise 新增企业对象
	 */
	public void insertEnterprise(Enterprise enterprise);
	
	/**
	 * 删除企业
	 * @param enterpriseId
	 */
	public void deleteEnterpriseById(int enterpriseId);
	
	/***********************后台包租婆管理功能************************/
	
	/**
	 * 查询显示所有的包租婆提交的申请
	 * 包括包租婆信息及招租车位信息的准确性和真实性
	 * @return 返回一个User用户对象的集合
	 */
	public List<User> selectAllUserBaoZuPo();
	
	/***********************后台合约管理功能************************/
	/**
	 * 租户签约
	 * @param contract 企业租户和CBD平台签订的合约对象
	 */
	public void insertContract(Contract contract);
	
	/**
	 *查找所有的企业用户 
	 * @return
	 */
	public List<Enterprise> findAllEnterprise();
	
	/**
	 * 满足查询条件的总合约记录数
	 * @param type 合约状态
	 * @param contractId 模糊查询合约编号
	 * @return
	 */
	public int selectTotalCount(int type,String contractName);
	
	
	/**
	 * 根据企业用户名查找用户对象
	 * @return 企业用户对象
	 */
	public Enterprise findEnterpriseByName(String enterpriseName);
	
	/**
	 * 租户续约
	 * 续约是在原合同上修改新合同属性，根据原合约Id修改合约信息，完成续约业务
	 * @param contractId 原合约Id
	 * @param contract 新签订的合约
	 */
	public void updateContractById(String contractName,Contract contract);
	
	/**
	 * 租户解约
	 * 通过原合约Id修改合约状态
	 * @param contractId 解约合约的Id
	 * @param contractType 解约合约的状态0：解除合约 1：合约状态
	 */
	public void updateContractTypeById(int contractId,int contractType);
	
	/**
	 * 显示所有的企业租户合约信息
	 * @param currentPage 当前页
	 * @param contractId 模糊查询时，根据合同编号查询
	 * @return 返回一个合约对象集合
	 */
	public List<Contract> selectAllContract(String contractId,int type,PageBean page);
	
	/**************后台管理员处理投诉******************/
	
	
	/***************后台CBD车位管理*******************/
		
	/**
	 * 查询显示所有的CBD车位信息
	 * @return 返回一个Park对象的集合
	 */
	public List<Park> selectAllCBDParking();
	
	/**
	 * 单次添加CBD车位信息
	 * @param park 车位对象
	 */
	public void insertCBDParking(Park park);
	
	/**
	 * 批量添加车位
	 * @param parks 车位对象集合
	 */
	public void insertCBDParkings(Set<Park> parks);
	
	
	/**
	 * 通过权限ID查找权限
	 * @param powerId 权限ID
	 * @return 返回查找到的ID
	 */
	public Power findPowerById(int powerId);
	/**根据账号查找相同账号数量
	 * @param managerAccount 账号
	 * @return long返回查找的行数
	 */
	public long findManagerAccount(String managerAccount);
	
	/**根据管理员Id删除管理员
	 * @param managerId
	 */
	public void deleteManagerByManagerId(int managerId);

}
