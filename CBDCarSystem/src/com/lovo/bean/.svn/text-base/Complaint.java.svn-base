package com.lovo.bean;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
//投诉
@Entity
@Table(name="t_complaint",catalog="cbdcarsystem")
public class Complaint implements Serializable {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="complaint_id")
	private int complaintId;
	@ManyToOne
	@JoinColumn(name="user_id")
	   private User tUser;//投诉人
	@ManyToOne
	@JoinColumn(name="t_u_user_id")
	   private User bUser;//被投诉人
	@ManyToOne
	@JoinColumn(name="deal_id")
	   private Deal deal;//投诉哪条成交记录
	@Column(name="complaint_date")
	   private Date complaintDate;//投诉日期
	 @Column(name="complaint_content")   
	   private String complaintContent;//投诉内容
	 @Column(name="complaint_type")       
	   private int complaintType;//处理状态 
	public int getComplaintId() {
		return complaintId;
	}
	public void setComplaintId(int complaintId) {
		this.complaintId = complaintId;
	}
	public User gettUser() {
		return tUser;
	}
	public void settUser(User tUser) {
		this.tUser = tUser;
	}
	public User getbUser() {
		return bUser;
	}
	public void setbUser(User bUser) {
		this.bUser = bUser;
	}
	public Deal getDeal() {
		return deal;
	}
	public void setDeal(Deal deal) {
		this.deal = deal;
	}
	public Date getComplaintDate() {
		return complaintDate;
	}
	public void setComplaintDate(Date complaintDate) {
		this.complaintDate = complaintDate;
	}
	public String getComplaintContent() {
		return complaintContent;
	}
	public void setComplaintContent(String complaintContent) {
		this.complaintContent = complaintContent;
	}
	public int getComplaintType() {
		return complaintType;
	}
	public void setComplaintType(int complaintType) {
		this.complaintType = complaintType;
	}
	 
}
