package com.lovo.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lovo.bean.Complaint;
import com.lovo.bean.Deal;
import com.lovo.bean.Rent;
import com.lovo.bean.User;
import com.lovo.bean.Want;
import com.lovo.service.ComplaintService;
import com.lovo.service.DealService;
import com.lovo.service.RentService;
import com.lovo.service.WantService;

@Controller
public class DealController {
	@Resource(name = "dealServiceImpl")
	private DealService service;
	@Resource(name = "wantServiceImpl")
	private WantService wservice;
	@Resource(name = "rentServiceImpl")
	private RentService rservice;
	@Resource(name = "complaintServiceImpl")
	private ComplaintService cservice;
	/**
	 * 
	 * @param session 获取到当前session中的用户对象
	 * @return 返回对应的信息到页面
	 */
	
	@RequestMapping(path="getDealInfo.do",method=RequestMethod.GET)
	public @ ResponseBody List<Deal> getDealInfo(HttpSession session,HttpServletRequest request,HttpServletResponse response){
		User user = (User) session.getAttribute("user");
		if(user==null){
			try {
				response.sendRedirect("login/user/login.jsp");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		String numb = request.getParameter("currentPage");
		int currentPage = Integer.parseInt(numb);
		int userId = user.getUserId();
		int pageSize = 5;
		List<Deal> list = service.findDealByUserIdByz(userId,currentPage,pageSize);
		return list;
		
	}
	
	@RequestMapping(path="getDealInfoByZ.do",method=RequestMethod.GET)
	public @ResponseBody List<Deal> getDealInfoByZ(HttpSession session,HttpServletRequest request,HttpServletResponse response){
		User user = (User) session.getAttribute("user");
		if(user==null){
			try {
				response.sendRedirect("login/user/login.jsp");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		String numb = request.getParameter("currentPage");
		int currentPage = Integer.parseInt(numb);
		int userId = user.getUserId();
		int pageSize = 5;
		List<Deal> list = service.findDealByUserId(userId,currentPage,pageSize);
		return list;
	}
	
	/**
	 * 
	 * @param request 获取页面传递过来的参数
	 * @param session 用于保存deal对象
	 * @return 跳转到投诉的详情页面
	 */
	
	@RequestMapping(path="dealInfo.do",method=RequestMethod.GET)
	public String dealInfo(HttpServletRequest request,HttpSession session,HttpServletResponse response){
		User user = (User) session.getAttribute("user");
		if(user==null){
			try {
				response.sendRedirect("login/user/login.jsp");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		int userId = user.getUserId();
		String id = request.getParameter("dealId");
		int dealId = Integer.parseInt(id);
		Complaint complaint =  cservice.findComplaintByTUserIdAndDealId(userId, dealId);
		if(complaint!=null){
			request.setAttribute("yitousu", "您已经投诉过该用户了");
			return "forward:jsp/user/dealInfo.jsp";
		}
		Deal deal = service.findDealByDealId(dealId);
		session.setAttribute("deal", deal);
		return "forward:jsp/user/dealInfoEvent.jsp";
	}
	
	/**
	 *  获取到总的信息条数，判断总的页数 并显示到页面中
	 * @param write 用于异步请求的返回
	 * @param session 用于获取session中的用户对象
	 */
	
	@RequestMapping(path="getDealCount.do",method=RequestMethod.GET)
	public void getDealCount(PrintWriter write,HttpSession session,HttpServletResponse response){
		User user = (User) session.getAttribute("user");
		if(user==null){
			try {
				response.sendRedirect("login/user/login.jsp");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		int userId = user.getUserId();
		int numb = service.findDealCountByUserId(userId);
		int totalPage = 0;
		if(numb%5==0){
			totalPage = numb/5;
		}else{
			totalPage = numb/5+1;
		}
		write.print(String.valueOf(totalPage));
	}
	
	/**
	 *  获取到总的信息条数，判断总的页数 并显示到页面中
	 * @param write 用于异步请求的返回
	 * @param session 用于获取session中的用户对象
	 */
	
	@RequestMapping(path="getDealCountByZ.do",method=RequestMethod.GET)
	public void getDealCountByZ(PrintWriter write,HttpSession session,HttpServletResponse response){
		User user = (User) session.getAttribute("user");
		if(user==null){
			try {
				response.sendRedirect("login/user/login.jsp");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		int userId = user.getUserId();
		int numb = service.findDealCountByUserIdByZ(userId);
		int totalPage = 0;
		if(numb%5==0){
			totalPage = numb/5;
		}else{
			totalPage = numb/5+1;
		}
		write.print(String.valueOf(totalPage));
	}
	
	
	/**
	 * 当用户选择成交的时候需要向交易成交表添加记录
	 * @param session 获取session中的数据
	 * @return 跳转到指定界面
	 */
	@Transactional(propagation = Propagation.REQUIRED,isolation = Isolation.READ_COMMITTED)
	@RequestMapping(path="addDealIndo.do",method=RequestMethod.GET)
	public String addDealIndo(HttpSession session,HttpServletResponse response){
		User user = (User) session.getAttribute("user");
		if(user==null){
			try {
				response.sendRedirect("login/user/login.jsp");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		Want want = (Want) session.getAttribute("want");
		if(want==null){
			try {
				response.sendRedirect("login/user/login.jsp");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		int wantId = want.getWantId();
		Rent rent = want.getRent();
		int rentId = rent.getRentId();
		Date startDate = rent.getRentStartDate();
		Date endDate = rent.getRentEndDate();
		BigDecimal dealPrice = rent.getRentPrice();
		Deal deal = new Deal();
		deal.setDealEndDate(endDate);
		deal.setDealPrice(dealPrice);
		deal.setDealStartDate(startDate);
		deal.setRent(rent);
		deal.setUser(user);
		deal.setDealType(1);
		service.addDealInfo(deal);
		wservice.updateWantTypeByWantId(wantId, 5);
	     rservice.updateRentTypeWhenSuccess(rentId, 2);
		return "forward:jsp/user/informationRight.jsp";
		
	}
}
