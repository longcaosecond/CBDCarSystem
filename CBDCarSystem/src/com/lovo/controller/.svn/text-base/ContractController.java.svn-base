package com.lovo.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lovo.bean.Contract;
import com.lovo.service.ContractService;

@Controller
public class ContractController {

	@Resource
	private ContractService service;
	
	@RequestMapping(value="/selectContract")
	public @ResponseBody List<Contract> findAllContract(){
		return service.findAllContractDao();
	}
	
	@RequestMapping(value="/commit",method=RequestMethod.POST)
	public void commit(@RequestBody List<String> list,PrintWriter out) {
		service.commit(list);
		out.print(0);
	}
}
