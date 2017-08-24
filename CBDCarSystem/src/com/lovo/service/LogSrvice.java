package com.lovo.service;

import java.util.List;

import com.lovo.bean.Log;
import com.lovo.util.PageBean;

public interface LogSrvice {
	/**
	 * 添加新日志
	 * @param log
	 */	
	public void insertLog(Log log);
	
	/**
	 * 查看所有日志
	 * @param page
	 * @return
	 */
	public List<Log> findAllLog(int currentpage);
}
