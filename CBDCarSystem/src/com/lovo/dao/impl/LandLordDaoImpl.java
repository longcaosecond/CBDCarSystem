package com.lovo.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.lovo.bean.Rent;
import com.lovo.dao.LandLordDao;
@Repository("landLordDaoImpl")
public class LandLordDaoImpl implements LandLordDao {
	public static int landLordNums;
	@Autowired
	@Qualifier("sessionFactory")
	private SessionFactory sessionFactory;
	@Override
	public List<Rent> selectAllLandLordApplyRent(int currentPage) {
		Session session=sessionFactory.getCurrentSession();
		Query query=session.createQuery("from Rent r where r.rentType=?");
		query.setParameter(0, 0);
		landLordNums=query.list().size();
		int rowPage=5;
		query.setFirstResult((currentPage-1)*rowPage);
		query.setMaxResults(rowPage);
		List<Rent> rents=query.list();
		return rents;
	}
	@Override
	public int selectAllLandLordApplyRentNums() {
		// TODO Auto-generated method stub
		return landLordNums;
	}
	@Override
	public int passUpdateRentType(int n) {
		Session session=sessionFactory.getCurrentSession();
		Query query=session.createQuery("from Rent r where r.rentId=?");
		query.setParameter(0, n);
		List<Rent> rents=query.list();
		Rent rent=rents.get(0);
		rent.setRentType(1);
		session.flush();
		return rents.size();
	}
	@Override
	public int refuseUpdateRentType(int n) {
		Session session=sessionFactory.getCurrentSession();
		Query query=session.createQuery("from Rent r where r.rentId=?");
		query.setParameter(0, n);
		List<Rent> rents=query.list();
		Rent rent=rents.get(0);
		rent.setRentType(3);
		session.flush();
		return rents.size();
	}

}
