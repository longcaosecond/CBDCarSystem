package com.lovo.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.lovo.bean.Contract;
import com.lovo.bean.Park;
import com.lovo.dao.ContractDao;
import com.lovo.dao.ParkDao;
import com.lovo.service.ContractService;

@Service
public class ContractServiceImpl implements ContractService {

	@Resource
	private ContractDao dao;
	
	@Resource
	private ParkDao pDao;
	
	@Override
	public List<Contract> findAllContractDao() {
		return dao.findAllContractDao();
	}

	@Override
	public void commit(List<String> list) {
		
		//获取合约ID
		int contractId = Integer.parseInt(list.get(0));
		//查找合约
		Contract contract = dao.findContractById(contractId);
		//修改车位状态
		for (int i = 1; i < list.size(); i++) {
			Park park = pDao.findParkById(Integer.parseInt(list.get(i)));
			park.setParkContract(contract);
			park.setParkType(1);
			pDao.updateParkTypeAndContract(park);
		}
		
	}

}
