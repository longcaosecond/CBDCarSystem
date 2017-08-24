package com.lovo.bean;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinColumns;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonBackReference;

@Entity
@Table(name = "t_power",catalog="cbdcarsystem")
public class Power implements Serializable{//权限对象
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name ="power_id" )
	private int powerId;//权限id
	
	@Column(name ="power_miaosu" )
	private String powerMiaosu;//权限描述
	
	@Column(name ="power_name" )
	private String powerName;//权限名称
	
//	@JsonBackReference//使用该注解避免出现双向关联进入死循环
//	@ManyToMany
//	@JoinTable(name = "manager_power",joinColumns = @JoinColumn(name = "power_id"),
//				inverseJoinColumns = @JoinColumn(name = "manager_id"))
//	private Set<Manager> managers = new HashSet<Manager>();

	public int getPowerId() {
		return powerId;
	}
	public void setPowerId(int powerId) {
		this.powerId = powerId;
	}
	
	public String getPowerMiaosu() {
		return powerMiaosu;
	}
	public void setPowerMiaosu(String powerMiaosu) {
		this.powerMiaosu = powerMiaosu;
	}
	public String getPowerName() {
		return powerName;
	}
	public void setPowerName(String powerName) {
		this.powerName = powerName;
	}
//	public Set<Manager> getManagers() {
//		return managers;
//	}
//	public void setManagers(Set<Manager> managers) {
//		this.managers = managers;
//	}
}
