package com.lovo.controller;

import java.io.File;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.lovo.bean.Complaint;
import com.lovo.bean.Contract;
import com.lovo.bean.Enterprise;
import com.lovo.bean.Manager;
import com.lovo.bean.Park;
import com.lovo.bean.User;
import com.lovo.service.ManagerService;
import com.lovo.util.PageBean;

@Controller
public class ManagerController {
	
	@Resource
	private ManagerService service;
	@Resource
	private PageBean page;
	
	//获取所有的管理员信息
	@RequestMapping(path="/findAllManager.do",method=RequestMethod.POST)
	public @ResponseBody Map<String,Object> getAllUsers(int currentPage,String managerName){
		
//		try {
//			managerName= new String(managerName.getBytes("ISO-8859-1"), "UTF-8");
//		} catch (UnsupportedEncodingException e) {
//			e.printStackTrace();
//		}
		Map<String,Object> map = new HashMap<String,Object>();
		int count = service.getManagerTotalCount(managerName);
		page.setCurrentPage(currentPage);
		page.setAll(count);
		
		List<Manager> list = service.findAllManager(page,managerName);
		
		map.put("currentPage", page.getCurrentPage());
		map.put("totalPage", page.getTotalPage());
		map.put("manager", list);
		return map;
	}
	/**
	 * 普通管理员登录
	 * @param name 管理员登录名
	 * @param pwd 管理员登录密码
	 * @param session 管理员登录后，管理员信息保存到session中
	 * @return
	 */
	@RequestMapping(path="/managerLogin",method=RequestMethod.POST)
	public String managerLogin(String name,String pwd,HttpSession session,PrintWriter out)
	{ 	pwd = DigestUtils.md5Hex(pwd);
		Manager manager=service.loginManager(name, pwd);		
		if(manager!=null)
		{
			session.setAttribute("manager", manager);
			session.setMaxInactiveInterval(30*60);
			return "redirect:jsp/manager/can/personalmanager.jsp";
		}
		else
		{//输入错误还需要跳转页面	
			session.setAttribute("errorMsg", "用户名或密码输入错误");
			return "redirect:login/manager/LoginTest.jsp";
		}
	}
	
	/**
	 * 个人信息管理：修改普通管理员的密码和电话号码
	 * @param pwd 修改的密码
	 * @param phone 电话号码
	 * @param session session中保存了登录用户信息
	 * @return
	 */
	@RequestMapping(path="/updateManager",method=RequestMethod.POST)
	public void updateManager(String newPwd, String phone,HttpSession session,PrintWriter out)
	{
		Manager sessionManager=(Manager) session.getAttribute("manager");
		if(sessionManager!=null)
		{sessionManager.setManagerPhone(phone);
		 newPwd = DigestUtils.md5Hex(newPwd);
		sessionManager.setManagerPwd(newPwd);
		service.updateManager(sessionManager);
		session.setAttribute("manager",sessionManager);
		out.write("ok");
		}
		else{
			out.write("notLogin");
		}
	}
	
	
	/**
	 * 添加租户合约时，获取所有的企业用户名称
	 * @return 返回企业用户对象集合
	 */
	@RequestMapping(path="/showAllEnterpriseName",method=RequestMethod.POST)
	public @ResponseBody List<Enterprise> showAllEnterpriseName()
	{	
		
		List<Enterprise> enterprise=service.findAllEnterpriseName();
		System.out.println("showAllEnterpriseName:"+enterprise);
		return enterprise;
	}
	
	/**
	 * 添加租户合约
	 * @param enterpriseName 企业名称
	 * @param contractId 合约Id
	 * @param contractStartDate 合约开始时间
	 * @param contractEndDate 合约结束时间
	 * @return 
	 */
	@RequestMapping(path="/addrenters",method=RequestMethod.POST)
	public String addrenters(String enterpriseName,String contractId,String contractStartDate,String contractEndDate,String parkAddress,String parkNumber )

	{
		try {
			if(enterpriseName!="")
			{
				enterpriseName=new String(enterpriseName.getBytes("ISO-8859-1"),"utf-8");
			}
			
		} catch (UnsupportedEncodingException e1) {
			
			e1.printStackTrace();
		}
		
		Enterprise enterprise=service.findEnterpriseByName(enterpriseName);
		
		Contract contract=new Contract();				
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");//小写的mm表示的是分钟  
		
		try 
		{
			Date startDate=sdf.parse(contractStartDate);
			Date endDate=sdf.parse(contractEndDate);

			enterprise.setEnterpriseName(enterpriseName);
			enterprise.setEnterpriseType(1);//签订合约后，EnterpriseType设置为1，表示有合约
			contract.setEnterprise(enterprise);
			
			contract.setContractName(contractId);
			contract.setContractStartDate(startDate);
			contract.setContractEndDate(endDate);
			contract.setContractType(1);//合同的状态 0:解除合约 1:合约状态
			service.addContract(contract);
			
		} catch (ParseException e) 
		{			
			e.printStackTrace();
		}  
		return "jsp/manager/contract/rentersmanager";
	}
		
