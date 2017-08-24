package com.lovo.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.lovo.bean.Deal;
import com.lovo.dao.DealDao;

@Repository("dealDaoImpl")
public class DealDaoImpl implements DealDao{
	@Autowired
	@Qualifier("sessionFactory")
	private SessionFactory sessionFactory;
	
	@Override
	public Deal findDealByDealId(int dealId) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Deal d where  d.dealId = ?");
		query.setParameter(0, dealId);
		List<Deal> list = query.list();
		Deal deal = list.get(0);
		return deal;
	}
   
	@Override
	public int findDealCountByUserId(int userId) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Deal d where d.dealType = 1 and d.rent.user.userId = ?");
		query.setParameter(0, userId);
		List<Deal> list = query.list();
		int numb = list.size();
		return numb;
	}
	
	
	
	@Override
	public void addDealInfo(Deal deal) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.save(deal);
	}
	
	@Override
	public List<Deal> findDealByUserId(int userId,int currentPage, int pageSize) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Deal d where d.user.userId = ? and d.dealType = 1");
		query.setParameter(0, userId);
		query.setFirstResult((currentPage-1)*pageSize);
		query.setMaxResults(pageSize);
		List<Deal> list = query.list();
		return list;
	}

	@Override
	public List<Deal> findDealByUserIdByZ(int userId, int currentPage, int pageSize) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Deal d where d.rent.user.userId = ? and d.dealType = 1");
		query.setParameter(0, userId);
		query.setFirstResult((currentPage-1)*pageSize);
		query.setMaxResults(pageSize);
		List<Deal> list = query.list();
		return list;
	}

	@Override
	public int findDealCountByUserIdByZ(int userId) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Deal d where d.dealType = 1 and d.user.userId = ?");
		query.setParameter(0, userId);
		List<Deal> list = query.list();
		int numb = list.size();
		return numb;
	}

	@Override
	public Deal findDealByRentIdAndDealType(int rentId) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Deal d where d.dealType = 1 and d.rent.rentId = ?");
		query.setParameter(0, rentId);
		List<Deal> list = query.list();
		Deal deal = null;
		if(list.size()!=0){
			deal = list.get(0);
		}
		return deal;
	}
}
