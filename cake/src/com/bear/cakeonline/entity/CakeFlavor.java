package com.bear.cakeonline.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="cakeflavor")
public class CakeFlavor {
	private int flavorId;
	private String flavorName;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public int getFlavorId() {
		return flavorId;
	}

	public void setFlavorId(int flavorId) {
		this.flavorId = flavorId;
	}

	public String getFlavorName() {
		return flavorName;
	}

	public void setFlavorName(String flavorName) {
		this.flavorName = flavorName;
	}

}
