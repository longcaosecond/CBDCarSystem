package com.lovo.dao;

import java.util.List;

import com.lovo.bean.Contract;

public interface ContractDao {

	/**
	 * 查询所有的合约记录信息
	 * @return 返回装有所有合约信息的集合
	 */
	public List<Contract> findAllContractDao();
	
	/**
	 * 根据合约ID查询合约
	 * @param contractId 合约ID
	 * @return 返回查找到的合约
	 */
	public Contract findContractById(int contractId);
	
}
