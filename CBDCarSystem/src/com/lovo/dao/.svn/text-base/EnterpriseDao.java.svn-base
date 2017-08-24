package com.lovo.dao;

import java.util.List;

import com.lovo.bean.Complaint;
import com.lovo.bean.Enterprise;
import com.lovo.bean.Park;

public interface EnterpriseDao {

	/**
	 * 企业用户登录
	 * @param enterpriseAccount 登录账号
	 * @param enterprisePwd 登录密码
	 * @return 登录成功后，返回查找到的企业对象，登录失败则返回null
	 */
	public Enterprise login(String enterpriseAccount,String enterprisePwd);
	
	/**
	 * 修改企业用户信息
	 * 企业用户不允许修改企业名称和企业楼层位置
	 */
	public void updateEnterprise(Enterprise enterprise);
	
	/**
	 * 根据企业的车位状态查找车位信息
	 * @param parkType 查找车位的车位状态      parkType：1代表以租 0代表未租  
	 * @return 返回对应状态的车位对象的集合
	 */
	public List<Park> selectEnterpriseParking(int parkType);
	/**
	 * 查看所有的企业用户
	 * 需要做分页功能,能够根据企业名称、楼层位置、联系人、联系电话的模糊查询，当不输入查询条件，默认查看所有的企业信息
	 * @param currentPage 当前页码	
	 * @param enterpriseName 企业名称
	 * @param enterpriseAddress 楼层位置
	 * @param enterpriseContact 联系人
	 * @param enterprisePhone 联系电话
	 * @return 返回企业用户对象的集合
	 */
	public List<Enterprise> selectAllEnterprise(int currentPage,String enterpriseName,String enterpriseAddress,String enterpriseContact,String enterprisePhone);
	/**
	 * 检查企业账号是否存在
	 * @param checkenterpriseAccount输入账号  
	 * @return 返回1表示存在 0表示不存在
	 */
	
	public int checkenterpriseAccount(String checkenterpriseAccount);
	/**
	 * 添加企业
	 * @param enterprise新的企业 
	 */
	public void addEnterPrice(Enterprise enterprise);
	/**
	 * 删除企业
	 * @param enterpriseId
	 */
	public void deleteEnterpriseById(int enterpriseId);
	/**
	 * 按照id找到企业
	 * @param id
	 */
	public Enterprise findEnterPriceById(int id);
	/**
	 * 查询企业总数量 方便分页
	 * 
	 */
	public int findEnterPriceCount();
	/**
	 * 修改企业用户密码
	 * @param enterprise
	 */
	public void updateEnterpriselc(Enterprise enterprise);
}
