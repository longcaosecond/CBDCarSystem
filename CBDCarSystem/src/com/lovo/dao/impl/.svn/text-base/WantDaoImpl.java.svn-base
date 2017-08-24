package com.lovo.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.lovo.bean.Rent;
import com.lovo.bean.User;
import com.lovo.bean.Want;
import com.lovo.dao.WantDao;
import com.lovo.util.Status;

@Repository("wantDao")
public class WantDaoImpl implements WantDao {
	@Autowired
	@Qualifier("sessionFactory")
	private SessionFactory sessionFactory;
	@Override
	public void addWant(int rentId, int userId, String message) {
		// TODO Auto-generated method stub
		Session session =sessionFactory.getCurrentSession();
		Rent r=(Rent)session.load(Rent.class,rentId);
		User u=(User)session.load(User.class,userId);
		Want w=new Want();
		w.setRent(r);
		w.setUser(u);
		w.setWantMessage(message);
		w.setWantType(1);
		session.save(w);
		session.flush();
	}
	@Override
	public List<Want> selectWantsByUserId(int userId) {
		// TODO Auto-generated method stub
		Session session =sessionFactory.getCurrentSession();
		Query query=session.createQuery("from Want w where w.user.userId="+userId);
		List<Want> wants=query.list();
		return wants;
	}
   
	@Override
	public List<Want> findWantInfo(int userId,int wantType,int currentPage, int pageSize) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Want w where  w.wantType = ? and w.rent.user.userId = ?");
		query.setParameter(0, wantType);
		query.setParameter(1, userId);
		query.setFirstResult((currentPage-1)*pageSize);
		  query.setMaxResults(pageSize);
		 List<Want> list= query.list();
		return list;
	}
	
	@Override
	public List<Want> findWantInfoByZ(int userId, int currentPage, int pageSize) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Want w where  w.wantType = 3 and w.user.userId = ?");
		query.setParameter(0, userId);
		query.setFirstResult((currentPage-1)*pageSize);
		  query.setMaxResults(pageSize);
		 List<Want> list= query.list();
		return list;
	}
	
	@Override
	public Want findWantByWantId(int wantId) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
	      Want want = (Want) session.get(Want.class, wantId);
		return want;
	}

	@Override
	public void updateWantTypeByWantId(int wantId, int wantType) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		Want want = (Want) session.get(Want.class, wantId);
		want.setWantType(wantType);
		session.flush();
	}
	
	@Override
	public int findWantCountByWantTypeAndId(int userId, int wantType) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Want w where w.rent.user.userId = ? and w.wantType = ?");
		query.setParameter(0, userId);
		query.setParameter(1, wantType);
		List<Want> list = query.list();
		int numb = list.size();
		return numb;
	}

	@Override
	public int findWantCountByWantTypeAndUserId(int userId, int wantType) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Want w where w.user.userId = ? and w.wantType = ?");
		query.setParameter(0, userId);
		query.setParameter(1, wantType);
		List<Want> list = query.list();
		int numb = list.size();
		return numb;
	}
}

