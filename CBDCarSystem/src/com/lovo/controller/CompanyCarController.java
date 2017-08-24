package com.lovo.controller;

import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lovo.bean.Enterprise;
import com.lovo.bean.Park;
import com.lovo.service.CompanyCarService;
import com.lovo.service.EnterpriseService;
import com.lovo.util.PageBean;

@Controller
public class CompanyCarController {
	@Resource
	private CompanyCarService companyCarService;
	@Resource
	private EnterpriseService enterpriseService;
	/**查看当前登录企业所有车位并分页
	 * @param currentPage
	 * @param userId
	 */
	@RequestMapping(path="/findAllCompanyCar",method=RequestMethod.POST)
	public @ResponseBody Map<String, Object> findAllCompanyCar(int currentPage,int userId){
		List<Park> parks=companyCarService.findAllCompanyCar(currentPage,userId);
		int allCompanyCar=companyCarService.findAllCompanyCarNums();
		PageBean page=new PageBean();
		page.setAll(allCompanyCar);
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("parks", parks);
		map.put("totalPage", page.getTotalPage());
		return map;
	}
	/**查看当前登录企业已出租车位并分页
	 * @param currentPage
	 * @param userId
	 */
	@RequestMapping(path="/findAllCompanyCarIsRent",method=RequestMethod.POST)
	public @ResponseBody Map<String, Object> findAllCompanyCarIsRent(int currentPage,int userId){
		System.out.println("---------------1-----------");
		System.out.println(currentPage);
		System.out.println(userId);
		List<Park> parks=companyCarService.findAllCompanyCarIsRent(currentPage,userId);
		System.out.println(parks.size());
		System.out.println("---------------1-----------");
		int allCompanyCar=companyCarService.findAllCompanyCarNums();
		PageBean page=new PageBean();
		page.setAll(allCompanyCar);
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("parks", parks);
		map.put("totalPage", page.getTotalPage());
		return map;
	}
	/**查看当前登录企业未出租车位并分页
	 * @param currentPage
	 * @param userId
	 */
	@RequestMapping(path="/findAllCompanyCarIsNotRent",method=RequestMethod.POST)
	public @ResponseBody Map<String, Object> findAllCompanyCarIsNotRent(int currentPage,int userId){
		System.out.println("------------2------------------");
		List<Park> parks=companyCarService.findAllCompanyCarIsNotRent(currentPage,userId);
		int allCompanyCar=companyCarService.findAllCompanyCarNums();
		PageBean page=new PageBean();
		page.setAll(allCompanyCar);
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("parks", parks);
		map.put("totalPage", page.getTotalPage());
		return map;
	}
	/**修改企业密码 验证原密码是否正确
	 * @param 原密码 oldenterprisePwdupdate
	 * @param userId
	 */
	@RequestMapping(path="/oldenterprisePwdupdate",method=RequestMethod.POST)
	public void oldenterprisePwdupdate(String oldenterprisePwdupdate,String userId,PrintWriter pw){
		System.out.println(oldenterprisePwdupdate);
		Enterprise e=enterpriseService.checkoldenterprisePwd(Integer.parseInt(userId));
		String enterprisePwds = DigestUtils.md5Hex(oldenterprisePwdupdate);
		if(enterprisePwds.equals(e.getEnterprisePwd())){
			pw.print("0");
		}else{
			pw.print("1");
		}
		
	}
	@RequestMapping(path="/updateEnterPricelc",method=RequestMethod.POST)
	public String updateEnterPricelc(String enterpriseName,String enterprisePwd){
		try {
			enterpriseName = new String(enterpriseName.getBytes("ISO-8859-1"),"UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(enterpriseName);
		System.out.println(enterprisePwd);
		Enterprise enterprise=new Enterprise();
		String newPwd=DigestUtils.md5Hex(enterprisePwd);
		enterprise.setEnterpriseName(enterpriseName);
		enterprise.setEnterprisePwd(newPwd);
		enterpriseService.updateEnterpriselc(enterprise);
		return "redirect:jsp/enterprise/company1.jsp";
		
	}
}
