package com.lovo.bean;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
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

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;
@Entity
@Table(name="t_rent",catalog="cbdcarsystem")
public class Rent implements Serializable{
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="rent_id")
	private int rentId;
	@JsonIgnore
	@ManyToOne
	@JoinColumn(name="user_id")
	private User user;   
	@Column(name="rent_endDate")       
	private Date rentEndDate;   
	@Column(name="rent_startDate") 
	private Date rentStartDate;
	@Column(name="rent_cnumber")       
	private String rentCnumber;//产权号码
	@Column(name="rent_address")       
	private String rentAddress;
	@Column(name="rent_number")         
	private String rentNumber;//车位号码
	@Column(name="rent_picture")        
	private String rentPicture;//产权图片
	@Column(name="rent_price")          
	private BigDecimal rentPrice;
	@Column(name="rent_type")        
	private int rentType;//出租状态  0审核中 1待出租 2已出租 3审核未通过
	@Column(name="rent_carPicture")  
	private String rentCarPicture;//车位的图片
	@Column(name="rent_message")  
	private String rentMessage;
/*	@JsonIgnore
	@OneToOne(mappedBy="rent")
	private Deal deal;//生成的订单 
	@JsonIgnore
	@OneToMany(mappedBy="rent")
	private Set<Want> wants;*/
	
	public String getRentCarPicture() {
		return rentCarPicture;
	}
	public void setRentCarPicture(String rentCarPicture) {
		this.rentCarPicture = rentCarPicture;
	}
	public String getRentMessage() {
		return rentMessage;
	}
	public void setRentMessage(String rentMessage) {
		this.rentMessage = rentMessage;
	}

	public int getRentId() {
		return rentId;
	}
	public void setRentId(int rentId) {
		this.rentId = rentId;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Date getRentEndDate() {
		return rentEndDate;
	}
	public void setRentEndDate(Date rentEndDate) {
		this.rentEndDate = rentEndDate;
	}

	public Date getRentStartDate() {
		return rentStartDate;
	}
	public void setRentStartDate(Date rentStartDate) {
		this.rentStartDate = rentStartDate;
	}
	public String getRentCnumber() {
		return rentCnumber;
	}
	public void setRentCnumber(String rentCnumber) {
		this.rentCnumber = rentCnumber;
	}
	public String getRentAddress() {
		return rentAddress;
	}
	public void setRentAddress(String rentAddress) {
		this.rentAddress = rentAddress;
	}
	public String getRentNumber() {
		return rentNumber;
	}
	public void setRentNumber(String rentNumber) {
		this.rentNumber = rentNumber;
	}
	public String getRentPicture() {
		return rentPicture;
	}
	public void setRentPicture(String rentPicture) {
		this.rentPicture = rentPicture;
	}
	public BigDecimal getRentPrice() {
		return rentPrice;
	}
	public void setRentPrice(BigDecimal rentPrice) {
		this.rentPrice = rentPrice;
	}
	public int getRentType() {
		return rentType;
	}
	public void setRentType(int rentType) {
		this.rentType = rentType;
	}

	
}
