package com.lovo.dao.impl;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.lovo.bean.Rent;
import com.lovo.dao.RentDao;
import com.lovo.util.PageBean;
@Repository("rentDaoImpl")
public class RentDaoImpl implements RentDao {
	@Autowired
	@Qualifier("sessionFactory")
	private SessionFactory sessionFactory;
	
	@Override
	public List<Rent> selectAllRent(Date rentStartDate, Date rentEndDate,PageBean page,BigDecimal minPrice,BigDecimal maxPrice,
			String rentAddress) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Rent r where r.rentAddress like ? and r.rentStartDate>= ? and r.rentEndDate<= ? and r.rentPrice >=? and r.rentPrice <=? and r.rentType = 1");
		query.setParameter(0, "%"+rentAddress+"%");
		query.setDate(1, rentStartDate);
		query.setDate(2, rentEndDate);
		query.setBigDecimal(3, minPrice);
		query.setBigDecimal(4, maxPrice);
		int index=page.getStartIndex();
		query.setFirstResult(index);
		query.setMaxResults(page.getPageSize());
		List<Rent> rents=query.list();
		return rents;
	}
	
	@Override
	public Rent selectRentById(int renId) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		Rent rent=(Rent) session.get(Rent.class,renId);
		return rent;
	}

	@Override
	public int selectAllRentCount(Date rentStartDate, Date rentEndDate, int currentPage,BigDecimal minPrice, BigDecimal maxPrice,
			String rentAddress) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("select count(*) from Rent r where r.rentAddress like ? and r.rentStartDate>= ? and r.rentEndDate<= ? and r.rentPrice >=? and r.rentPrice <=? and r.rentType = 1");
		query.setParameter(0, "%"+rentAddress+"%");
		query.setParameter(1, rentStartDate);
		query.setParameter(2, rentEndDate);
		query.setParameter(3, minPrice);
		query.setParameter(4, maxPrice);
		 long count=(Long)query.uniqueResult();
			System.out.println(count);
			int len=(int)count;
			return len;
	}

	@Override
	public List<Rent> findMyRents(int userId, PageBean page, String address, Date startDate, Date endDate,
			BigDecimal minPrice, BigDecimal maxPrice) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Rent r where r.rentAddress like ? and r.rentStartDate> ? and r.rentEndDate< ? and r.rentPrice >? and r.rentPrice <? and r.user.userId= ?");
		query.setParameter(0, "%"+address+"%");
		query.setDate(1, startDate);
		query.setDate(2, endDate);
		query.setBigDecimal(3, minPrice);
		query.setBigDecimal(4, maxPrice);
		query.setInteger(5,userId);
		int index=page.getStartIndex();
		query.setFirstResult(index);
		query.setMaxResults(page.getPageSize());
		List<Rent> rents=query.list();
		return rents;
	}

	@Override
	public int findMyRentsCount(int userId, PageBean page, String address, Date startDate, Date endDate,
			BigDecimal minPrice, BigDecimal maxPrice) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("select count(*) from Rent r where r.rentAddress like ? and r.rentStartDate> ? and r.rentEndDate< ? and r.rentPrice >? and r.rentPrice <? and r.user.userId= ?");
		query.setParameter(0, "%"+address+"%");
		query.setDate(1, startDate);
		query.setDate(2, endDate);
		query.setBigDecimal(3, minPrice);
		query.setBigDecimal(4, maxPrice);
		query.setInteger(5,userId);
		 long count=(Long)query.uniqueResult();
		int len=(int)count;
		return len;
	}

	@Override
	public void addRent(Rent rent) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.save(rent);
		session.flush();
	}

	@Override //包租婆修改车位的部分信息
	public void updataMyRent(Rent rent) {
		Session session = sessionFactory.getCurrentSession();
		int rentId = rent.getRentId();
		BigDecimal price = rent.getRentPrice();
		Date starData = rent.getRentStartDate();
		Date endData = rent.getRentEndDate();
		String disc = rent.getRentMessage();
		String poto = rent.getRentCarPicture();
		Rent oldRent = (Rent) session.get(Rent.class,rentId);
		oldRent.setRentPrice(price);
		oldRent.setRentStartDate(starData);
		oldRent.setRentEndDate(endData);
		oldRent.setRentMessage(disc);
		oldRent.setRentCarPicture(poto);
		session.flush();
	}

	@Override //包租婆删除未出租的空闲车位
	public void deleteMyRent(Integer rentId) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(session.get(Rent.class, rentId));
		session.flush();
	}

	@Override //根据产权号码验是否证重复
	public int selectRentByNum(String rentCnum) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("select count(*) from Rent r where r.rentCnumber=?");
		query.setParameter(0, rentCnum);
		long count = (long) query.uniqueResult();
		int res = (int) count;
		return res;
	}


	@Override
	public List<Rent> findRentByUserIdAndRentType(int userId) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Rent r where r.user.userId = ?");
		query.setParameter(0, userId);
		List<Rent> list = query.list();
		return list;
	}
	
	@Override
	public void updateRentTypeWhenSuccess(int rentId, int rentType) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		Rent rent = (Rent) session.get(Rent.class, rentId);
		rent.setRentType(rentType);
		session.flush();		
	}

}
