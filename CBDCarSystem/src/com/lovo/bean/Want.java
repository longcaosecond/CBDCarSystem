package com.lovo.bean;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;
//Want求租信息
@Table(name="t_want",catalog="cbdcarsystem")
@Entity
public class Want implements Serializable{
@Id
@GeneratedValue(strategy=GenerationType.IDENTITY)
@Column(name="want_id")
private int wantId;
@ManyToOne
@JoinColumn(name="rent_id")
private Rent rent;
@ManyToOne
@JoinColumn(name="user_id")
private User user;//求租者
@Column(name="want_message")
private String wantMessage;
@Column(name="want_type")
private int wantType;//该信息包租婆是否查看的状态
public int getWantId() {
	return wantId;
}
public int getWantType1() {
	return wantType;
}
public void setWantType1(int wantType) {
	this.wantType = wantType;
}
public void setWantId(int wantId) {
	this.wantId = wantId;
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

public int getWantType() {
	return wantType;
}
public void setWantType(int wantType) {
	this.wantType = wantType;
}
public void setUser(User user) {
	this.user = user;
}
public String getWantMessage() {
	return wantMessage;
}
public void setWantMessage(String wantMessage) {
	this.wantMessage = wantMessage;
}

}
