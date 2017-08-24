package com.lovo.dao;

import java.util.Date;
import java.util.List;

import com.lovo.bean.OutContract;
import com.lovo.util.PageBean;

public interface OutContractDao {

	/**
	 * 查询符合相关合同编号的所有合同数量
	 * @param outContractNewNo 合同编号（新）
	 * @param date 系统当前的时间
	 * @param type 合约的状态 0：解约，1：在合约期
	 * @return int 返回查找到的数量
	 */
	public int getTotalCount(String outContractNewNo, Date date, int type);
	
	/**
	 * 获取符合相关合同编号的所有的合约信息
	 * @param outContractNewNo 合同编号（新）
	 * @param date 系统当前的时间
	 * @param type 合约的状态 0：解约，1：在合约期
	 * @param page page对象
	 * @return list 返回查找的所有的合约信息的集合
	 */
	public List<OutContract> findAllOutContract(String outContractNewNo, Date date, int type, PageBean page);
	
	/**
	 * 新增外部合约记录
	 * @param outContract 外部合约对象
	 */
	public void saveOutContract(OutContract outContract);
	
	/**
	 * 外部合约解约(修改合约的状态)
	 * @param outContractNewNo 外部合约的合约编号
	 */
	public void updateOutContract(String outContractNewNo);
	
	/**
	 * 删除无效外部合约记录
	 * @param outContractNewNo 外部合约的合约编号
	 */
	public void deleteOutContract(String outContractNewNo);
	
	/**
	 * 查找外部合约对象根据新合同编号
	 * @param outContractNewNo 新合同编号
	 * @return OutContract 返回查找到的外部合约对象
	 */
	public OutContract findOutContractByNewNo(String outContractNewNo);
	public  List<OutContract> selectOutContractByEnterpriseId( );

}
