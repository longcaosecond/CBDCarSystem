package com.lovo.controller;

import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lovo.bean.Park;
import com.lovo.service.ParkService;
import com.lovo.util.PageBean;

@Controller
public class ParkController {
	
	@Resource(name="parkService")
	private ParkService pser;
	
	@Resource
	private PageBean page;
	
	/**添加单个车位信息
	 * @param parkContractId 合同Id
	 * @param parkNumber 车位号
	 * @param parkAddress 车位地址
	 * @param session 
	 */
	@RequestMapping(path="/addPark",method=RequestMethod.POST)
	public void addPark(int outContractId,String parkNumber,String parkAddress,PrintWriter out) {
		long b=checkPark(outContractId, parkNumber, parkAddress);//重复验证
		if(b==0){
			pser.addPark( outContractId, parkNumber, parkAddress);
		out.write("ok");
		}
		else
			{
				out.write(parkNumber);
			}
	}
	
	/**
	 * @param parkId 车位id
	 * @param outContractId 外部合同Id
	 * @param parkNumber 车位号
	 * @param parkAddress 车位地址
	 * @param out 输出流
	 */
	@RequestMapping(path="/updatePark",method=RequestMethod.POST)
	public void updatePark(int parkId,int parkType,int outContractId,String parkNumber,String parkAddress,PrintWriter out) {
		long b=checkPark(parkId,outContractId,parkNumber, parkAddress);//重复验证
		if(b==0){
			pser.updatePark(parkId,parkType,outContractId, parkNumber, parkAddress);
		out.write("ok");
		}
		else
			out.write(parkNumber);
	}
	
	/**添加多个车位信息
	 * @param parkContractId 合同Id
	 * @param parkNumber 车位号
	 * @param parkAddress 车位地址
	 * @param session 
	 */
	@RequestMapping(path="/addParks",method=RequestMethod.POST)
	public void addParks(int outContractIds,String parkNumbers, int startnum,int endnum,String parkAddresss,PrintWriter out) {
		//去除重复
		List<String> parkNumberList=new ArrayList<String>();
		for(int i=startnum;i<=endnum;i++){
			parkNumberList.add(parkNumbers+i);
		}
		List<String> chongfu=checkPark(outContractIds, parkNumberList, parkAddresss);//重复验证
			parkNumberList.removeAll(chongfu);//去除重复
			pser.addPark(outContractIds, parkNumberList, parkAddresss);
			out.print(chongfu);
	}
	
	/**校验车位是否重复
	 * @param parkContractId 合同Id
	 * @param parkNumber 车位号
	 * @param parkAddress 车位地址
	 * @return long 重复条数
	 */
	public long checkPark(int outContractId,String parkNumber,String parkAddress){
		return pser.selectPark(outContractId, parkNumber, parkAddress);
	}
	/**除去自身校验车位是否重复
	 * @param parkId 合同Id
	 * @param parkContractId 合同Id
	 * @param parkNumber 车位号
	 * @param parkAddress 车位地址
	 * @return long 重复条数
	 */
	public long checkPark(int parkId,int outContractId,String parkNumber,String parkAddress){
		return pser.selectPark(parkId,outContractId, parkNumber, parkAddress);
	}
	
	/**批量校验车位是否重复，返回重复的集合
	 * @param parkContractId 合同Id
	 * @param parkNumber 车位号集合
	 * @param parkAddress 车位地址
	 * @return List<String>
	 */
	public List<String> checkPark(int outContractId,List<String> parkNumbers,String parkAddress){
		return pser.selectPark(outContractId, parkNumbers, parkAddress);
	}
	
	@RequestMapping(path="/findPark",method=RequestMethod.POST)
	public @ResponseBody List<Object> findPark(String msg,int currentPage){
		PageBean page=new PageBean();
		page.setCurrentPage(currentPage);
		List <Park> parks=pser.findPark(msg, page);	
		int count=pser.findParkCount(msg);
		page.setAll(count);
		page.getTotalPage();
		List<Object> objs=new ArrayList<Object>();
		objs.add(parks);
		objs.add(page);
		return objs;
	}
	@RequestMapping(path="/findParkBycontractId",method=RequestMethod.POST)
	public @ResponseBody List<Park> findParkBycontractId( int contractId){
		return	pser.findParkBycontractId(contractId);
	}
	
	/**
	 * 获取所有未租车位信息
	 * @param currentPage 当前页码
	 * @param msg 模糊查询字段
	 * @return 返回装有车位信息的集合
	 */
	@RequestMapping(value="/getPark")
	public @ResponseBody Map<String, Object> findParkByType(int currentPage,String msg){
		try {
			msg = new String(msg.getBytes("ISO-8859-1"),"UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		Map<String, Object> map = new HashMap<String, Object>();
		int count = pser.findTotalCountByType(msg);
		page.setAll(count);
		page.setCurrentPage(currentPage);
		List<Park> list = pser.findParkByType(page,msg);
		map.put("park", list);
		map.put("currentPage", page.getCurrentPage());
		map.put("totalPage", page.getTotalPage());
		return map;
	}
	
}
