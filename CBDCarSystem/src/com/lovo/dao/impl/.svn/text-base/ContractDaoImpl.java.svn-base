package com.lovo.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.lovo.bean.Contract;
import com.lovo.dao.ContractDao;

@Repository
public class ContractDaoImpl implements ContractDao {

	@Autowired
	@Qualifier("sessionFactory")
	private SessionFactory sessionFactory;
	
	@Override
	public List<Contract> findAllContractDao() {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Contract");
		@SuppressWarnings("unchecked")
		List<Contract> list = query.list();
		return list;
	}

	@Override
	public Contract findContractById(int contractId) {
		Session session = sessionFactory.getCurrentSession();
		Contract contract = (Contract) session.get(Contract.class, contractId);
		return contract;
	}

}
