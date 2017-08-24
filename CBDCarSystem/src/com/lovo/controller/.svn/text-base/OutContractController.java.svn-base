package com.lovo.controller;

import java.io.File;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileItem;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.lovo.bean.OutContract;
import com.lovo.bean.Park;
import com.lovo.service.OutContractService;
import com.lovo.service.ParkService;
import com.lovo.util.PageBean;

@Controller
public class OutContractController {

	@Resource
	private OutContractService service;
	
	@Resource
	private ParkService pService;
	
	@Resource
	private PageBean page;
	
	/**
	 * 查找多有的外部合约记录
	 * @param currentPage 当前页码
	 * @param outContractNewNo 模糊查询外部合约新合同编号
	 * @return 返回装有素有外部合约信息记录的Map
	 */
	@RequestMapping(path="/findAllOutContract")
	public @ResponseBody Map<String, Object> findAllOutContract(int currentPage,int type ,String outContractNewNo){
		
		try {
			outContractNewNo = new String(outContractNewNo.getBytes("ISO-8859-1"), "utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		Map<String, Object> map = new HashMap<String, Object>();
		
		int count = service.getTotalCount(outContractNewNo,type);
		page.setAll(count);
		page.setCurrentPage(currentPage);
		
		List<OutContract> list = service.findAllOutContract(outContractNewNo, type, page);
		
		map.put("currentPage", page.getCurrentPage());
		map.put("totalPage", page.getTotalPage());
		map.put("outContract", list);
		return map;
	}
	
	/**
	 * 外部合约解约
	 * @param outContractId 外部合约ID
	 * @param out 写出内容到网页面
	 */
	@RequestMapping(path="/termination")
	public void termination(String outContractNewNo,PrintWriter out){
		try {
			outContractNewNo = new String(outContractNewNo.getBytes("ISO-8859-1"), "utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		List<Park> list = pService.findParkByOutContractNewNo(outContractNewNo);
		boolean flag = true;
		for (Park park : list) {
			int type = park.getParkType();
			if (type == 1) {//表示有车位已租出去，不可以被解约
				flag = false;
				break;
			}
		}
		if (flag) {//可以解约
			service.updateOutContract(outContractNewNo);
			out.print(1);
		}else {//不可以解约
			out.print(0);
		}
	}
	
	@RequestMapping(value="/delete")
	public void delete(String outContractNewNo,PrintWriter out){
		try {
			outContractNewNo = new String(outContractNewNo.getBytes("ISO-8859-1"), "utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		service.deleteOutContract(outContractNewNo);
		out.print(1);
	}
	
	/**
	 * 添加外部合约
	 * @param file 上传的图片文件
	 * @param outContract 外部合约实例对象
	 * @param request http请求
	 * @return 返回网址链接
	 */
	@RequestMapping(path="/addOutContract",method=RequestMethod.POST)
	public String addOutContract(@RequestParam("copyImg") CommonsMultipartFile file,
			OutContract outContract,HttpServletRequest request){
		//获取文件名
		String fileName = file.getOriginalFilename();
		//将虚拟路径转换为物理路径
		String path = request.getSession().getServletContext().getRealPath("images");
		//如果该文件夹不存在，就创建一个文件夹
		File dir = new File(path);
		if (!dir.exists()) {
			dir.mkdir();
		}
		//文件写出的路径
		File pathFile = new File(path+File.separator+fileName);
		FileItem item = file.getFileItem();
		try {
			//写出文件
			item.write(pathFile);
		} catch (Exception e) {
			e.printStackTrace();
		}
		OutContract o1 = null;
		//将中文部分字段取出来，以便处理乱码
		String ContractAddress = outContract.getOutContractAddress();
		String contractCarNo = outContract.getOutContractCarNo();
		outContract.setOutContractCopyImg(fileName);
		//判断是否是续约
		if (ContractAddress == null || contractCarNo == null) {
			//这是查找旧的外部合约
			o1 = service.findOutContractByNewNo(outContract.getOutContractOldNo());
			outContract.setOutContractAddress(o1.getOutContractAddress());
			outContract.setOutContractCarNo(o1.getOutContractCarNo());
			service.saveOutContract(outContract,o1.getOutContractId());
		}else {
			service.saveOutContract(outContract,0);
		}
		return "redirect:jsp/manager/contract/outcontractmanager.jsp";
	}
	
	/**
	 * 查找外部合约对象根据新合同编号
	 * @param outContractNewNo 新合同编号
	 * @param out 写出0：表示新编号不存在，1：表示新编号已经存在
	 */
	@RequestMapping(value="/checkNewNo")
	public void checkNewNo(String outContractNewNo,PrintWriter out){
		//处理乱码
		try {
			outContractNewNo = new String(outContractNewNo.getBytes("ISO-8859-1"),"utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		OutContract outContract = service.findOutContractByNewNo(outContractNewNo);
		if (outContract == null) {
			out.print(0);
		}else {
			out.print(1);
		}
	}
/**查询所有外部合约
	 *
	 */
	@RequestMapping(path="/selectOutContract",method=RequestMethod.POST)
	public @ResponseBody List<OutContract> selectOutContract() {
			List<OutContract> list=service.selectOutContractByEnterpriseId();
					return	list;
	}
	
}
