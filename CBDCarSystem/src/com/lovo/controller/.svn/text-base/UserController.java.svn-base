package com.lovo.controller;

import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lovo.bean.Enterprise;
import com.lovo.bean.Log;
import com.lovo.bean.User;
import com.lovo.service.EnterpriseService;
import com.lovo.service.LogSrvice;
import com.lovo.service.UserService;

@Controller
public class UserController {
	@Resource
	private UserService userService;
	@Resource
	private EnterpriseService enterpriseService;

	// 用户注册
	@RequestMapping(path = "/regist", method = RequestMethod.POST)
	public String regist(User user, HttpServletRequest req) {
		String address = user.getUserAddress();
		String name = user.getUserName();
		String work = user.getUserWork();
		String userAddress = null;
		String userName = null;
		String userWork = null;
		try {
			// 处理乱码
			userAddress = new String(address.getBytes("ISO-8859-1"), "utf-8");
			userName = new String(name.getBytes("ISO-8859-1"), "utf-8");
			userWork = new String(work.getBytes("ISO-8859-1"), "utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		user.setUserAddress(userAddress);
		user.setUserName(userName);
		user.setUserWork(userWork);
		// 对用户密码进行加密处理
		String userPwd = DigestUtils.md5Hex(user.getUserPwd());
		Date date = new Date();
		user.setUserPwd(userPwd);
		user.setUserDate(date);
		req.getSession().setAttribute("user", user);
		userService.registUser(user);
		return "redirect:all/usermain.jsp";
	}

	// 用户登录
	@RequestMapping(path = "/login", method = RequestMethod.POST)
	public String login(String name, String pwd, String type, HttpServletRequest request) {
		// 对密码进行加密处理
		String userPwd = DigestUtils.md5Hex(pwd);
		HttpSession session = request.getSession();
		session.setAttribute("loginType", type);
		session.setAttribute("userLoginName", name);
		session.setAttribute("loginErrotMsg", "用户名或密码错误");
		String ipAdess = request.getRemoteAddr();
		if ("0".equals(type)) {// 0:表示个人用户登录,1:表示企业用户登录,在页面上设置默认选择0;
			User user = userService.login(name, userPwd, ipAdess);
			if (user != null) {// 表示登录成功
				session.setMaxInactiveInterval(30 * 60);
				session.setAttribute("user", user);
				session.setAttribute("ipAdess", ipAdess);
				return "redirect:all/usermain.jsp";
			} else {// 登录失败
				request.setAttribute("errorMsg", "账号或密码错误，登录失败");
				return "forward:login/user/login.jsp";
			}
		} else {
			Enterprise enterprise = enterpriseService.login(name, userPwd,ipAdess);
			System.out.println(enterprise);
			if (enterprise != null) {// 表示登录成功
				session.setAttribute("enterprise", enterprise);
				return "redirect:jsp/enterprise/company1.jsp";// 跳转至企业主界面
			} else {// 登录失败
				request.setAttribute("errorMsg", "账号或密码错误，登录失败");
				return "login/user/login";// 跳转至登录界面
			}
		}
	}

	// 用户修改信息
	@RequestMapping(path = "/changeUserInfo", method = RequestMethod.POST)
	public String changeUserInfo(User user, HttpServletRequest request) {
		String id = request.getParameter("userId");
		int userId = Integer.parseInt(id);
		user.setUserId(userId);
		userService.updateUser(user);
		User user1 = userService.showUserById(userId);
		HttpSession session = request.getSession();
		session.setAttribute("user", user1);
		return "forward:jsp/user/userInfo.jsp";// 跳转至个人中心面
	}

	// 用户修改密码
	@RequestMapping(path = "/changeUserPwd", method = RequestMethod.POST)
	public String changeUserPwd(User user, HttpServletRequest request) {
		String id = request.getParameter("userId");
		int userId = Integer.parseInt(id);
		String userPwd = user.getUserPwd();
		String pwd = DigestUtils.md5Hex(userPwd);
		request.getSession().setAttribute("user", user);
		userService.updateUserPwd(pwd, userId);
		return "forward:jsp/user/userInfo.jsp";// 跳转至个人中心面
	}

	// 判断原密码是否正确
	@RequestMapping(path = "/checkPwd", method = RequestMethod.GET)
	public void checkPwd(PrintWriter write, HttpServletRequest request) {
		// 消除session
		String id = request.getParameter("userId");
		String pwd = request.getParameter("userPwd");
		int userId = Integer.parseInt(id);
		String userPwd = DigestUtils.md5Hex(pwd);
		User user = userService.showUserById(userId);
		if (userPwd.equals(user.getUserPwd())) {
			write.print("");
		} else {
			write.print("no");
		}

	}

	// 用户注销
	@RequestMapping(path = "/exit.do", method = RequestMethod.GET)
	public String exit(HttpSession session) {
		session.removeAttribute("user");
		session.removeAttribute("enterprise");
		return "redirect:all/usermain.jsp";// 跳转至主界面
	}

	// 从session中获取用户信息
	@RequestMapping(path = "/getUserBySession.do", method = RequestMethod.POST)
	public @ResponseBody User getUserBySession(HttpSession session) {
		User user = (User) session.getAttribute("user");
		return user;
	}

	@RequestMapping(path = "/findUserAccount", method = RequestMethod.GET)
	public void findUserAccount(String userAccount, PrintWriter out) {
		System.out.println(userAccount);
		// 查找该类型用户的账号是否已经存在
		int count = userService.findUserAccount(userAccount);
		// count: 0:不存在,1:存在
		out.print(count);
	}

	@Resource
	private LogSrvice logser;

	// 查询所有日志
	@RequestMapping(path = "findAllLogs.do", method = RequestMethod.POST)
	public @ResponseBody List<Log> findAllLogs(String currentPage) {
		int pageNow = 1;
		if (currentPage != null || !("".equals(currentPage))) {
			String current = currentPage.trim();
			pageNow = Integer.parseInt(current);
		}
		List<Log> logs = logser.findAllLog(pageNow);
		return logs;
	}

	/**
	 * 判断是否是登录状态
	 * 
	 * @param session
	 * @param out
	 */
	@RequestMapping(path = "/isLogin.do", method = RequestMethod.POST)
	public void isLogin(HttpSession session, PrintWriter out) {
		User user = (User) session.getAttribute("user");
		if (user != null)
			out.write("true");
		else
			out.write("false");
	}
}
