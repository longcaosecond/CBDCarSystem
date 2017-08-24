package com.lovo.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lovo.bean.Rent;
import com.lovo.bean.User;
import com.lovo.service.LandLordService;
import com.lovo.util.PageBean;

@Controller
public class LandLordController {
	@Resource
	private LandLordService landLordService;
	/**查看所有处于申请状态（即合约状态码为0的所有车位）的车位，
	 * 并分页显示出车位和包租婆的组合信息
	 * @param currentPage
	 */
	@RequestMapping(path="/findAllLandLordApply",method=RequestMethod.POST)
	public @ResponseBody Map<String, Object> findAllLandLordApply(String currentPage){
		List<Rent> rents=landLordService.findAllLandLordApply(Integer.parseInt(currentPage));
		List<User> users=new ArrayList<User>();
		for(Rent r:rents){
			users.add(r.getUser());
		}
		int all=landLordService.findAllLandLordApplyNums();
		PageBean page=new PageBean();
		page.setAll(all);
		Map<String, Object> map=new HashMap<String,Object>();
		map.put("users", users);
		map.put("rents", rents);
		map.put("totalPage", page.getTotalPage());
		return map;
	}
	/**通过所申请的车位，修改状态码为1，待出租状态
	 * @param rentId
	 */
	@RequestMapping(path="/passApply",method=RequestMethod.POST)
	public void passApply(String rentId,PrintWriter pw){
		int n=landLordService.passApply(Integer.parseInt(rentId));
		pw.print(n);
	}
	/**拒绝所申请的车位，修改状态码为3，审核失败状态
	 * @param rentId
	 */
	@RequestMapping(path="/refuseApply",method=RequestMethod.POST)
	public void refuseApply(String rentId,PrintWriter pw){
		int n=landLordService.refuseApply(Integer.parseInt(rentId));
		pw.print(n);
	}
}
