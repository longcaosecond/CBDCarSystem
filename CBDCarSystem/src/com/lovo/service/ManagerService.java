package com.lovo.service;

import java.util.List;
import java.util.Set;

import com.lovo.bean.Complaint;
import com.lovo.bean.Contract;
import com.lovo.bean.Enterprise;
import com.lovo.bean.Manager;
import com.lovo.bean.Park;
import com.lovo.bean.User;
import com.lovo.util.PageBean;

	/**
	 * 该类处理管理员相关业务
	 * 管理员包括普通管理员和超级管理员
	 * @author Administrator 
	 *
	 */
public interface ManagerService {

	/***********************后台个人信息管理功能************************/
	/**
	 * 管理员登录
	 * @param ManagerName 管理员姓名
	 * @param ManagerPwd 管理员密码
	 * @return 登录成功就返回一个管理员对象，登录失败则返回null
	 */
	public Manager loginManager(String managerName,String managerPwd);
	
	/**
	 *修改管理员信息
	 *普通管理员只运行修改登录密码和电话号码，不允许修改工号、真实姓名和管理权限
	 * @param Manager 要修改的管理员对象
	 */
	public void updateManager(Manager manger);
	
	/***********************后台操作权限管理功能************************/
	
	/**
	 * 超级管理员根据管理员Id查找管理员
	 * @param managerId 管理员Id
	 * @return 返回管理员对象
	 */
	public Manager findManagerById(int managerId);
	
	/**
	 * 超级管理员查找所有的管理员
	 * @param 	page page对象
	 * @param managerName 根据管理员名字模糊查询
	 * @return 返回一个管理员的集合
	 */
	public List<Manager> findAllManager(PageBean page,String managerName);
	
	/**
	 * 获取管理员总数量
	 * @param managerName 根据管理员名字模糊查询
	 * @return 返回查找到的数量
	 */
	public int getManagerTotalCount(String managerName);
	
	/**
	 * 修改管理员的权限
	 * @param list 装有管理员以及权限的ID
	 */
	public void upadateManagerPowers(List<String> list);
	
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
	public List<Enterprise> showAllEnterprise(PageBean page,String enterpriseName,String enterpriseAddress,String enterpriseContact,String enterprisePhone);

	/**
	 * 新增企业
	 * @param enterprise 新增企业对象
	 */
	public void addEnterprise(Enterprise enterprise);
	
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
	public List<User> showAllUserBaoZuPo();
	
	/***********************后台合约管理功能************************/
	/**
	 * 租户签约
	 * @param contract 企业租户和CBD平台签订的合约对象
	 */
	public void addContract(Contract contract);
	
	/**
	 * 查找所有的企业用户
	 * @return
	 */
	public List<Enterprise> findAllEnterpriseName(); 
	
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
	public List<Contract> showAllContract(String contractId,int type,PageBean page);
	
	/**
	 * 查询所有查询满足条件的总记录数
	 * @param Type 合约状态0:解约状态1：合约期
	 * @param contractId 模糊查询合约Id
	 * @return
	 */
	public int showTotalCount(int Type,String contractName);
	
	/**************后台管理员处理投诉******************/
	
	
	/***************后台CBD车位管理*******************/
		
	/**
	 * 查询显示所有的CBD车位信息
	 * @return 返回一个Park对象的集合
	 */
	public List<Park> showAllCBDParking();
	
	/**
	 * 单次添加CBD车位信息
	 * @param park 车位对象
	 */
	public void addCBDParking(Park park);
	
	/**
	 * 批量添加车位
	 * @param parks 车位对象集合
	 */
	public void addCBDParkings(Set<Park> parks);
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
