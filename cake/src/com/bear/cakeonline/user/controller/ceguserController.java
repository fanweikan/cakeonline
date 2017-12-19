package com.bear.cakeonline.user.controller;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bear.cakeonline.cake.service.CakeServiceImpl;
import com.bear.cakeonline.entity.Address;
import com.bear.cakeonline.entity.Cart;
import com.bear.cakeonline.entity.ceguser;
import com.bear.cakeonline.user.service.ceguserServiceImpl;

@Controller
public class ceguserController {
	@Resource
	private ceguserServiceImpl ceguserserviceimpl;
	@Resource
	private CakeServiceImpl CakeServiceImpl;
	@RequestMapping("/regist")
	public String adduser(ceguser user,@RequestParam("address")String address) {
		 List address2 =   new ArrayList<Address>();
		 Address address1 =new Address();
		 address1.setUser(user);		
		 address1.setConsignee_address(address);
		 address1.setConsignee_name(user.getUsername());
		 address1.setConsignee_phone(user.getPhonenumber());
		 address2.add(address1);
		 user.setAdd(address2);
		 this.ceguserserviceimpl.regist(user);
		 Cart cart =new Cart();		
		 cart.setCeguser(user);
		 CakeServiceImpl.saveCart(cart);
		 return "index";
	}
	@RequestMapping("/login")
	public String login(String phonenumber, String password, HttpServletRequest request) {
		ceguser user = ceguserserviceimpl.login(phonenumber, password);
		request.getSession().setAttribute("user", user);
		return "index";
	}
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "index";
	}
	/*ÐÂÔöµØÖ·*/
	@RequestMapping("/newAddress")
	public String newAddress(Address address,HttpSession session) {
		 ceguser user =(ceguser) session.getAttribute("user");		 				 
		 address.setUser(user);				
		 ceguserserviceimpl.saveAddress(address);		
		 int userid1 = user.getUserid();
		 List<Address> addresses = this.ceguserserviceimpl.findaddress(userid1);
		 session.setAttribute("addresses", addresses);
		 return "pay";
	}

}
