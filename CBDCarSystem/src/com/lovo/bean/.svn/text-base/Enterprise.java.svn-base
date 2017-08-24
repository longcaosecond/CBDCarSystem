package com.lovo.bean;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonBackReference;

@Entity
@Table(name = "t_enterprise",catalog="cbdcarsystem")
public class Enterprise implements Serializable{//企业对象
	/**
	 * 
	 */
	private static final long serialVersionUID = -5190367267857197923L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "enterprise_id")
    private int enterpriseId;//企业id
	
	@Column(name = "enterprise_account")
    private String enterpriseAccount;//企业登录账号
	
	@Column(name = "enterprise_pwd")
    private String enterprisePwd;//企业登录密码
	
	@Column(name = "enterprise_name")
    private String enterpriseName;//企业的名称
	
	@Column(name = "enterprise_address")
    private String enterpriseAddress;//企业的地址
	
	@Column(name = "enterprise_contact")
    private String enterpriseContact;//企业的联系人
	
	@Column(name = "enterprise_phone")
    private String enterprisePhone;//企业的练习电话
	
//	@OneToMany(mappedBy="enterprise")
//	private Set<Park> parks = new HashSet<Park>();//企业下面车位的集合
	
	@JsonBackReference
	@OneToOne(mappedBy="enterprise")
	private Contract contract;//企业和系统签订的合同
	
	@Column(name="enterprise_type")
	private int enterpriseType;//企业状态，0代表无合约，1代表有合约，2表示已删除
	
public int getEnterpriseType() {
		return enterpriseType;
	}
	public void setEnterpriseType(int enterpriseType) {
		this.enterpriseType = enterpriseType;
	}
public int getEnterpriseId() {
	return enterpriseId;
}
public void setEnterpriseId(int enterpriseId) {
	this.enterpriseId = enterpriseId;
}
public String getEnterpriseAccount() {
	return enterpriseAccount;
}
public void setEnterpriseAccount(String enterpriseAccount) {
	this.enterpriseAccount = enterpriseAccount;
}
public String getEnterprisePwd() {
	return enterprisePwd;
}
public void setEnterprisePwd(String enterprisePwd) {
	this.enterprisePwd = enterprisePwd;
}
public String getEnterpriseName() {
	return enterpriseName;
}
public void setEnterpriseName(String enterpriseName) {
	this.enterpriseName = enterpriseName;
}
public String getEnterpriseAddress() {
	return enterpriseAddress;
}
public void setEnterpriseAddress(String enterpriseAddress) {
	this.enterpriseAddress = enterpriseAddress;
}
public String getEnterpriseContact() {
	return enterpriseContact;
}
public void setEnterpriseContact(String enterpriseContact) {
	this.enterpriseContact = enterpriseContact;
}
public String getEnterprisePhone() {
	return enterprisePhone;
}
//public Set<Park> getParks() {
//	return parks;
//}
//public void setParks(Set<Park> parks) {
//	this.parks = parks;
//}
public Contract getContract() {
	return contract;
}
public void setContract(Contract contract) {
	this.contract = contract;
}
public void setEnterprisePhone(String enterprisePhone) {
	this.enterprisePhone = enterprisePhone;
}
  
}
