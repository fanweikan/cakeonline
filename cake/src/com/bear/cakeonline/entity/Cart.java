package com.bear.cakeonline.entity;

import java.util.HashSet;
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

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;

@Entity
@Table(name = "cart")
public class Cart {
	private int cartid;
	private ceguser ceguser;
	private Set cartitemSet = new HashSet<Cartitem>();
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)        

	public int getCartid() {
		return cartid;
	}

	public void setCartid(int cartid) {
		this.cartid = cartid;
	}
	@OneToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="userid")
	public ceguser getCeguser() {
		return ceguser;
	}

	public void setCeguser(ceguser ceguser) {
		this.ceguser = ceguser;
	}
	@OneToMany( targetEntity=Cartitem.class, 
	        cascade=CascadeType.ALL)
	public Set getCartitemSet() {
		return cartitemSet;
	}

	public void setCartitemSet(Set cartitemSet) {
		this.cartitemSet = cartitemSet;
	}
   
	

	

}
