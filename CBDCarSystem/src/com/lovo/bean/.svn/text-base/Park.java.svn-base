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

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonManagedReference;


@Entity
@Table(name = "t_park",catalog="cbdcarsystem")
public class Park implements Serializable{//企业车位对象
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "park_id")
	private int parkId;//车位id
	
	@Column(name = "park_address")
	private String parkAddress;//车位位置
	
	@Column(name = "park_number")
	private String parkNumber;//车位号
	
	@ManyToOne
	@JoinColumn(name = "park_contractId")
	private Contract parkContract;//合同编号
	
	@ManyToOne
	@JoinColumn(name = "park_outContractId")
	private OutContract outContract;//外部合同编号
	
	@Column(name = "park_type")
	private int parkType;//车位状态，1代表以租 0代表未租

	public int getParkId() {
		return parkId;
	}
    public OutContract getOutContract() {
	    return outContract;
    }
    public void setOutContract(OutContract outContract) {
		this.outContract = outContract;
    }
	public void setParkId(int parkId) {
		this.parkId = parkId;
	}
	public String getParkAddress() {
		return parkAddress;
	}
	public void setParkAddress(String parkAddress) {
		this.parkAddress = parkAddress;
	}
	public String getParkNumber() {
		return parkNumber;
	}
	public void setParkNumber(String parkNumber) {
		this.parkNumber = parkNumber;
	}
	
	public Contract getParkContract() {
		return parkContract;
	}
	public void setParkContract(Contract parkContract) {
		this.parkContract = parkContract;
	}
	
	public int getParkType() {
		return parkType;
	}
	public void setParkType(int parkType) {
		this.parkType = parkType;
	}

	public Park() {
		super();
	}

	public Park(int parkId, String parkAddress, String parkNumber, Contract parkContract, OutContract outContract,
			int parkType) {
		super();
		this.parkId = parkId;
		this.parkAddress = parkAddress;
		this.parkNumber = parkNumber;
		this.parkContract = parkContract;
		this.outContract = outContract;
		this.parkType = parkType;
	}

}
