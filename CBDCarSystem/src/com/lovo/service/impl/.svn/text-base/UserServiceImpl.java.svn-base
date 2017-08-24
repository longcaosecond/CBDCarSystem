package com.lovo.service.impl;

import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import com.lovo.bean.Complaint;
import com.lovo.bean.Deal;
import com.lovo.bean.Enterprise;
import com.lovo.bean.Rent;
import com.lovo.bean.User;
import com.lovo.bean.Want;
import com.lovo.dao.UserDao;
import com.lovo.service.UserService;

@Service("userServiceImpl")
public class UserServiceImpl implements UserService {

	@Resource
	private UserDao dao;

	/**
	 * 注册用户
	 */
	@Override
	public void registUser(User user) {
		user.setUserCredit(100);
		dao.insertUser(user);
	}

	@Override
	public User login(String userAccount, String userPwd, String ipAdess) {
		return dao.login(userAccount, userPwd);
	}

	@Override
	public void updateUser(User user) {
		int userId = user.getUserId();
		String userWork = user.getUserWork();
		String userAddress = user.getUserAddress();
		try {
			userAddress = new String(userAddress.getBytes("ISO-8859-1"), "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		try {
			userWork = new String(userWork.getBytes("ISO-8859-1"), "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		String userPhone = user.getUserPhone();
		String userEmail = user.getUserEmail();
		dao.updateUser(userWork, userAddress, userPhone, userEmail, userId);
	}

	@Override
	public User showUserById(int userId) {
		// TODO Auto-generated method stub
		return dao.selectUserById(userId);
	}

	@Override
	public void publishPakingByBaoZuPo(Rent rent) {
		// TODO Auto-generated method stub

	}

	@Override
	public void sendMessageToBaoZuPo(Want want, int currentPage) {
		// TODO Auto-generated method stub

	}

	@Override
	public int findUserAccount(String userAccount) {
		return dao.findUserAccount(userAccount);
	}

	@Override
	public void updateUserPwd(String userPwd, int userId) {
		// TODO Auto-generated method stub
		dao.updateUserPwd(userPwd, userId);
	}

	@Override
	public List<User> selectAllUser(int currentPage, String userName) {
		// TODO Auto-generated method stub
		return null;
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
	public List<Deal> selectAllDeal(int currentPage) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Deal> findDealByUserId(int userId, int currentPage, int pageSize) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Deal findDealByDealId(int dealId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void addComplaint(Complaint complaint) {
		// TODO Auto-generated method stub

	}

	@Override
	public List<Want> findWantInfo(int userId, int wantType, int currentPage, int pageSize) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int findDealCountByUserId(int userId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Want findWantByWantId(int wantId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateWantTypeByWantId(int wantId, int wantType) {
		// TODO Auto-generated method stub

	}

	@Override
	public int findWantCountByWantTypeAndId(int userId, int wantType) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int findWantCountByWantTypeAndUserId(int userId, int wantType) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Want> findWantInfoByZ(int userId, int currentPage, int pageSize) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void addDealInfo(Deal deal) {
		// TODO Auto-generated method stub

	}

	@Override // 注销用户
	public void logout(User user) {
	}

	@Override
	public void logout(Enterprise enterprise) {
		// TODO Auto-generated method stub
		
	}

}
