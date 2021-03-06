package com.lovo.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lovo.bean.Manager;
import com.lovo.bean.User;

public class LoginJspFilter implements Filter {

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		HttpServletRequest request=(HttpServletRequest)req;
		HttpServletResponse resp=(HttpServletResponse)res;
		StringBuffer url=request.getRequestURL();
		HttpSession session=request.getSession();
		System.out.println(url);
		 if(url.indexOf("/user/")>0)
		{
			User user=(User) session.getAttribute("user");
			if(user!=null)
			resp.sendRedirect(request.getContextPath()+"/all/usermain.jsp");//待修改
			else{
				chain.doFilter(req, res);
			}
		}
		else if(url.indexOf("/manager/")>0){
			Manager manager=(Manager) session.getAttribute("manager");
			if(manager!=null)
			resp.sendRedirect(request.getContextPath()+"/jsp/manager/can/personalmanager.jsp");//待修改
			else{
				chain.doFilter(req, res);
			}
		}
	}
	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		
	}

}
