package com.lovo.log;

import java.util.Date;
import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

import com.lovo.bean.Admin;
import com.lovo.bean.Log;
import com.lovo.bean.User;
import com.lovo.service.LogSrvice;

@Aspect
@Component
public class SqlLogger {
	/*@Pointcut("execution(* com.lovo.service.impl.*.*(..))")
	public void getLogger() {
	}

	@Resource
	private HttpSession session;

	@Resource
	private LogSrvice logser;

	private String ipAdess;
	private String name;
	private String userName;
	private String level;
	private String event;
	private User u;
	private Admin admin;
	private Log log;

	// 数据库增删改日志记录
	@After("getLogger()")
	public void intoDataBase(JoinPoint pjt) {
		String mName = pjt.getSignature().getName();
		// 从session中获取ip地址及用户或管理员
		ipAdess = (String) session.getAttribute("ipAdess");
		u = (User) session.getAttribute("user");
		admin = (Admin) session.getAttribute("admin");
		log = new Log();
		log.setLogDate(new Date());
		if (u != null || admin != null) {
			if (u != null) {
				userName = "用户:" + u.getUserName();
				event = "id为:" + u.getUserId() + "的用户:" + u.getUserAccount() + ",在ip地址:" + ipAdess + ",调用了方法" + mName;
			} else if (admin != null) {
				userName = "管理员:" + admin.getAdminAccount();
				event = "管理员:" + admin.getAdminId() + ",在ip地址:" + ipAdess + ",调用了方法" + mName;
			}
			log.setUserName(userName);
			// 添加操作
			if (mName.startsWith("add") || mName.startsWith("regist")) {
				addMethod(mName); 
			}
			// 删除数据
			if (mName.startsWith("delete")) {
				deletMethod(mName);
			}
			// 修改数据
			if (mName.startsWith("updata")) {
				updataMethod(mName);
			}
		}
	}

	// 添加日志
	public void addMethod(String method) {
		name = "注册或添加记录";
		level = "添加日志";
		event += "上传了数据";
		log.setLogName(name);
		log.setLogLevel(level);
		log.setLogEvent(event);
		logser.insertLog(log);
	}

	// 删除日志
	public void deletMethod(String method) {
		name = "数据删除记录";
		level = "删除日志";
		event += "删除了数据";
		log.setLogName(name);
		log.setLogLevel(level);
		log.setLogEvent(event);
		logser.insertLog(log);
	}

	// 修改日志
	public void updataMethod(String method) {
		name = "数据修改记录";
		level = "修改日志";
		event += "修改了数据";
		log.setLogName(name);
		log.setLogLevel(level);
		log.setLogEvent(event);
		logser.insertLog(log);
	}*/
}
