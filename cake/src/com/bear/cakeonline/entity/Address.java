package com.bear.cakeonline.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "address")
public class Address {
	private int addressid;
	private ceguser user;
	private String consignee_address;
	private String consignee_phone;
	private String consignee_name;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public int getAddressid() {
		return addressid;
	}

	public void setAddressid(int addressid) {
		this.addressid = addressid;
	}
	@ManyToOne
	@JoinColumn(name="USERID")

	public ceguser getUser() {
		return user;
	}

	public void setUser(ceguser user) {
		this.user = user;
	}

	public String getConsignee_address() {
		return consignee_address;
	}

	public void setConsignee_address(String consignee_address) {
		this.consignee_address = consignee_address;
	}

	public String getConsignee_phone() {
		return consignee_phone;
	}

	public void setConsignee_phone(String consignee_phone) {
		this.consignee_phone = consignee_phone;
	}

	public String getConsignee_name() {
		return consignee_name;
	}

	public void setConsignee_name(String consignee_name) {
		this.consignee_name = consignee_name;
	}

	

}
