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
import com.lovo.dao.EnterpriseDao;

@Repository("enterpriseDaoImpl")
public class EnterpriseDaoImpl implements EnterpriseDao {
	public static int enterPriceCount;
	@Autowired
	@Qualifier("sessionFactory")
	private SessionFactory sessionFactory;
	@Override
	public List<Enterprise> selectAllEnterprise(int currentPage, String enterpriseName, String enterpriseAddress,
			String enterpriseContact, String enterprisePhone) {
		Session session=sessionFactory.getCurrentSession();
		Query query=session.createQuery("from Enterprise e where e.enterpriseName like :name and e.enterpriseAddress like :address and e.enterpriseContact like :contact and e.enterprisePhone like :phone and e.enterpriseType<"+2);
		query.setParameter("name","%"+enterpriseName+"%");
		query.setParameter("address","%"+enterpriseAddress+"%");
		query.setParameter("contact","%"+enterpriseContact+"%");
		query.setParameter("phone","%"+enterprisePhone+"%");
//		query.setParameter(0, 1);
		enterPriceCount=query.list().size();
		int rowPage=5;
		query.setFirstResult((currentPage-1)*rowPage);
		query.setMaxResults(rowPage);
		return query.list();
	}
	@Override
	public Enterprise login(String enterpriseAccount, String enterprisePwd) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Enterprise where enterpriseAccount=? and enterprisePwd=?");
		query.setParameter(0, enterpriseAccount);
		query.setParameter(1, enterprisePwd);
		Enterprise enterprise = (Enterprise) query.uniqueResult();
		System.out.println(enterprise);
		return enterprise;
	}

	@Override
	public void updateEnterprise(Enterprise enterprise) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Park> selectEnterpriseParking(int parkType) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public int checkenterpriseAccount(String checkenterpriseAccount) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Enterprise where enterpriseAccount=?");
		query.setParameter(0, checkenterpriseAccount);
		return query.list().size();
	}

	@Override
	public void addEnterPrice(Enterprise enterprise) {
		Session session = sessionFactory.getCurrentSession();
		session.save(enterprise);
	}
	
	@Override
	public void deleteEnterpriseById(int enterpriseId) {
		Session session=sessionFactory.getCurrentSession();
		Query query=session.createQuery("from Enterprise e where e.enterpriseId=?");
		query.setParameter(0, enterpriseId);
		Enterprise enterprise=(Enterprise) query.list().get(0);
		enterprise.setEnterpriseType(2);
		session.flush();
	}
	@Override
	public int findEnterPriceCount() {
//		Session session=sessionFactory.getCurrentSession();
//		Query query=session.createQuery("from Enterprise e where e.enterpriseName like :name and e.enterpriseAddress like :address and e.enterpriseContact like :contact and e.enterprisePhone like :phone");
//		query.setParameter("name","%"+enterpriseName+"%");
//		query.setParameter("address","%"+enterpriseAddress+"%");
//		query.setParameter("contact","%"+enterpriseContact+"%");
//		query.setParameter("phone","%"+enterprisePhone+"%");
//		Session session=sessionFactory.getCurrentSession();
//		Query query=session.createQuery("from Enterprise e where e.enterpriseName like :name and e.enterpriseAddress like :address and e.enterpriseContact like :contact and e.enterprisePhone like :phone");
//		query.setParameter("name","%"+enterpriseName+"%");
//		query.setParameter("address","%"+enterpriseAddress+"%");
//		query.setParameter("contact","%"+enterpriseContact+"%");
//		query.setParameter("phone","%"+enterprisePhone+"%");
//		System.out.println("--===---"+query.list().size()+"----===---");
		return enterPriceCount;
	}
	@Override
	public Enterprise findEnterPriceById(int id) {
		Session session=sessionFactory.getCurrentSession();
		Query query=session.createQuery("from Enterprise e where e.enterpriseId=?");
		query.setParameter(0, id);
		Enterprise enterprise=(Enterprise) query.list().get(0);
		return enterprise;
	}

	@Override
	public void updateEnterpriselc(Enterprise enterprise) {
		System.out.println("---------------------");
		System.out.println(enterprise.getEnterpriseName());
		System.out.println(enterprise.getEnterprisePwd());
		System.out.println("---------------------");
		Session session=sessionFactory.getCurrentSession();
		Query query=session.createQuery("from Enterprise where enterpriseName=?");
		query.setParameter(0, enterprise.getEnterpriseName());
		Enterprise e=(Enterprise) query.list().get(0);
		e.setEnterprisePwd(enterprise.getEnterprisePwd());
		session.flush();
	}
}
