package com.lovo.bean;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="t_outContract")//外部合约实体类
public class OutContract implements Serializable{
	
	@Id
	@Column(name="outContract_id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int outContractId;//外部合约ID
	
	@Column(name="outContract_oldNo")
	private String outContractOldNo;//外部合约原合同编号
	
	@Column(name="outContract_newNo")
	private String outContractNewNo;//外部合约新续合同编号
	
	@Column(name="outContract_company")
	private String outContractCompany;//外部合约合同单位
	
	@Column(name="outContract_contact")
	private String outContractContact;//外部合约对方联系人
	
	@Column(name="outContract_phone")
	private String outContractPhone;//外部合约对方联系电话
	
	@Column(name="outContract_address")
	private String outContractAddress;//外部合约车位所属单位详细地址
	
	@Column(name="outContract_startTime")
	private Date outContractStartTime;//外部合约合同生效日期
	
	@Column(name="outContract_endTime")
	private Date outContractEndTime;//外部合约合同截止日期
	
	@Column(name="outContract_copyImg")
	private String outContractCopyImg;//外部合约上传合同复印件
	
	@Column(name="outContract_carNo")
	private String outContractCarNo;//外部合约车位编号
	
	@Column(name="outContract_type")
	 private int outContractType;//外部合约的状态 0:解除合约 1:合约状态
	
	public OutContract() {
		super();
	}

	public OutContract(int outContractId, String outContractOldNo, String outContractNewNo, String outContractCompany,
			String outContractContact, String outContractPhone, String outContractAddress, Date outContractStartTime,
			Date outContractEndTime, String outContractCopyImg, String outContractCarNo, int outContractType) {
		super();
		this.outContractId = outContractId;
		this.outContractOldNo = outContractOldNo;
		this.outContractNewNo = outContractNewNo;
		this.outContractCompany = outContractCompany;
		this.outContractContact = outContractContact;
		this.outContractPhone = outContractPhone;
		this.outContractAddress = outContractAddress;
		this.outContractStartTime = outContractStartTime;
		this.outContractEndTime = outContractEndTime;
		this.outContractCopyImg = outContractCopyImg;
		this.outContractCarNo = outContractCarNo;
		this.outContractType = outContractType;
	}

	public int getOutContractId() {
		return outContractId;
	}

	public void setOutContractId(int outContractId) {
		this.outContractId = outContractId;
	}

	public String getOutContractOldNo() {
		return outContractOldNo;
	}

	public void setOutContractOldNo(String outContractOldNo) {
		this.outContractOldNo = outContractOldNo;
	}

	public String getOutContractNewNo() {
		return outContractNewNo;
	}

	public void setOutContractNewNo(String outContractNewNo) {
		this.outContractNewNo = outContractNewNo;
	}

	public String getOutContractCompany() {
		return outContractCompany;
	}

	public void setOutContractCompany(String outContractCompany) {
		this.outContractCompany = outContractCompany;
	}

	public String getOutContractContact() {
		return outContractContact;
	}

	public void setOutContractContact(String outContractContact) {
		this.outContractContact = outContractContact;
	}

	public String getOutContractPhone() {
		return outContractPhone;
	}

	public void setOutContractPhone(String outContractPhone) {
		this.outContractPhone = outContractPhone;
	}

	public String getOutContractAddress() {
		return outContractAddress;
	}

	public void setOutContractAddress(String outContractAddress) {
		this.outContractAddress = outContractAddress;
	}

	public Date getOutContractStartTime() {
		return outContractStartTime;
	}

	public void setOutContractStartTime(Date outContractStartTime) {
		this.outContractStartTime = outContractStartTime;
	}

	public Date getOutContractEndTime() {
		return outContractEndTime;
	}

	public void setOutContractEndTime(Date outContractEndTime) {
		this.outContractEndTime = outContractEndTime;
	}

	public String getOutContractCopyImg() {
		return outContractCopyImg;
	}

	public void setOutContractCopyImg(String outContractCopyImg) {
		this.outContractCopyImg = outContractCopyImg;
	}

	public String getOutContractCarNo() {
		return outContractCarNo;
	}

	public void setOutContractCarNo(String outContractCarNo) {
		this.outContractCarNo = outContractCarNo;
	}

	public int getOutContractType() {
		return outContractType;
	}

	public void setOutContractType(int outContractType) {
		this.outContractType = outContractType;
	}

	@Override
	public String toString() {
		return "OutContract [outContractId=" + outContractId + ", outContractOldNo=" + outContractOldNo
				+ ", outContractNewNo=" + outContractNewNo + ", outContractCompany=" + outContractCompany
				+ ", outContractContact=" + outContractContact + ", outContractPhone=" + outContractPhone
				+ ", outContractAddress=" + outContractAddress + ", outContractStartTime=" + outContractStartTime
				+ ", outContractEndTime=" + outContractEndTime + ", outContractCopyImg=" + outContractCopyImg
				+ ", outContractCarNo=" + outContractCarNo + ", outContractType=" + outContractType + "]";
	}
	
}
