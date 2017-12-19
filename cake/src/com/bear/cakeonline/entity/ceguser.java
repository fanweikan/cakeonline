package com.bear.cakeonline.entity;


import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

@Entity
@Table(name = "ceguser")
public class ceguser {
	private int userid;
	private String username;
	private List<Address> add =  new ArrayList<Address>();
	private String password;
    private String phonenumber;
    
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	
	public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPhonenumber() {
		return phonenumber;
	}

	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}
	@OneToMany(mappedBy="consignee_address", targetEntity=Address.class, 
	        cascade=CascadeType.ALL)
	public List<Address> getAdd() {
		return add;
	}

	public void setAdd(List<Address> add) {
		this.add = add;
	}
	
	

	
	
					

}
