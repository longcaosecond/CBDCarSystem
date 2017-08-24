package com.lovo.bean;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;
//成交订单
@Entity
@Table(name="t_deal",catalog="cbdcarsystem")
public class Deal implements Serializable{
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="deal_id")
	private int dealId;//
	@OneToOne
	@JoinColumn(name="rent_id")
	private Rent rent;//招租
	@JsonIgnore
	@ManyToOne
	@JoinColumn(name="user_id")
	private User user;//抢租客
	@Column(name="start_date")          
	private Date dealStartDate;//开始租车位时间
	@Column(name="end_date")            
	private Date dealEndDate;//结束租车位时间
	@Column(name="deal_price")          
	private BigDecimal dealPrice;//应付总价格
	@Column(name="deal_type")  
	private int dealType;//合约的执行状态，1代表执行中 0 代表合约已结束
	@JsonIgnore
	@OneToMany
	@JoinColumn(name="deal")
	private Set<Complaint> complaints = new HashSet<Complaint>();//抢租客投诉
	public int getDealId() {
		return dealId;
	}
	
	public Set<Complaint> getComplaints() {
		return complaints;
	}

	public void setComplaints(Set<Complaint> complaints) {
		this.complaints = complaints;
	}

	public void setDealId(int dealId) {
		this.dealId = dealId;
	}
	public Rent getRent() {
		return rent;
	}
	public void setRent(Rent rent) {
		this.rent = rent;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Date getDealStartDate() {
		return dealStartDate;
	}
	public void setDealStartDate(Date dealStartDate) {
		this.dealStartDate = dealStartDate;
	}
	public Date getDealEndDate() {
		return dealEndDate;
	}
	public void setDealEndDate(Date dealEndDate) {
		this.dealEndDate = dealEndDate;
	}
	public BigDecimal getDealPrice() {
		return dealPrice;
	}
	public void setDealPrice(BigDecimal dealPrice) {
		this.dealPrice = dealPrice;
	}
	public int getDealType() {
		return dealType;
	}

	public void setDealType(int dealType) {
		this.dealType = dealType;
	}
}
