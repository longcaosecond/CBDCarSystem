package com.lovo.bean;

import java.io.Serializable;
import java.util.Date;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name="t_user",catalog="cbdcarsystem")
public class User implements Serializable
{
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="user_id")
	private Integer userId;
	@Column(name="user_name")
	private String userName;
	@Column(name="user_pwd")
	private String userPwd;
	@Column(name="user_account")
	   private String userAccount;//账号
	@Column(name="user_address")
	   private String userAddress;
	@Column(name="user_cardId")
	   private String userCardId;//身份证
	@Column(name="user_phone")
	   private String userPhone;
	@Column(name="user_work")
	   private String userWork;
	@Column(name="user_email") 
	   private String userEmail;
	@Column(name="user_type")
	   private int userType;//类型，0：包租婆，1：出租客
	@Column(name="user_credit")
	   private int userCredit;//信用100满分
	@Column(name="user_date")
	   private Date userDate;//注册日期
	/*@OneToMany(mappedBy="user")
	private Set<Rent> rents;
	@OneToMany(mappedBy="user")
	private Set<Deal> deals;
	@OneToMany(mappedBy="user")
	private Set<Want> Wants;
	@OneToMany(mappedBy="tUser")
	private Set<Complaint> tComplaints;//作为投诉人发起的投诉
	@OneToMany(mappedBy="bUser")
	private Set<Complaint> bComplaints;//作为被投诉人得到的投诉
*/	
	
	public String getUserAccount() {
		return userAccount;
	}
	public void setUserAccount(String userAccount) {
		this.userAccount = userAccount;
	}
	public String getUserAddress() {
		return userAddress;
	}
	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}
	public String getUserCardId() {
		return userCardId;
	}
	public void setUserCardId(String userCardId) {
		this.userCardId = userCardId;
	}
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	public String getUserWork() {
		return userWork;
	}
	public void setUserWork(String userWork) {
		this.userWork = userWork;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public int getUserType() {
		return userType;
	}
	public void setUserType(int userType) {
		this.userType = userType;
	}
	public int getUserCredit() {
		return userCredit;
	}
	public void setUserCredit(int userCredit) {
		this.userCredit = userCredit;
	}
	public Date getUserDate() {
		return userDate;
	}
	public void setUserDate(Date userDate) {
		this.userDate = userDate;
	}
	
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPwd() {
		return userPwd;
	}
	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}
	
	
}