	/**
	 * 显示所有的合约租户
	 * @param currentPage 当前页
	 * @param type 查看合约数据类型 1
	 * @param contractId 模糊查询合约编号
	 * @return 
	 */
	@RequestMapping(path="/showAllRenters",method=RequestMethod.POST)
	public @ResponseBody Map<String,Object> showAllRenters(String currentPage,String type,String contractName)
	{	
		System.out.println("currentPage:"+currentPage+"type:"+type+"contractName:"+contractName);
				
		Map<String,Object> map=new HashMap<String,Object>();
		
		int count=service.showTotalCount(Integer.parseInt(type), contractName);		
		
		page.setAll(count);
		page.setPageSize(5);
		page.setCurrentPage(Integer.parseInt(currentPage));
		
		List<Contract> contracts=service.showAllContract(contractName,Integer.parseInt(type),page);						
		
		map.put("currentPage", page.getCurrentPage());
		map.put("totalPage", page.getTotalPage());
		map.put("contracts", contracts);				
		return map;
	}
	/**
	 * 续约合约
	 */	
	@RequestMapping(path="/renewContract",method=RequestMethod.POST)
	public String renewContract(HttpServletRequest req,String oldcontractId,String newContractId,String enterpriseContact,String enterprisePhone,String contractNewStartDate,String contractNewEndDate,@RequestParam CommonsMultipartFile contractPicture)
	{	
		//文件上传
		String picFileName=System.currentTimeMillis()+contractPicture.getOriginalFilename();
		String picPath=req.getServletContext().getRealPath("images");
		File f=new File(picPath);
		if(!(f.exists()))
		{
			f.mkdir();
		}		
		try {
			contractPicture.getFileItem().write(new File(picPath+File.separator+picFileName));
		} catch (Exception e1) {
			e1.printStackTrace();
		}

		Contract contract=new Contract();
		Enterprise enterprise=new Enterprise();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");				 
		try 
		{			
					
			enterprise.setEnterpriseContact(enterpriseContact);
			enterprise.setEnterprisePhone(enterprisePhone);
			
			Date startDate = sdf.parse(contractNewStartDate);
			Date endDate=sdf.parse(contractNewEndDate);
			
			contract.setContractName(newContractId);
			contract.setContractStartDate(startDate);
			contract.setContractEndDate(endDate);
			contract.setEnterprise(enterprise);
			contract.setContractPicture(picFileName);
			
			service.updateContractById(oldcontractId, contract);
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}		
		return "jsp/manager/contract/rentersmanager";
	}
	/**
	 * 租户解约
	 * @param req
	 * @return
	 */
	@RequestMapping(path="/breakContract",method=RequestMethod.GET)
	public String breakContract(HttpServletRequest req)
	{
		String contractId=req.getParameter("contractId");
		service.updateContractTypeById(Integer.parseInt(contractId), 0);
		return "redirect:jsp/manager/contract/rentersmanager.jsp";
	}

	/**
	 * 添加管理员
	 * @param manager 管理员
	 * @param out 往页面写出信息
	 */
	@RequestMapping(value="/addManager",method=RequestMethod.POST)
	public void saveManager(@RequestBody Manager manager,PrintWriter out) {
		String managerPwd = DigestUtils.md5Hex(manager.getManagerPwd());
		manager.setManagerPwd(managerPwd);
		service.addManager(manager);
		out.print("ok");
	}
	
	/**
	 * 修改管理员权限
	 * @param list 装有权限ID的集合
	 * @param out 往页面写出信息
	 */
	@RequestMapping(value="/updateManagerPowers",method=RequestMethod.POST)
	public void updateManagerPowers(@RequestBody List<String> list,PrintWriter out) {
		service.upadateManagerPowers(list);
		out.print("ok");
	}
/**
	 * 从session获取当前登录的管理员信息
	 * @return manager
	 */
	@RequestMapping(path="/findCurrentManager",method=RequestMethod.POST)
	public @ResponseBody Manager findCurrentManager(HttpSession session){
		Manager sessionManager=(Manager) session.getAttribute("manager");
			return sessionManager;
	}
/**从session中验证管理员密码是否正确
	 * @param password 用户密码
	 * @param out
	 * @param session
	 */
	@RequestMapping(path="/checkManagerPwd",method=RequestMethod.POST)
	public void checkManagerPwd(String password,PrintWriter out,HttpSession session){
		Manager manager=(Manager) session.getAttribute("manager");
		if(manager!=null){
			password = DigestUtils.md5Hex(password);
			if(manager.getManagerPwd().equals(password)){
				out.write("ok");//通过
			}else{
				out.write("false");//密码不对
			}
		}
		else{
			out.write("notLogin");//未登录或者掉线
		}
	}
/**检测账号是否重复
	 * @param managerAccount 账号
	 * @param out
	 */
	@RequestMapping(path="/checkManagerAccount",method=RequestMethod.POST)
	public void checkManagerAccount(String managerAccount,PrintWriter out){
		long count=service.findManagerAccount(managerAccount);
		out.write(String.valueOf(count));
	}
	/*根据Id删除管理员
	 * @param managerId 管理员Id
	 * @param out 
	 */
	@RequestMapping(path="/deleteManager",method=RequestMethod.POST)
	public void deleteManager(int managerId,PrintWriter out){
		service.deleteManagerByManagerId(managerId);
		out.write("ok");
	}
	// 管理员注销
			@RequestMapping(path = "/managerExit", method = RequestMethod.GET)
			public String managerExit(HttpSession session) {
				// 消除session
				session.removeAttribute("manager");
				//session.invalidate();
				return "redirect:login/manager/LoginTest.jsp";// 跳转至主界面
			} 
		
}
