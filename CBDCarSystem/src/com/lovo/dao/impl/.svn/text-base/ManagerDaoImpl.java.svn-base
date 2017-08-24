package com.lovo.dao.impl;

import java.util.List;
import java.util.Set;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.lovo.bean.Complaint;
import com.lovo.bean.Contract;
import com.lovo.bean.Enterprise;
import com.lovo.bean.Manager;
import com.lovo.bean.Park;
import com.lovo.bean.Power;
import com.lovo.bean.User;
import com.lovo.dao.ManagerDao;
import com.lovo.util.PageBean;

@Repository
public class ManagerDaoImpl implements ManagerDao {
	@Autowired
	@Qualifier("sessionFactory")
	private SessionFactory factory;
	
	/********************普通管理员登录********************/
	@Override
	public Manager selectManager(String managerName, String managerPwd) 
	{
		Session session=factory.getCurrentSession();
		Query query=session.createQuery("from Manager m where m.managerAccount=? and m.managerPwd=?");
		query.setParameter(0, managerName);
		query.setParameter(1, managerPwd);
		List<Manager> managers=query.list();
		Manager manager=null;
		if(managers.size()!=0)
		{			
			manager=(Manager) query.list().get(0);
			manager.getPowers().size();
		}		
		return manager;
	}

	/********************修改普通管理员********************/
	@Override
	public void updateManager(Manager manger)
	{
		Session session=factory.getCurrentSession();
		Query query=session.createQuery("update Manager m set m.managerPwd=? , m.managerPhone=? where m.managerId=?");		
		query.setParameter(0, manger.getManagerPwd());	
		query.setParameter(1, manger.getManagerPhone());
		query.setParameter(2, manger.getManagerId());
		query.executeUpdate();
	}

	@Override
	public Manager selectManagerById(int managerId) {
		Session session=factory.getCurrentSession();
		Manager manager = (Manager) session.get(Manager.class, managerId);
		return manager;
	}

	@Override
	public List<Manager> selectAllManager(PageBean page,String managerName) {
		Session session = factory.getCurrentSession();
		Query query = session.createQuery("from Manager m where m.managerName like:name");
		query.setParameter("name", "%"+managerName+"%");
		query.setFirstResult(page.getStartIndex());
		query.setMaxResults(page.getPageSize());
		@SuppressWarnings("unchecked")
		List<Manager> list = query.list();
		return list;
	}

