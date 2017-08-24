package com.lovo.controller;

import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
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
import com.lovo.service.EnterpriseService;
import com.lovo.service.ManagerService;
import com.lovo.util.PageBean;

@Controller
public class EnterPriceController {
	@Resource
	private EnterpriseService enterpriseService;
	/**查看所有企业并分页显示
	 * @param currentPage
	 * @param enterPriceName
	 * @param enterPriceFloar
	 * @param enterPriceContact
	 * @param enterPricePhone	
	 */
	@RequestMapping(path="/findAllEnterPrice",method=RequestMethod.POST)
	public @ResponseBody Map<String, Object> showAllEnterPrice(String currentPage,String enterPriceName,String enterPriceFloar,String enterPriceContact,String enterPricePhone){
		List<Enterprise> enterprises=enterpriseService.showAllEnterprise(Integer.parseInt(currentPage), enterPriceName, enterPriceFloar, enterPriceContact, enterPricePhone);
		PageBean page=new PageBean();
		page.setAll(enterpriseService.findAllEnterPriceNums());
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("enterprises", enterprises);
		map.put("totalPage", page.getTotalPage());
		return map;
	}
	/**删除企业，如果有合约在返回1 没有合约则删除返回0
	 * @param id
	 */
	@RequestMapping(path="/delOneEnterPricePage",method=RequestMethod.POST)
	public void delOneEnterPricePage(Integer id,PrintWriter pw){
		Enterprise e=enterpriseService.findEnterPriceById(id);
		System.out.println(e);
		if(e.getContract()!=null){
			pw.print("1");
		}else{
			enterpriseService.deleteEnterpriseById(id);
			pw.print("0");
		}
	}
	/**检查新添加企业账号是否存在
	 * @param enterpriseAccount
	 */
	@RequestMapping(path="/checkenterpriseAccount",method=RequestMethod.POST)
	public void checkenterpriseAccount(String enterpriseAccount,PrintWriter pw){
		int n=enterpriseService.checkenterpriseAccount(enterpriseAccount);
		pw.print(n);
	}
	/**页面验证通过后，添加一个企业，默认初始合约状态为0 即无合约
	 * 解决添加数据库乱码，并使用加密密码
	 * @param enterprise
	 */
	@RequestMapping(path="/addEnterPrice",method=RequestMethod.POST)
	public String addEnterPrice(Enterprise e){
		e.setEnterpriseType(0);
		
		String name=e.getEnterpriseName();
		String contact=e.getEnterpriseContact();
		try {
			e.setEnterpriseAddress(new String(e.getEnterpriseAddress().getBytes("iso-8859-1"),"utf-8"));
			byte b[]=name.getBytes("ISO-8859-1");
			byte c[]=contact.getBytes("ISO-8859-1");
			String names=new String(b,"UTF-8");
			String contacts=new String(c,"utf-8");
			e.setEnterpriseContact(contacts);
			e.setEnterpriseName(names);
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		String pwd=e.getEnterprisePwd();
		String enterprisePwds = DigestUtils.md5Hex(pwd);
		e.setEnterprisePwd(enterprisePwds);
		enterpriseService.addEnterPrice(e);
		return "redirect:jsp/manager/admin/enterpricemanager.jsp";
	}
	
}
