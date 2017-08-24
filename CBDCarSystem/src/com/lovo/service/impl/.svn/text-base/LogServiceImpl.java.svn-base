package com.lovo.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.lovo.bean.Log;
import com.lovo.dao.LogDao;
import com.lovo.service.LogSrvice;
import com.lovo.util.PageBean;

@Service("logServiceImpl")
public class LogServiceImpl implements LogSrvice {
	@Resource
	private LogDao dao;
	
	@Override //添加新日志
	public void insertLog(Log log) {		
		dao.insertLog(log);
	}

	@Override //查看所有日志
	public List<Log> findAllLog(int currentpage) {
		PageBean page = new PageBean();
		int count = dao.countLog();
		page.setAll(count);
		page.setCurrentPage(currentpage);
		List<Log> logs = dao.findAllLog(page);
		return logs;
	}

}
