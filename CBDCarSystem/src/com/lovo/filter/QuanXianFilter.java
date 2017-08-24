package com.lovo.filter;

import java.io.IOException;
import java.util.Set;

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
import com.lovo.bean.Power;
import com.lovo.bean.User;
import com.lovo.util.Status;

public class QuanXianFilter implements Filter {

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
		System.out.println("权限"+url);
		//User user=(User)session.getAttribute("user");
		Manager manager=(Manager)session.getAttribute("manager");
		//user限权
		//if(user!=null){
			if(url.indexOf("/user/")>0||url.indexOf("/enterprise/")>0){
				//if(user.getUserType()==Status.BAOZUPO){
					chain.doFilter(req, res);
				}
				/*else{
					//提示请升级为包租婆
					resp.sendRedirect(request.getContextPath()+"/all/userNoPower.jsp");//待修改
				}
			}
			else if(url.indexOf("/manager/")==-1){chain.doFilter(req, res);}//普通页面放行
		}*/
		//管理员限权
		 if(manager!=null){
			//访问can文件夹直接放行
			if(url.indexOf("/can/")>0){
				chain.doFilter(req, res);
			}else 
				if(url.indexOf("/manager/")>0)
				{
			Set<Power> powers=manager.getPowers();
				Boolean b=false;
				for(Power power:powers)
				{//判断是否有限权
					if(url.indexOf(power.getPowerName())>0){
						b=true;
						break;
					}
				}
				if(b){
					chain.doFilter(req, res);//放行
				}
				else{
					resp.sendRedirect(request.getContextPath()+"/all/managerNoPower.jsp");//跳转权限不足页面，待修改
				}
			}
	}
	}
	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		
	}

}
