package com.lovo.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.lovo.bean.Enterprise;
import com.lovo.bean.Park;
import com.lovo.dao.CompanyCarDao;
@Repository
public class CompanyCarDaoImpl implements CompanyCarDao {
	public static int companyCarCounts;
	@Autowired
	@Qualifier("sessionFactory")
	private SessionFactory sessionFactory;
	@Override
	public List<Park> selectAllCompanyCar(int currentPage, int enterpriseId) {
		Session session=sessionFactory.getCurrentSession();
		Query query=session.createQuery("from Park p where p.parkContract.enterprise.enterpriseId=?");
		query.setParameter(0,enterpriseId);
		companyCarCounts=query.list().size();
		int rowPage=5;
		query.setFirstResult((currentPage-1)*rowPage);
		query.setMaxResults(rowPage);
		return query.list();
	}
	@Override
	public int selectAllCompanyCarNums() {
		return companyCarCounts;
	}
	@Override
	public List<Park> selectAllCompanyCarIsRent(int currentPage, int enterpriseId) {
		Session session=sessionFactory.getCurrentSession();
		Query query=session.createQuery("from Park p where p.parkContract.enterprise.enterpriseId=? and p.parkType=?");
		query.setParameter(0,enterpriseId);
		query.setParameter(1,1);
		companyCarCounts=query.list().size();
		int rowPage=5;
		query.setFirstResult((currentPage-1)*rowPage);
		query.setMaxResults(rowPage);
		return query.list();
	}
	@Override
	public List<Park> selectAllCompanyCarIsNotRent(int currentPage, int enterpriseId) {
		Session session=sessionFactory.getCurrentSession();
		Query query=session.createQuery("from Park p where p.parkContract.enterprise.enterpriseId=? and p.parkType=?");
		query.setParameter(0,enterpriseId);
		query.setParameter(1,0);
		companyCarCounts=query.list().size();
		int rowPage=5;
		query.setFirstResult((currentPage-1)*rowPage);
		query.setMaxResults(rowPage);
		return query.list();
	}

}
