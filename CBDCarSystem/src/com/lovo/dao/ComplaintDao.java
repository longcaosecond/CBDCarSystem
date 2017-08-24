package com.lovo.dao;

import java.util.List;

import com.lovo.bean.Complaint;

public interface ComplaintDao {
	
	/**
	 * 根据页面传递过来的信息添加投诉
	 * @param complaint 传递过来的封装好了的对象
	 */
	public void addComplaint(Complaint complaint);
	
	/**
	 * 根据投诉人id和被投诉的成交记录，查找到投诉对象
	 * @param userId 投诉人的id
	 * @param dealId 成交记录的id
	 * @return 查询到的投诉的对象
	 */
	public Complaint findComplaintByTUserIdAndDealId(int userId,int dealId);
	
	/**
	 * 查询出所有没有解决的投诉到界面显示
	 * @return 查询出来的所有内容
	 */
	public List<Complaint> findAllComplaint(int currentPage,int pageSize);
	
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
	 * 根据后台管理员对于该投诉的意见修改这个投诉信息的状态
	 * @param complaintId 要修改的投诉信息的id
	 * @param complaintType 要修改到的指定的状态的代表值
	 */
	public void updateComplaintType(int complaintId,int complaintType);

}
