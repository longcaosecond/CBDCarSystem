package com.lovo.service;

import java.util.List;

import com.lovo.bean.Complaint;

public interface ComplaintService {
	
	/**
	 * 根据页面传递过来的信息添加投诉
	 * @param complaint 传递过来的封装好了的对象
	 */
	public void addComplaint(Complaint complaint);
	
	/**
	 * 查询出所有没有解决的投诉到界面显示
	 * @return 查询出来的所有内容
	 */
	public List<Complaint> findAllComplaint(int currentPage, int pageSize);
	
	/**
	 * 根据投诉的id查找到投诉的对象
	 * @param complaintId 传递过来的id值
	 * @return 查找出的对应的对象
	 */
	public Complaint findComplaintById(int complaintId);
	
	/**
	 * 获取总的信息条数
	 * @return 查出来的所有的信息条数
	 */
	public int getComplaintCount();
	
	/**
	 * 根据后台管理员的决定操作，对该投诉的状态和是否对被投诉者的信誉造成影响的操作
	 * @param complaintId 该条投诉对应的id
	 * @param complaintType 要修改到的投诉的状态的代表值
	 * @param userId 被投诉者的id
	 */
	public void updateComplaintType(int complaintId,int complaintType,int userId);
	
	/**
	 * 根据投诉人id和被投诉的成交记录，查找到投诉对象
	 * @param userId 投诉人的id
	 * @param dealId 成交记录的id
	 * @return 查询到的投诉的对象
	 */
	public Complaint findComplaintByTUserIdAndDealId(int userId,int dealId);
}
