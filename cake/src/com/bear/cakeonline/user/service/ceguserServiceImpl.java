package com.bear.cakeonline.user.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bear.cakeonline.entity.Address;
import com.bear.cakeonline.entity.ceguser;
import com.bear.cakeonline.user.dao.ceguserDaoImpl;

@Service

public class ceguserServiceImpl {
	@Resource
	private ceguserDaoImpl ceguserdaoimpl;

	public void regist(ceguser user) {
		ceguserdaoimpl.addUser(user);
	}

	public ceguser login(String phonenumber, String password) {
		return ceguserdaoimpl.finduserByPhonenumberAndpassword(phonenumber, password);
	}
	public ceguser finduerByID(int id) {
		return ceguserdaoimpl.finduserById(id);
	}
	public void saveAddress(Address add) {
		ceguserdaoimpl.addAddress(add);
	}
	public List<Address> findaddress(int userid) {
		return ceguserdaoimpl.findAddress(userid);
	}

}
