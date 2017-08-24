package com.lovo.bean;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonBackReference;

@Entity
@Table(name = "t_contract",catalog="cbdcarsystem")
public class Contract implements Serializable{//企业和系统签订的合同对象
	
	@Id
	@Column(name = "contract_id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int contractId;//合同的标识Id
	
	@Column(name = "oldcontract_id")
	private int oldcontractId;//原合同的编号
	
	@Column(name = "contract_Name")
	private String contractName;//合同名称
	
	@Column(name = "contract_startDate")
	private Date contractStartDate;//合同生效日期
	
	@Column(name = "contract_endDate")
	private Date contractEndDate;//合同结束日期
	
	@Column(name = "contract_picture")
	private String contractPicture;//合同的复印件
	
	@Column(name="contract_type")
	private int contractType;//合同的状态 0:解除合约 1:合约状态
	
	@OneToOne
	@JoinColumn(name = "enterprise_id")
	private Enterprise enterprise;//所属的企业

	public int getContractId() {
		return contractId;
	}

	public void setContractId(int contractId) {
		this.contractId = contractId;
	}

	public int getOldcontractId() {
		return oldcontractId;
	}

	public void setOldcontractId(int oldcontractId) {
		this.oldcontractId = oldcontractId;
	}

	public String getContractName() {
		return contractName;
	}

	public void setContractName(String contractName) {
		this.contractName = contractName;
	}

	public Date getContractStartDate() {
		return contractStartDate;
	}

	public void setContractStartDate(Date contractStartDate) {
		this.contractStartDate = contractStartDate;
	}

	public Date getContractEndDate() {
		return contractEndDate;
	}

	public void setContractEndDate(Date contractEndDate) {
		this.contractEndDate = contractEndDate;
	}

	public String getContractPicture() {
		return contractPicture;
	}

	public void setContractPicture(String contractPicture) {
		this.contractPicture = contractPicture;
	}

	public int getContractType() {
		return contractType;
	}

	public void setContractType(int contractType) {
		this.contractType = contractType;
	}

	public Enterprise getEnterprise() {
		return enterprise;
	}

	public void setEnterprise(Enterprise enterprise) {
		this.enterprise = enterprise;
	}

	public Contract() {
		super();
	}

	public Contract(int contractId, int oldcontractId, String contractName, Date contractStartDate,
			Date contractEndDate, String contractPicture, int contractType, Enterprise enterprise) {
		super();
		this.contractId = contractId;
		this.oldcontractId = oldcontractId;
		this.contractName = contractName;
		this.contractStartDate = contractStartDate;
		this.contractEndDate = contractEndDate;
		this.contractPicture = contractPicture;
		this.contractType = contractType;
		this.enterprise = enterprise;
	}


}
