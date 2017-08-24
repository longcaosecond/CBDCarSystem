package com.lovo.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.lovo.bean.Contract;
import com.lovo.bean.Enterprise;
import com.lovo.bean.OutContract;
import com.lovo.bean.Park;
import com.lovo.dao.ParkDao;
import com.lovo.util.PageBean;
import com.lovo.util.Status;

@Repository("parkDao")
public class ParkDaoImpl implements ParkDao {
	@Autowired
	@Qualifier("sessionFactory")
	private SessionFactory sessionFactory;
	@Override
	public void addPark(int companyId, int parkContractId, String parkNumber, String parkAddress) {
		Session session =sessionFactory.getCurrentSession();
		Park park=new Park();
		Enterprise ep=new Enterprise();
		ep.setEnterpriseId(companyId);
		Contract co=new Contract();
		co.setContractId(parkContractId);
		park.setParkContract(co);
		park.setParkNumber(parkNumber);
		park.setParkAddress(parkAddress);
		park.setParkType(Status.WEIZU);
		session.save(park);
		session.flush();
	}

	@Override
	public long selectPark(int outContractId, String parkNumber, String parkAddress) {
		// TODO Auto-generated method stub
		Session session =sessionFactory.getCurrentSession();
		Query query=session.createQuery("select count(*) from Park p where  p.parkNumber=? and p.parkAddress=?");
		//query.setParameter(0,outContractId);
		query.setParameter(0,parkNumber);
		query.setParameter(1,parkAddress);
		Long len=(Long)query.uniqueResult();
		return len;
	}

	@Override
	public void addPark(int companyId, int parkContractId, List<String> parkNumbers, String parkAddress) {
		// TODO Auto-generated method stub
		Session session =sessionFactory.getCurrentSession();
		Enterprise ep=(Enterprise) session.get(Enterprise.class,companyId);
		Contract co=(Contract) session.get(Contract.class,parkContractId);
		for(String s:parkNumbers){
			Park p=new Park();
			p.setParkContract(co);
			p.setParkAddress(parkAddress);
			p.setParkNumber(s);
			session.save(p);
		}
		session.flush();
	}

	@Override
	public List<String> selectPark(int outContractId, List<String> parkNumbers, String parkAddress) {
		// TODO Auto-generated method stub
		Session session =sessionFactory.getCurrentSession();
		Query query=session.createSQLQuery("select park_number from t_park p where p.park_number in(:list) and p.park_address=:address");
		//query.setInteger("id", outContractId);
		query.setParameterList("list",parkNumbers);
		query.setParameter("address",parkAddress);
		List<String> list=query.list();
		return list;
	}

	@Override
	public List<Park> findParkByOutContractNewNo(String outContractNewNo) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Park p join fetch p.outContract o where o.outContractNewNo=?");
		query.setParameter(0, outContractNewNo);
		@SuppressWarnings("unchecked")
		List<Park> list = query.list();
		return list;
	}

	@Override
	public void updateParkOutContractId(int oldOutContractId, OutContract newOutContract) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Park p join fetch p.outContract o where o.outContractId=?");
		query.setParameter(0, oldOutContractId);
		@SuppressWarnings("unchecked")
		List<Park> list = query.list();
		for (Park park : list) {
			park.setOutContract(newOutContract);
			session.update(park);
			session.flush();
		}
	}

	@Override
	public List<Park> findParkByType(PageBean page,String msg) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Park p where p.parkType=0 and "
				+ " (p.outContract.outContractNewNo like:newNo "
				+ " or p.parkAddress like:address "
				+ " or p.parkNumber like:number)");
		query.setParameter("newNo","%"+msg+"%");
		query.setParameter("address","%"+msg+"%" );
		query.setParameter("number","%"+msg+"%");
		query.setFirstResult(page.getStartIndex());
		query.setMaxResults(page.getPageSize());
		@SuppressWarnings("unchecked")
		List<Park> list = query.list();
		return list;
	}

	@Override
	public int findTotalCountByType(String msg) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("select count(*) from Park p where "
				+ " p.parkType=0 and (p.outContract.outContractNewNo like:newNo "
				+ " or p.parkAddress like:address "
				+ " or p.parkNumber like:number)");
		query.setParameter("newNo","%"+msg+"%");
		query.setParameter("address","%"+msg+"%" );
		query.setParameter("number","%"+msg+"%");
		Long count = (Long) query.uniqueResult();
		return count.intValue();
	}

	@Override
	public Park findParkById(int parkId) {
		Session session = sessionFactory.getCurrentSession();
		Park park = (Park) session.get(Park.class, parkId);
		return park;
	}

	@Override
	public void updateParkTypeAndContract(Park park) {
		Session session = sessionFactory.getCurrentSession();
		session.update(park);
		session.flush();
	}
