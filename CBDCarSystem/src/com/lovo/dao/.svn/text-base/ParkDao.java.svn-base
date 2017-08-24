package com.lovo.dao;

import java.util.List;

import com.lovo.bean.OutContract;
import com.lovo.bean.Park;
import com.lovo.util.PageBean;

public interface ParkDao {
	/**添加车位信息
	 * @param companyId 公司Id
	 * @param parkContractId 合同Id
	 * @param parkNumber 车位号
	 * @param parkAddress 车位地址
	 * @param session 
	 */
	public void addPark(int companyId,int parkContractId,String parkNumber,String parkAddress);
	/**校验车位是否重复
	 * @param parkContractId 合同Id
	 * @param parkNumber 车位号
	 * @param parkAddress 车位地址
	 * @return long
	 */
	public long selectPark(int parkContractId,String parkNumber,String parkAddress);
	/**批量添加车位信息
	 * @param companyId 公司Id
	 * @param parkContractId 合同Id
	 * @param parkNumbers 车位号集合
	 * @param parkAddress 车位地址
	 */
	public void addPark(int companyId,int parkContractId,List<String> parkNumbers,String parkAddress);
	/**校验车位是否重复
	 * @param parkContractId 合同Id
	 * @param parkNumber 车位号集合
	 * @param parkAddress 车位地址
	 * @return 重复车位号名称集合
	 */
	public List<String> selectPark(int parkContractId,List<String> parkNumbers,String parkAddress);
	
	/**
	 * 通过外部合约新编号查询车位
	 * @param outContractNewNo 外部合约新编号
	 * @return 返回查找到的车位集合
	 */
	public List<Park> findParkByOutContractNewNo(String outContractNewNo);
	
	/**
	 * 修改车位表里外部合约的外键ID
	 * @param oldOutContractId 旧的外部合约ID
	 * @param newOutContract 新的外部合约对象
	 */
	public void updateParkOutContractId(int oldOutContractId,OutContract newOutContract);
	
	/**
	 * 查询所有未租车位信息
	 * @param page 分页对象
	 * @param msg 模糊查询信息
	 * @return 返回所有查找到的车位集合
	 */
	public List<Park> findParkByType(PageBean page,String msg);
	
	/**
	 * 查询所有未租车位信息
	 * @param msg 模糊查询信息
	 * @return int 返回未租车位的总记录数
	 */
	public int findTotalCountByType(String msg);
	
	/**
	 * 根据车位ID查找车位信息
	 * @param parkId 车位ID
	 * @return 返回查找到的车位
	 */
	public Park findParkById(int parkId);
	
	/**
	 * 更新车位合约信息和车位状态
	 * @param park 要进行更新的车位
	 */
	public void updateParkTypeAndContract(Park park);
	/**添加车位信息
	 * @param parkContractId 合同Id
	 * @param parkNumber 车位号
	 * @param parkAddress 车位地址
	 * @param session 
	 */
	public void addPark(int outContractId,String parkNumber,String parkAddress);
	
	/**批量添加车位信息
	 * @param parkContractId 合同Id
	 * @param parkNumbers 车位号集合
	 * @param parkAddress 车位地址
	 */
	public void addPark(int outContractId,List<String> parkNumbers,String parkAddress);
	
	/**模糊车位(车位地址，车位编号，合同号)
	 * @param msg 用户输入信息
	 * @param page 页码信息
	 * @return 车位集合
	 */
	public List<Park> findPark(String msg,PageBean page);
	
	/**模糊车位的条数(车位地址，车位编号，合同号)
	 * @param msg 用户输入的信息
	 * @return 返回总条数
	 */
	public int findParkCount(String msg);
	
	/**
	 * @param parkId 车位id
	 * @param outContractId 外部合同Id
	 * @param parkNumber 车位号
	 * @param parkAddress 车位地址
	 */
	public void updatePark(int parkId,int parkType, int outContractId,String parkNumber,String parkAddress);
	/**除去自身校验车位是否重复
	 * @param parkId 合同Id
	 * @param parkContractId 合同Id
	 * @param parkNumber 车位号
	 * @param parkAddress 车位地址
	 * @return long 重复条数
	 */
	public long selectPark(int parkId,int outContractId,String parkNumber,String parkAddress);
	/**根据租赁合同查询车位
	 * @param contractId租赁合同
	 * @return 车位集合
	 */
	public List<Park> findParkBycontractId( int contractId);

	}
