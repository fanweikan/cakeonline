package com.bear.cakeonline.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "userOrder")
public class UserOrder {
     private int orderid;
     private ceguser user;
     private double totalprice;
     private Address address;
     private List<OrderDetial> orderdetials = new ArrayList<OrderDetial>();
    @Id
 	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public int getOrderid() {
		return orderid;
	}
	public void setOrderid(int orderid) {
		this.orderid = orderid;
	}
	@ManyToOne
	@JoinColumn(name="userid")
	public ceguser getUser() {
		return user;
	}
	public void setUser(ceguser user) {
		this.user = user;
	}
	public double getTotalprice() {
		return totalprice;
	}
	public void setTotalprice(double totalprice) {
		this.totalprice = totalprice;
	}
	@OneToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="addressid")
	public Address getAddress() {
		return address;
	}
	public void setAddress(Address address) {
		this.address = address;
	}
	@OneToMany(mappedBy="order", targetEntity=OrderDetial.class, 
	        cascade=CascadeType.ALL)
	public List<OrderDetial> getOrderdetials() {
		return orderdetials;
	}
	public void setOrderdetials(List<OrderDetial> orderdetials) {
		this.orderdetials = orderdetials;
	}
		     
}