/**************/
	@Override
	public void addPark( int outContractId, String parkNumber, String parkAddress) {
		// TODO Auto-generated method stub
		Session session =sessionFactory.getCurrentSession();
		Park park=new Park();
		OutContract co=(OutContract) session.get(OutContract.class,outContractId);
		park.setOutContract(co);
		park.setParkNumber(parkNumber);
		park.setParkAddress(parkAddress);
		park.setParkType(Status.WEIZU);
		session.save(park);
		session.flush();
	}

	@Override
	public void addPark( int outContractId, List<String> parkNumbers, String parkAddress) {
		// TODO Auto-generated method stub
		Session session =sessionFactory.getCurrentSession();
		OutContract co=(OutContract) session.get(OutContract.class,outContractId);
		for(String s:parkNumbers){
			Park p=new Park();
			p.setOutContract(co);
			p.setParkAddress(parkAddress);
			p.setParkNumber(s);
			session.save(p);
		}
		session.flush();
	}
	@Override
	public List<Park> findPark(String msg, PageBean page) {
		// TODO Auto-generated method stub
		Session session =sessionFactory.getCurrentSession();
		//Query query=session.createQuery("from Park p where p.parkContract.contractName like ? or p.parkNumber like ? or p.parkAddress like ? or p.outContract.outContractNewNo like ?");
		Query query=session.createQuery("select p from Park p left outer join p.parkContract c left outer join p.outContract o where c.contractName like ? or p.parkNumber like ? or p.parkAddress like ? or o.outContractNewNo like ?");
		query.setParameter(0,"%"+msg+"%");
		query.setParameter(1,"%"+msg+"%");
		query.setParameter(2,"%"+msg+"%");
		query.setParameter(3,"%"+msg+"%");
		query.setFirstResult(page.getStartIndex());
		query.setMaxResults(page.getPageSize());
		return query.list();
	}

	@Override
	public int findParkCount(String msg) {
		// TODO Auto-generated method stub
		Session session =sessionFactory.getCurrentSession();
		Query query=session.createQuery("select count(*) from Park p left outer join p.parkContract c left outer join p.outContract o where c.contractName like ? or p.parkNumber like ? or p.parkAddress like ? or o.outContractNewNo like ?");
		query.setParameter(0,"%"+msg+"%");
		query.setParameter(1,"%"+msg+"%");
		query.setParameter(2,"%"+msg+"%");
		query.setParameter(3,"%"+msg+"%");
		long count=(Long)query.uniqueResult(); 
		return (int)count;
	}

	@Override
	public void updatePark(int parkId,int parkType,int outContractId, String parkNumber, String parkAddress) {
		// TODO Auto-generated method stub
		Session session =sessionFactory.getCurrentSession();
		Park p=(Park) session.get(Park.class,parkId);
		OutContract outContract=(OutContract) session.get(OutContract.class,outContractId);
		p.setOutContract(outContract);
		p.setParkAddress(parkAddress);
		p.setParkNumber(parkNumber);
		if(parkType==Status.WEIZU)
		{p.setParkType(parkType);}
		session.update(p);
		session.flush();
	}

	@Override
	public long selectPark(int parkId, int outContractId, String parkNumber, String parkAddress) {
		// TODO Auto-generated method stub
		Session session =sessionFactory.getCurrentSession();
		Query query=session.createQuery("select count(*) from Park p where  p.parkNumber=? and p.parkAddress=? and p.parkId !=? ");
		//query.setParameter(0,outContractId);
		query.setParameter(0,parkNumber);
		query.setParameter(1,parkAddress);
		query.setParameter(2,parkId);
		Long len=(Long)query.uniqueResult();
		return len;
	}

	@Override
	public List<Park> findParkBycontractId(int contractId) {
		// TODO Auto-generated method stub
		Session session =sessionFactory.getCurrentSession();
		Query query=session.createQuery("from Park p where p.contract.contractId=?");
		query.setParameter(0,contractId);
		return query.list();
	}
}
