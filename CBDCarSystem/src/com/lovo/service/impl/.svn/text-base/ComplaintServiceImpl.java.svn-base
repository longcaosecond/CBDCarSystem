package com.lovo.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.lovo.bean.Complaint;
import com.lovo.dao.ComplaintDao;
import com.lovo.dao.UserDao;
import com.lovo.service.ComplaintService;
@Service("complaintServiceImpl")
public class ComplaintServiceImpl implements ComplaintService {
	@Resource(name = "complaintDaoImpl")
    private ComplaintDao dao;
	@Resource(name = "userDaoImpl")
	private UserDao udao;
	
	@Override
	public void addComplaint(Complaint complaint) {
		// TODO Auto-generated method stub
		dao.addComplaint(complaint);
	}
	
	@Override
	public List<Complaint> findAllComplaint(int currentPage, int pageSize) {
		// TODO Auto-generated method stub
		return dao.findAllComplaint(currentPage,pageSize);
	}

	@Override
	public Complaint findComplaintById(int complaintId) {
		// TODO Auto-generated method stub
		return dao.findComplaintById(complaintId);
	}

	@Override
	public int getComplaintCount() {
		// TODO Auto-generated method stub
		int numb = dao.getComplaintCount();
		int number = 0;
		if(numb%7==0){
			number = numb/7;
		}else{
			number = numb/7+1;
		}
		return number;
	}
	@Transactional(propagation = Propagation.REQUIRED,isolation = Isolation.READ_COMMITTED)
	@Override
	public void updateComplaintType(int complaintId, int complaintType, int userId) {
		// TODO Auto-generated method stub
		if(complaintType==1){
			dao.updateComplaintType(complaintId, complaintType);
		}else{
			dao.updateComplaintType(complaintId, complaintType);
			udao.updateUserCreditByUserId(userId);
		}
	}

	@Override
	public Complaint findComplaintByTUserIdAndDealId(int userId, int dealId) {
		// TODO Auto-generated method stub
		return dao.findComplaintByTUserIdAndDealId(userId, dealId);
	}

}
