package com.lovo.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.lovo.bean.Log;
import com.lovo.dao.LogDao;
import com.lovo.util.PageBean;

@Repository("logDaoImpl")
public class LogDaoImpl implements LogDao {

	@Autowired
	@Qualifier("sessionFactory")
	private SessionFactory sessionFactory;
	
	@Override //添加新日志
	public void insertLog(Log log) {
		Session session = sessionFactory.getCurrentSession();
		session.save(log);
		session.flush();
	}

	@Override //查看所有日志
	public List<Log> findAllLog(PageBean page) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Log");
		query.setFirstResult(page.getStartIndex());
		query.setMaxResults(page.getPageSize());
		List<Log> logs= query.list();
		return logs;
	}

	@Override //查询总的日志记录数
	public int countLog() {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("select count(*) from Log");
		long count=(Long)query.uniqueResult();
		int len=(int)count;
		return len;
	}
}
