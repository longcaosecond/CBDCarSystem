package com.lovo.dao.impl;

import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.lovo.bean.OutContract;
import com.lovo.dao.OutContractDao;
import com.lovo.util.PageBean;

@Repository
public class OutContractDaoImpl implements OutContractDao {

	@Autowired
	@Qualifier("sessionFactory")
	private SessionFactory sessionFactory;
	
	@Override
	public int getTotalCount(String outContractNewNo, Date date,int type) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("select count(*) from OutContract "
				+ "where outContractType=? and outContractEndTime>? "
				+ " and outContractNewNo like :newNo ");
		query.setParameter(0, type);
		query.setParameter(1, date);
		query.setParameter("newNo", "%"+outContractNewNo+"%");
		Long count = (Long) query.uniqueResult();
		return count.intValue();
	}

	@Override
	public List<OutContract> findAllOutContract(String outContractNewNo, Date date, int type, PageBean page) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from OutContract where outContractType=? "
				+ "and outContractEndTime>? and outContractNewNo like :newNo " 
				+" order by outContractId desc");
		query.setParameter(0, type);
		query.setParameter(1, date);
		query.setParameter("newNo", "%"+outContractNewNo+"%");
		query.setFirstResult(page.getStartIndex());
		query.setMaxResults(page.getPageSize());
		@SuppressWarnings("unchecked")
		List<OutContract> list = query.list();
		return list;
	}

	@Override
	public void saveOutContract(OutContract outContract) {
		Session session = sessionFactory.getCurrentSession();
		outContract.setOutContractType(1);
		session.save(outContract);
	}

	@Override
	public void updateOutContract(String outContractNewNo) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from OutContract where outContractNewNo=?");
		query.setParameter(0, outContractNewNo);
		OutContract outContract = (OutContract) query.uniqueResult();
		outContract.setOutContractType(0);
		session.update(outContract);
		session.flush();
	}

	@Override
	public OutContract findOutContractByNewNo(String outContractNewNo) {
		Session session = sessionFactory.getCurrentSession();
		Query query= session.createQuery("from OutContract where outContractNewNo=?");
		query.setParameter(0, outContractNewNo);
		OutContract outContract = (OutContract) query.uniqueResult();
		return outContract;
	}

	@Override
	public void deleteOutContract(String outContractNewNo) {
		Session session = sessionFactory.getCurrentSession();
		Query query= session.createQuery("from OutContract where outContractNewNo=?");
		query.setParameter(0, outContractNewNo);
		OutContract outContract = (OutContract) query.uniqueResult();
		session.delete(outContract);
		session.flush();
	}

	@Override
	public List<OutContract> selectOutContractByEnterpriseId() {
		// TODO Auto-generated method stub
		Session session =sessionFactory.getCurrentSession();
		Query query=session.createQuery("from OutContract");
		List<OutContract> list=query.list();
		return list;
	}

}
