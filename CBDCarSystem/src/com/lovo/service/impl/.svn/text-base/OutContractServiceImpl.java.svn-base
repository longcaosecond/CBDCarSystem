package com.lovo.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lovo.bean.OutContract;
import com.lovo.dao.OutContractDao;
import com.lovo.dao.ParkDao;
import com.lovo.service.OutContractService;
import com.lovo.util.PageBean;

@Service
public class OutContractServiceImpl implements OutContractService {

	@Resource
	private OutContractDao dao;
	
	@Resource
	private ParkDao pDao;
	
	@Override
	public int getTotalCount(String outContractNewNo,int type) {
		return dao.getTotalCount(outContractNewNo, new Date(), type);
	}

	@Override
	public List<OutContract> findAllOutContract(String outContractNewNo, int type, PageBean page) {
		return dao.findAllOutContract(outContractNewNo, new Date(), type, page);
	}

	@Transactional
	@Override
	public void saveOutContract(OutContract outContract,int oldOutContractId) {
		dao.saveOutContract(outContract);
		//判断是否是续约,如果是，则更改车位表里面的外键（外部合约ID）
		if (outContract.getOutContractOldNo()!=null) {
			//查找到刚刚续约的合约(即新的外部合约)，用户更改车位表里面的外键（外部合约ID）
			OutContract o = dao.findOutContractByNewNo(outContract.getOutContractNewNo());
			pDao.updateParkOutContractId(oldOutContractId, o);
			//若是续约后，将原合约状态改为解约状态
			dao.updateOutContract(outContract.getOutContractOldNo());
		}
	}

	@Override
	public void updateOutContract(String outContractNewNo) {
		dao.updateOutContract(outContractNewNo);
	}

	@Override
	public OutContract findOutContractByNewNo(String outContractNewNo) {
		return dao.findOutContractByNewNo(outContractNewNo);
	}

	@Override
	public void deleteOutContract(String outContractNewNo) {
		dao.deleteOutContract(outContractNewNo);
	}
/**********/

	@Override
	public List<OutContract> selectOutContractByEnterpriseId() {
		// TODO Auto-generated method stub
		return dao.selectOutContractByEnterpriseId();
	}
}
