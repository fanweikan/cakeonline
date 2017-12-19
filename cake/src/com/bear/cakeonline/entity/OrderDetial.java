package com.bear.cakeonline.entity;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "order_detial")
public class OrderDetial {
      private int id;
      private cake cake;
      private int count;
      private UserOrder userOrder;
    @Id
  	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	@OneToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="cake_id")
	public cake getCake() {
		return cake;
	}
	public void setCake(cake cake) {
		this.cake = cake;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	@ManyToOne
	@JoinColumn(name="orderid")
	public UserOrder getOrder() {
		return userOrder;
	}
	public void setOrder(UserOrder userOrder) {
		this.userOrder = userOrder;
	}
	
      
}
