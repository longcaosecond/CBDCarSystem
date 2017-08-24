package com.lovo.log;

import java.util.Date;
import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

import com.lovo.bean.Admin;
import com.lovo.bean.Enterprise;
import com.lovo.bean.Log;
import com.lovo.bean.User;
import com.lovo.service.LogSrvice;

@Aspect
@Component
public class UserLogger {
	@Pointcut("execution(* com.lovo.service.impl.*.lo*(..))")
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
	@AfterReturning(returning = "obj", pointcut = "getLogger()")
	public void intoDataBase(JoinPoint pjt, Object obj) {
		/*String mName = pjt.getSignature().getName();
		// 从session中获取ip地址及用户或管理员
		ipAdess = (String) session.getAttribute("ipAdess");
		u = (User) session.getAttribute("user");
		admin = (Admin) session.getAttribute("admin");
		log = new Log();
		log.setLogDate(new Date());
		// 用户登录日志
		int loginType = Integer.parseInt((String) session.getAttribute("loginType"));
		if ("login".equals(mName)) {
			ipAdess = (String) pjt.getArgs()[2];
			if(loginType == 0){
				u = (User) obj;
				userLogin(ipAdess, u);
			}else if(loginType == 1){
				Enterprise u = (Enterprise) obj;
				userLogin(ipAdess, u);
			}			
		}
		// 用户注销日志
		if ("logout".equals(mName)) {
			u = (User) pjt.getArgs()[0];
			if(loginType == 0){
				u = (User) obj;
				userLogout(u);
			}else if(loginType == 1){
				Enterprise u = (Enterprise) obj;
				userLogout(u);
			}
			
		}
		// 管理员登录
		if ("".equals(mName)) {
			admin = (Admin) obj;
			ipAdess = (String) pjt.getArgs()[2];
			adminLogin(ipAdess, admin);
		}
		// 管理员注销
		if ("".equals(mName)) {
			admin = (Admin) pjt.getArgs()[0];
			adminLogout(admin);
		}	
	}

	// 用户登录
	public void userLogin(String ipAdess, User u) {
		if (u != null) {
			// 设置日志记录表的属性字段
			name = "用户登陆记录";
			userName = "用户:" + u.getUserName();
			level = "登录日志";
			event = "id为:" + u.getUserId() + "的用户:" + u.getUserAccount() + ",在ip地址:" + ipAdess + ",登录了系统";
			// 封装日志信息并存入数据库
			log.setLogName(name);
			log.setUserName(userName);
			log.setLogLevel(level);
			log.setLogEvent(event);
			logser.insertLog(log);
		}
	}
	// 用户登录
		public void userLogin(String ipAdess, Enterprise u) {
			if (u != null) {
				// 设置日志记录表的属性字段
				name = "用户登陆记录";
				userName = "用户:" + u.getEnterpriseName();
				level = "登录日志";
				event = "id为:" + u.getEnterpriseId() + "的用户:" + u.getEnterpriseAccount() + ",在ip地址:" + ipAdess + ",登录了系统";
				// 封装日志信息并存入数据库
				log.setLogName(name);
				log.setUserName(userName);
				log.setLogLevel(level);
				log.setLogEvent(event);
				logser.insertLog(log);
			}
		}

	// 用户注销
	public void userLogout(User u) {
		if (u != null) {
			// 设置日志记录表的属性字段
			name = "用户注销记录";
			userName = "用户:" + u.getUserName();
			level = "注销日志";
			event = "id为:" + u.getUserId() + "的用户:" + u.getUserAccount() + ",在ip地址:" + ipAdess + ",退出了系统";
			// 封装日志信息并存入数据库
			log.setLogName(name);
			log.setUserName(userName);
			log.setLogLevel(level);
			log.setLogEvent(event);
			logser.insertLog(log);
		}
	}

	// 用户注销
		public void userLogout(Enterprise u) {
			if (u != null) {
				// 设置日志记录表的属性字段
				name = "用户注销记录";
				userName = "用户:" + u.getEnterpriseName();
				level = "注销日志";
				event = "id为:" + u.getEnterpriseId() + "的用户:" + u.getEnterpriseAccount() + ",在ip地址:" + ipAdess + ",退出了系统";
				// 封装日志信息并存入数据库
				log.setLogName(name);
				log.setUserName(userName);
				log.setLogLevel(level);
				log.setLogEvent(event);
				logser.insertLog(log);
			}
		}
		
	// 管理员登录
	public void adminLogin(String ipAdess, Admin admin) {
		if(admin !=null){
			
			
		}
	}

	// 管理员注销
	public void adminLogout(Admin admin) {
		if(admin !=null){
			
			
		}*/
	}
}
