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
@Table(name = "cartitem")
public class Cartitem {
	private int cartitem_id;
	private cake cake;
	private int count;
    private Cart cart;
   

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public int getCartitem_id() {
		return cartitem_id;
	}

	public void setCartitem_id(int cartitem_id) {
		this.cartitem_id = cartitem_id;
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
	@JoinColumn(name="cartid")

	public Cart getCart() {
		return cart;
	}

	public void setCart(Cart cart) {
		this.cart = cart;
	}			
}
