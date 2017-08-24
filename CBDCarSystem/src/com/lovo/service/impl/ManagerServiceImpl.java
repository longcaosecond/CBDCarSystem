package com.lovo.service.impl;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.lovo.bean.Complaint;
import com.lovo.bean.Contract;
import com.lovo.bean.Enterprise;
import com.lovo.bean.Manager;
import com.lovo.bean.Park;
import com.lovo.bean.Power;
import com.lovo.bean.User;
import com.lovo.dao.ManagerDao;
import com.lovo.service.ManagerService;
import com.lovo.util.PageBean;

@Service
public class ManagerServiceImpl implements ManagerService {

	@Resource
	private ManagerDao dao;
	
	
	
	/************普通管理员登录*****************/
	@Override
	public Manager loginManager(String managerName, String managerPwd) 
	{		
		return dao.selectManager(managerName, managerPwd);
	}

	/************修改普通管理员*****************/
	@Override
	public void updateManager(Manager manger) 
	{
		dao.updateManager(manger);
	}


	@Override
	public Manager findManagerById(int managerId) {
		// TODO Auto-generated method stub
		return null;
	}



	@Override
	public void upadateManagerPowers(List<String> list) {
		Manager manager = dao.selectManagerById(Integer.parseInt(list.get(0)));
		String powersId = "";
		for (int i = 1; i < list.size(); i++) {
			if (i==list.size()-1) {
				powersId += list.get(i);
			}else {
				powersId += list.get(i)+",";
			}
		}
		List<Power> powerList = dao.selectPowersById(powersId);
		Set<Power> powers = new HashSet<Power>();
		for (Power power : powerList) {
			powers.add(power);
		}
		manager.setPowers(powers);
		dao.updateManagerPowers(manager);
	}

	@Override
	public void deleteManagerById(int managerId) {
		// TODO Auto-generated method stub

	}

	@Override
	public void addManager(Manager manager) {
//		Set<Power> powers = manager.getPowers();
//		Set<Power> set = new HashSet<Power>();
//		for (Power power : powers) {
//			Power p= dao.findPowerById(power.getPowerId());
//			set.add(p);
//		}
//		manager.setPowers(set);
		dao.addManager(manager);
		Manager m = dao.selectManager(manager.getManagerAccount(), manager.getManagerPwd());
		List<String> list = new ArrayList<String>();
		list.add(String.valueOf(m.getManagerId()));
		Set<Power> powers = manager.getPowers();
		for (Power power : powers) {
			list.add(String.valueOf(power.getPowerId()));
		}
		upadateManagerPowers(list);
	}

	@Override
	public List<Manager> findAllManager(PageBean page,String managerName) {
		return dao.selectAllManager(page,managerName);
	}

	@Override
	public List<Enterprise> showAllEnterprise(PageBean page, String enterpriseName, String enterpriseAddress,
			String enterpriseContact, String enterprisePhone) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void addEnterprise(Enterprise enterprise) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteEnterpriseById(int enterpriseId) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<User> showAllUserBaoZuPo() {
		// TODO Auto-generated method stub
		return null;
	}

	/****************租户合约************************/
	//增加合约
	@Override
	public void addContract(Contract contract) 
	{
		dao.insertContract(contract);		
	}
	//查找所有的企业用户
	@Override
	public List<Enterprise> findAllEnterpriseName() 
	{
		
		return dao.findAllEnterprise();
	}

	//根据企业用户名查找用户对象
	@Override
	public Enterprise findEnterpriseByName(String enterpriseName) 
	{
		
		return dao.findEnterpriseByName(enterpriseName);
	}
	//显示所有的企业租户合约信息
	@Override
	public List<Contract> showAllContract(String contractId,int type,PageBean page) {
		
		return dao.selectAllContract(contractId, type, page);
	}
	//满足查询条件的总记录数
	@Override
	public int showTotalCount(int type, String contractName) 
	{
		
		return dao.selectTotalCount(type, contractName);
	}
	//租户续约 续约是在原合同上修改新合同属性，根据原合约Id修改合约信息，完成续约业务
	@Override
	public void updateContractById(String contractName, Contract contract) {
		
		dao.updateContractById(contractName, contract);
	}

	//解约 通过原合约Id修改合约状态
	@Override
	public void updateContractTypeById(int contractId, int contractType) 
	{		
		dao.updateContractTypeById(contractId, contractType);
	}

	
	@Override
	public List<Park> showAllCBDParking() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void addCBDParking(Park park) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void addCBDParkings(Set<Park> parks) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int getManagerTotalCount(String managerName) {
		return dao.getManagerTotalCount(managerName);
	}
/******************************/

	@Override
	public long findManagerAccount(String managerAccount) {
		// TODO Auto-generated method stub
		return dao.findManagerAccount(managerAccount);
	}

	@Override
	public void deleteManagerByManagerId(int managerId) {
		// TODO Auto-generated method stub
		dao.deleteManagerByManagerId(managerId);
	}
	
}
