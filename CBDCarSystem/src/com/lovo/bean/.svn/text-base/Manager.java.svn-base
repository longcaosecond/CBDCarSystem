package com.lovo.bean;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;

@Entity
@Table(name = "t_manager",catalog="cbdcarsystem")
public class Manager implements Serializable{//后台管理员对象
     
	 @Id
	 @Column(name = "manager_id")
     private int managerId;//管理员工号 默认登录账户就是工号
     
     @Column(name = "manager_account")
     private String managerAccount;//管理员工号 默认登录账户就是工号
     
     @Column(name = "manager_pwd")
     private String managerPwd;//管理员密码
	
     @Column(name = "manager_name")
     private String managerName;//管理员姓名
	
     @Column(name = "manager_phone")
     private String managerPhone;//管理员电话
    
     @ManyToMany
	 @JoinTable(name = "manager_power",joinColumns = @JoinColumn(name = "manager_id"),
	 				inverseJoinColumns = @JoinColumn(name = "power_id"))
	 private Set<Power> powers = new HashSet<Power>();
	
     public Set<Power> getPowers() {
		return powers;
	}
	public void setPowers(Set<Power> powers) {
		this.powers = powers;
	}
	public int getManagerId() {
		return managerId;
	}
	
	public String getManagerAccount() {
		return managerAccount;
	}
	public void setManagerAccount(String managerAccount) {
		this.managerAccount = managerAccount;
	}
	public void setManagerId(int managerId) {
		this.managerId = managerId;
	}
	public String getManagerPwd() {
		return managerPwd;
	}
	public void setManagerPwd(String managerPwd) {
		this.managerPwd = managerPwd;
	}
	public String getManagerName() {
		return managerName;
	}
	public void setManagerName(String managerName) {
		this.managerName = managerName;
	}
	public String getManagerPhone() {
		return managerPhone;
	}
	public void setManagerPhone(String managerPhone) {
		this.managerPhone = managerPhone;
	}
}
