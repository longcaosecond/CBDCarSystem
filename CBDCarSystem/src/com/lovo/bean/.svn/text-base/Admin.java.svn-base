package com.lovo.bean;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "t_admin",catalog="cbdcarsystem")
public class Admin implements Serializable{//超级管理员对象
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "admin_id")
  private int adminId;
	@Column(name = "admin_account")//账号
  private String adminAccount;
	@Column(name = "admin_pwd")
  private String adminPwd;//密码
public int getAdminId() {
	return adminId;
}
public void setAdminId(int adminId) {
	this.adminId = adminId;
}
public String getAdminAccount() {
	return adminAccount;
}
public void setAdminAccount(String adminAccount) {
	this.adminAccount = adminAccount;
}
public String getAdminPwd() {
	return adminPwd;
}
public void setAdminPwd(String adminPwd) {
	this.adminPwd = adminPwd;
}
}
