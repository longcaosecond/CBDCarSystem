package com.lovo.controller;

import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lovo.bean.Complaint;
import com.lovo.bean.Deal;
import com.lovo.bean.Rent;
import com.lovo.bean.User;
import com.lovo.service.ComplaintService;

@Controller
public class ComplaintController {
	@Resource(name = "complaintServiceImpl")
	private ComplaintService service;
	
	/**
	 * 根据页面传递过来的消息 封装成一个投诉的对象，并保存到数据库中
	 * @param request 获取传递过来的参数
	 * @param session 获取当前session中的用户对象 和 合约对象
	 * @return 返回到用户中心页面
	 */
	
	@RequestMapping(path="wantInfo.do",method=RequestMethod.POST)
	public String wantInfo(String complaintContent,HttpServletRequest request,HttpSession session){
		try {
			complaintContent = new String(complaintContent.getBytes("ISO-8859-1"),"UTF-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		System.out.println(complaintContent);
		Deal deal = (Deal) session.getAttribute("deal");
		if(deal==null){
			return "redirect:login/user/login.jsp";
		}
		Rent rent = deal.getRent();
		User user = deal.getUser();
		User user1 = rent.getUser();
		User user2 = (User) session.getAttribute("user");
		if(user2==null){
			return "redirect:login/user/login.jsp";
		}
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time = format.format(date);
		Date date1 = null;
		try {
			 date1 = format.parse(time);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Complaint complaint = new Complaint();
		if(user2.getUserId()==user.getUserId()){
			complaint.settUser(user);
			complaint.setbUser(user1);
		}else{
			complaint.settUser(user1);
			complaint.setbUser(user);
		}
		complaint.setDeal(deal);
		complaint.setComplaintDate(date1);
		complaint.setComplaintContent(complaintContent);
		complaint.setComplaintType(0);
		service.addComplaint(complaint);
		return "forward:jsp/user/userInfo.jsp";
	}
	
	/**
	 * 返回所有的没有解决的投诉
	 * @param request 用于获取传递过来的参数
	 * @return 返回查询出来的所有结果
	 */
	@RequestMapping(path="getComplaintInfo",method=RequestMethod.GET)
	public @ResponseBody List<Complaint> getComplaintInfo(HttpServletRequest request){
		String current = request.getParameter("currentPage");
		int currentPage = Integer.parseInt(current);
		int pageSize = 7;
		List<Complaint> list = service.findAllComplaint(currentPage, pageSize);
		return list;
		
	}
	
	/**
	 * 查询总的页码条数
	 * @param write 返回给前台总的页码条数
	 */
	@RequestMapping(path="getComplaintCount",method=RequestMethod.GET)
	public void getComplaintCount(PrintWriter write){
		int numb = service.getComplaintCount();
		write.print(String.valueOf(numb));
	}
	
	/**
	 * 根据传递过来的id查询出complaint对象 并跳转到指定页面
	 * @param request 获取传递过来的参数
	 * @param session 用于存数据
	 * @return 跳转到指定的页面中
	 */
	@RequestMapping(path="showComplaint",method=RequestMethod.GET)
	public String showComplaint(HttpServletRequest request,HttpSession session){
		String id = request.getParameter("complaintId");
		int complaintId = Integer.parseInt(id);
		Complaint complaint = service.findComplaintById(complaintId);
		session.setAttribute("complaint", complaint);
		return "forward:jsp/manager/complain/showComplaintInfo.jsp";
	}
	
	@RequestMapping(path="changeComplaintType",method=RequestMethod.GET)
	public String changeComplaintType(HttpServletRequest request,HttpSession session){
		String id = request.getParameter("complaintType");
		int complaintType = Integer.parseInt(id);
		Complaint complaint = (Complaint) session.getAttribute("complaint");
		if(complaint==null){
			return "redirect:login/user/login.jsp";
		}
		int complaintId = complaint.getComplaintId();
		int userId = complaint.getbUser().getUserId();
		service.updateComplaintType(complaintId, complaintType, userId);
		return "forward:jsp/manager/complain/complaintmanager.jsp";
	}
}
