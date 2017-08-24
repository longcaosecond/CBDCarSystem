package com.lovo.controller;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lovo.bean.Deal;
import com.lovo.bean.Rent;
import com.lovo.bean.User;
import com.lovo.bean.Want;
import com.lovo.service.DealService;
import com.lovo.service.WantService;

@Controller
public class WantController {
	@Resource(name="wantServiceImpl")
	private WantService wser;
	@Resource(name="dealServiceImpl")
	private DealService service;
	
	/**添加留言want
	 * @param rentId
	 * @param userId
	 * @param liuyan
	 */
	@RequestMapping(path="/addWant",method=RequestMethod.POST)
	public void addWant(int rentId, String liuyan,HttpSession session,PrintWriter out) {
		User user=(User)session.getAttribute("user");
		if(user!=null)
		wser.addWant(rentId, user.getUserId(), liuyan);
		out.write("ok");
	}
	
	/**查询当前用户所有留言
	 * @param rentId
	 * @param out
	 * @param session
	 */
	@RequestMapping(path="/selectWantsByUserId",method=RequestMethod.POST)
	public void selectWantsByUserId(String rentId,PrintWriter out,HttpSession session,HttpServletResponse response) {
		String b="true";
		if(rentId!=null&&!"".equals(rentId)){
		User user =(User)session.getAttribute("user");
		if(user!=null){
		List<Want> wants=wser.selectWantsByUserId(user.getUserId());
		for(Want want:wants){
			if(want.getRent().getRentId()==Integer.parseInt(rentId))
			{b="false";
			break;}
		}
		out.write(b);}
		else{
				out.write(b);
		}
		}else{
			out.write(b);
		}
	
	}
	
	/**
	 * 查询出所有的留言信息，反馈给用户 针对的是包租婆
	 * @param request 获取传递过来的参数
	 * @param session 获取session中的用户对象
	 * @return 返回查询到的所有的 对该用户的留言信息 
	 */
	
	@RequestMapping(path="getWantInfo.do",method=RequestMethod.GET)
	public @ResponseBody List<Want> getWantInfo(HttpServletRequest request,HttpSession session,HttpServletResponse response){
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
		String curent = request.getParameter("currentPage");
		int currentPage = Integer.parseInt(curent);
		int pageSize = 7;
		List<Want> list = wser.findWantInfo(userId,1,currentPage, pageSize);
		return list;
		
	}
	
	/**
	 * 查询出所有的留言信息，反馈给用户 针对的是招租客
	 * @param request 获取传递过来的参数
	 * @param session 获取session中的用户对象
	 * @return 返回查询到的所有的 对该用户的留言信息 
	 */
	
	@RequestMapping(path="getWantInfoByZ.do",method=RequestMethod.GET)
	public @ResponseBody List<Want> getWantInfoByZ(HttpServletRequest request,HttpSession session,HttpServletResponse response){
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
		String curent = request.getParameter("currentPage");
		int currentPage = Integer.parseInt(curent);
		int pageSize = 7;
		List<Want> list = wser.findWantInfoByZ(userId, currentPage, pageSize);
		return list;
		
	}
	
	/**
	 * 根据用户想要查看的对象，查看具体的信息
	 * @param request 获取传递过来的用户的id
	 * @param session 用户获取session中的用户对象
	 * @return 跳转到指定页面
	 */
	@RequestMapping(path="showWantInfo.do",method=RequestMethod.GET)
	public String showWantInfo(HttpServletRequest request,HttpSession session){
		String id = request.getParameter("wantId");
		int wantId = Integer.parseInt(id);
		Want want = wser.findWantByWantId(wantId);
		session.setAttribute("want", want);
		if(want.getWantType()==1){
			return "forward:jsp/user/informationEvent.jsp";
		}else{
			return "forward:jsp/user/informationRightEvent.jsp";
		}	
		
	}
	
	/**
	 * 根据包租婆的选择 对want对象的状态做出相应的修改
	 * @param session 用于获取session中保存的want对象
	 * @param request 用于获取页面传递过来的参数
	 * @return 跳转到指定的页面
	 */
	@RequestMapping(path="changeWantTypeByB.do",method=RequestMethod.GET)
	public String changeWantTypeByB(HttpSession session,HttpServletRequest request,HttpServletResponse response){
		Want want = (Want) session.getAttribute("want");
		if(want==null){
			try {
				response.sendRedirect("login/user/login.jsp");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		Rent rent = want.getRent();
		int rentId = rent.getRentId();
		int type = want.getWantType();
		int wantId = want.getWantId();
		String id = request.getParameter("wantType");
		int wantType = Integer.parseInt(id);
		if(wantType==3){
			Deal deal = service.findDealByRentIdAndDealType(rentId);
			if(deal!=null){
				request.setAttribute("yizuchu", "该车位您以租出");
				return "forward:jsp/user/informationEvent.jsp";
			}
			
		}
		wser.updateWantTypeByWantId(wantId, wantType);
		if(type==1){
			return "forward:jsp/user/information.jsp";
		}else{
			return "forward:jsp/user/informationRight.jsp";
		}
		
		
	}
	
	/**
	 * 根据相应的条件 显示返回给页面总的页数 针对包租婆
	 * @param write 用于给页面回馈页数信息
	 * @param session 用于获取session中的用户对象
	 */
	@RequestMapping(path="getWantCountByB.do",method=RequestMethod.GET)
	public void getWantCountByB(PrintWriter write,HttpSession session,HttpServletResponse response){
		
		int numb =0;
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
	   int wantType = 1;
	   int count = wser.findWantCountByWantTypeAndId(userId, wantType);
	   if(count%7==0){
		   numb = count/7;
	   }else{
		   numb = count/7+1;
	   }
		write.print(String.valueOf(numb));
	}
	
	@RequestMapping(path="getWantCountByZ.do",method=RequestMethod.GET)
public void getWantCountByZ(PrintWriter write,HttpSession session,HttpServletResponse response){
		
		int numb =0;
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
	   int wantType = 3;
	   int count = wser.findWantCountByWantTypeAndUserId(userId, wantType);
	   if(count%7==0){
		   numb = count/7;
	   }else{
		   numb = count/7+1;
	   }
		write.print(String.valueOf(numb));
	}
	}
