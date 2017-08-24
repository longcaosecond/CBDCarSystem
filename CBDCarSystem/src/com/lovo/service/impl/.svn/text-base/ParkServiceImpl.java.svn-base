package com.lovo.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.lovo.bean.OutContract;
import com.lovo.bean.Park;
import com.lovo.dao.ParkDao;
import com.lovo.service.ParkService;
import com.lovo.util.PageBean;

@Service("parkService")
public class ParkServiceImpl implements ParkService {
	@Resource(name="parkDao")
	private ParkDao pdao;
	@Override
	public void addPark(int companyId, int parkContractId, String parkNumber, String parkAddress) {
		// TODO Auto-generated method stub
		pdao.addPark(companyId, parkContractId, parkNumber, parkAddress);
	}
	@Override
	public long selectPark(int outContractId,String parkNumber, String parkAddress) {
		// TODO Auto-generated method stub
		long count=pdao.selectPark(outContractId, parkNumber, parkAddress);
		
		return count;
	}
	@Override
	public void addPark(int companyId, int parkContractId, List<String> parkNumbers, String parkAddress) {
		// TODO Auto-generated method stub
		pdao.addPark(companyId, parkContractId, parkNumbers, parkAddress);
	}
	@Override
	public List<String> selectPark(int parkContractId, List<String> parkNumbers, String parkAddress) {
		// TODO Auto-generated method stub
		return pdao.selectPark(parkContractId, parkNumbers, parkAddress);
	}
	@Override
	public List<Park> findParkByOutContractNewNo(String outContractNewNo) {
		return pdao.findParkByOutContractNewNo(outContractNewNo);
	}
	@Override
	public void updateParkOutContractId(int oldOutContractId, OutContract newOutContract) {
		pdao.updateParkOutContractId(oldOutContractId, newOutContract);
	}
	@Override
	public List<Park> findParkByType(PageBean page,String msg) {
		return pdao.findParkByType(page,msg);
	}
	@Override
	public int findTotalCountByType(String msg) {
		return pdao.findTotalCountByType(msg);
	}
	/**********/
	@Override
	public List<Park> findPark(String msg, PageBean page) {
		// TODO Auto-generated method stub
		return pdao.findPark(msg, page);
	}
	@Override
	public int findParkCount(String msg) {
		// TODO Auto-generated method stub
		return pdao.findParkCount(msg);
	}
	@Override
	public void updatePark(int parkId,int parkType,int outContractId, String parkNumber, String parkAddress) {
		// TODO Auto-generated method stub
		pdao.updatePark(parkId,parkType,outContractId, parkNumber, parkAddress);
	}
	@Override
	public long selectPark(int parkId, int outContractId, String parkNumber, String parkAddress) {
		// TODO Auto-generated method stub
		return pdao.selectPark(parkId, outContractId, parkNumber, parkAddress);
	}
	@Override
	public List<Park> findParkBycontractId(int contractId) {
		// TODO Auto-generated method stub
		return pdao.findParkBycontractId(contractId);
	}
	/***/
	@Override
	public void addPark(int outContractId, String parkNumber, String parkAddress) {
		// TODO Auto-generated method stub
		pdao.addPark( outContractId, parkNumber, parkAddress);
	}
	@Override
	public void addPark(int outContractId, List<String> parkNumbers, String parkAddress) {
		// TODO Auto-generated method stub
		pdao.addPark( outContractId, parkNumbers, parkAddress);
	}
}