	@Override
	public void upadateManagerById(int managerId, Manager manager) {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteManagerById(int managerId) {
		// TODO Auto-generated method stub

	}

	@Override
	public void addManager(Manager manager) {
		Session session = factory.getCurrentSession();
		session.save(manager);
		session.flush();
	}

	@Override
	public List<Enterprise> selectAllEnterprise(PageBean page, String enterpriseName, String enterpriseAddress,
			String enterpriseContact, String enterprisePhone) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertEnterprise(Enterprise enterprise) {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteEnterpriseById(int enterpriseId) {
		// TODO Auto-generated method stub

	}

	@Override
	public List<User> selectAllUserBaoZuPo() {
		// TODO Auto-generated method stub
		return null;
	}

	//租户签约
	@Override
	public void insertContract(Contract contract) {
		Session session = factory.getCurrentSession();		
		Enterprise enterprise=(Enterprise) session.get(Enterprise.class, contract.getEnterprise().getEnterpriseId());
		enterprise.setEnterpriseType(contract.getEnterprise().getEnterpriseType());
		session.save(contract);
		session.save(enterprise);
		session.flush();
	}
	//查找所有的企业用户
	@Override
	public List<Enterprise> findAllEnterprise() {
		Session session = factory.getCurrentSession();
		Query query=session.createQuery("from Enterprise e where e.enterpriseType=0");
		List<Enterprise> enterprises=query.list();
		return enterprises;
	}
	//根据企业用户名查找企业用户对象
	@Override
	public Enterprise findEnterpriseByName(String enterpriseName) {
		Session session = factory.getCurrentSession();
		Query query=session.createQuery("from Enterprise e where e.enterpriseName=?");
		query.setParameter(0, enterpriseName);
		Enterprise enterprise=(Enterprise) query.list().get(0);
		return enterprise;
	}

	//租户合约，根据原合同号修改插入新合同号
	@Override
	public void updateContractById(String contractName, Contract contract)
	{
		Session session = factory.getCurrentSession();
		Transaction tx=session.beginTransaction();
		Query query=session.createQuery("from Contract c where c.contractName=?");
		query.setParameter(0, contractName);
		Contract con=(Contract) query.list().get(0);
		
		Contract contract1=(Contract) session.get(Contract.class, con.getContractId());
		
		Enterprise enterprise1=(Enterprise) session.get(Enterprise.class, contract1.getEnterprise().getEnterpriseId());		
		enterprise1.setEnterpriseContact(contract.getEnterprise().getEnterpriseContact());
		enterprise1.setEnterprisePhone(contract.getEnterprise().getEnterprisePhone());
		contract1.setOldcontractId(Integer.parseInt(contractName));
		contract1.setContractName(contract.getContractName());
		contract1.setEnterprise(enterprise1);
		contract1.setContractStartDate(contract.getContractStartDate());
		contract1.setContractEndDate(contract.getContractEndDate());
		contract1.setContractPicture(contract.getContractPicture());		
		session.save(contract1);
		tx.commit();
		session.flush();
	}
	
	//解约：通过原合约Id修改合约状态
	@Override
	public void updateContractTypeById(int contractId, int contractType) 
	{
		Session session = factory.getCurrentSession();
		Transaction tx=session.beginTransaction();
		Contract contract=(Contract) session.get(Contract.class, contractId);
		contract.setContractType(contractType);
		//解约后企业用户状态设置为0
		contract.getEnterprise().setEnterpriseType(0);		
		session.delete(contract);
		tx.commit();
		session.flush();
		
	}
	//查询所有的租户合约
	@Override
	public List<Contract> selectAllContract(String contractId,int type,PageBean page) {
		
		Session session = factory.getCurrentSession();
		Query query=session.createQuery("from Contract c where c.contractType =? and c.contractName like :newNo");
		query.setParameter(0,type);
		query.setParameter("newNo","%"+contractId+"%");
		query.setFirstResult(page.getStartIndex());
		query.setMaxResults(page.getPageSize());
		@SuppressWarnings("unchecked")
		List<Contract> contract=query.list();
		return contract;
	}
	//查询合约总记录数
	@Override
	public int selectTotalCount(int type, String contractName) {
		Session session = factory.getCurrentSession();
		Query query=session.createQuery("select count(*) from Contract c where c.contractType=? and c.contractName like:newNo");
		query.setParameter(0,type);
		query.setParameter("newNo", "%"+contractName+"%");
		Long count=(Long) query.uniqueResult();
		
		return count.intValue();
	}

	
	

	@Override
	public List<Park> selectAllCBDParking() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertCBDParking(Park park) {
		// TODO Auto-generated method stub

	}

	@Override
	public void insertCBDParkings(Set<Park> parks) {
		// TODO Auto-generated method stub

	}

	@Override
	public int getManagerTotalCount(String managerName) {
		Session session = factory.getCurrentSession();
		Query query = session.createQuery("select count(*) from Manager where managerName like :name");
		query.setParameter("name", "%"+managerName+"%");
		Long count = (Long) query.uniqueResult();
		return count.intValue();
	}
	
	
	@Override
	public void updateManagerPowers(Manager manger) {
		Session session = factory.getCurrentSession();
		session.update(manger);
		session.flush();
	}

	@Override
	public List<Power> selectPowersById(String powersId) {
		Session session = factory.getCurrentSession();
		Query query = session.createQuery("from Power where powerId in("+powersId+")");
		@SuppressWarnings("unchecked")
		List<Power> list = query.list();
		return list;
	}

	@Override
	public Power findPowerById(int powerId) {
		Session session = factory.getCurrentSession();
		Power power = (Power) session.get(Power.class, powerId);
		return power;
	}
/***************/

	public long findManagerAccount(String managerAccount) {
		// TODO Auto-generated method stub
		Session session = factory.getCurrentSession();
		Query query = session.createQuery("select count(*) from Manager m where m.managerAccount=?");
		query.setParameter(0,managerAccount);
		Long count = (Long) query.uniqueResult();
		return count;
	}

	@Override
	public void deleteManagerByManagerId(int managerId) {
		// TODO Auto-generated method stub
		Session session = factory.getCurrentSession();
		Manager manager=(Manager)session.get(Manager.class,managerId);
		session.delete(manager);
		session.flush();
	}
	
}
