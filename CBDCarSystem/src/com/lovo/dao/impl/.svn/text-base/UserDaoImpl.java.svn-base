package com.lovo.dao.impl;



import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import javax.swing.plaf.synth.SynthSeparatorUI;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.lovo.bean.Complaint;
import com.lovo.bean.Deal;
import com.lovo.bean.Rent;
import com.lovo.bean.User;
import com.lovo.bean.Want;
import com.lovo.dao.UserDao;
import com.lovo.util.PageBean;

@Repository("userDaoImpl")
public class UserDaoImpl implements UserDao
{

	@Autowired
	@Qualifier("sessionFactory")
	private SessionFactory sessionFactory;

	@Override
	public void insertUser(User user)
	{		
		Session session=sessionFactory.getCurrentSession();
		session.save(user);	
	}

	@Override
	public User login(String userAccount, String userPwd) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from User where userAccount=? and userPwd=?");
		query.setParameter(0, userAccount);
		query.setParameter(1, userPwd);
		User user = (User) query.uniqueResult();
		return user;
	}

	/* (non-Javadoc)
	 * @see com.lovo.dao.UserDao#updateUser(com.lovo.bean.User)
	 */
	@Override
	public void updateUser(String userWork,String userAddress,String userPhone,String userEmail,int userId) {
		Session session = sessionFactory.getCurrentSession();
		User user = (User) session.get(User.class, userId);
		user.setUserWork(userWork);
		user.setUserAddress(userAddress);
		user.setUserPhone(userPhone);
		user.setUserEmail(userEmail);
		session.flush();
	}

	@Override
	public int findUserAccount(String userAccount) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("select count(*) from User where userAccount=?");
		query.setParameter(0, userAccount);
		Long count = (Long) query.uniqueResult();
		return count.intValue();
	}

	@Override
	public User selectUserById(int userId) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		User user = (User) session.get(User.class, userId);
		return user;
	}

	@Override
	public List<User> selectAllUser(int currentPage, String userName) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertPakingByBaoZuPo(Rent rent) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Want> selectAllWant(Date rentStartDate, Date rentEndDate, int currentPage, BigDecimal rentPrice,
			String rentAddress) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Want selectWantById(int wantId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertMessageToBaoZuPo(Want want, int currentPage) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Deal> selectAllDeal(int currentPage) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateUserPwd(String userPwd,int userId) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		User user = (User) session.get(User.class,userId);
		user.setUserPwd(userPwd);
		session.flush();
	}

	@Override
	public void updateUserCreditByUserId(int userId) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		User user = (User) session.get(User.class, userId);
		user.setUserCredit(user.getUserCredit()-1);
		session.flush();
	}
}
