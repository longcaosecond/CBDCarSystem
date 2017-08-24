package com.lovo.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.lovo.bean.Complaint;
import com.lovo.dao.ComplaintDao;
@Repository("complaintDaoImpl")
public class ComplaintDaoImpl implements ComplaintDao {
	@Autowired
	@Qualifier("sessionFactory")
	private SessionFactory sessionFactory;
	
	@Override
	public void addComplaint(Complaint complaint) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.save(complaint);
		
	}
	
	@Override
	public Complaint findComplaintByTUserIdAndDealId(int userId, int dealId) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
			Query query = session.createQuery("from Complaint c where c.tUser.userId = ? and c.deal.dealId = ?");
			query.setParameter(0, userId);
			query.setParameter(1, dealId);
			List<Complaint> list = query.list();
			Complaint complaint = null;
			if(list.size()==0){
				
			}else{
			 complaint = list.get(0);
			}
		return complaint;
	}
	
	@Override
	public List<Complaint> findAllComplaint(int currentPage, int pageSize) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Complaint c where  c.complaintType = 0");
		query.setFirstResult((currentPage-1)*pageSize);
		query.setMaxResults(pageSize);
		List<Complaint> list = query.list();
		return list;
	}

	@Override
	public Complaint findComplaintById(int complaintId) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		Complaint complaint = (Complaint) session.get(Complaint.class, complaintId);
		return complaint;
	}

	@Override
	public int getComplaintCount() {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Complaint c where  c.complaintType = 0");
		List<Complaint> list = query.list();
		int numb = list.size();
		return numb;
	}

	@Override
	public void updateComplaintType(int complaintId, int complaintType) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		Complaint complaint = (Complaint) session.get(Complaint.class, complaintId);
		complaint.setComplaintType(complaintType);
		session.flush();
	}

}
