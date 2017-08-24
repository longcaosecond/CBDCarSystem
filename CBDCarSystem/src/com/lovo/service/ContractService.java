package com.lovo.service;

import java.util.List;

import com.lovo.bean.Contract;

public interface ContractService {

	/**
	 * 查询所有的合约记录信息
	 * @return 返回装有所有合约信息的集合
	 */
	public List<Contract> findAllContractDao();
	
	/**
	 * 更新车位信息
	 * @param list 传入的车位ID
	 */
	public void commit(List<String> list) ;
}
