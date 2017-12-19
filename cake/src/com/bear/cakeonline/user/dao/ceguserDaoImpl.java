package com.bear.cakeonline.user.dao;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.bear.cakeonline.entity.Address;
import com.bear.cakeonline.entity.ceguser;

@Repository
public class ceguserDaoImpl {
@Resource
private SessionFactory sessionfactory;


	public void addUser(ceguser user){
     sessionfactory.getCurrentSession().save(user); 
    }
	public ceguser finduserByPhonenumberAndpassword(String phonenumber,String password) {
		String hql="from ceguser where phonenumber=? and password=?";
		Query query = sessionfactory.getCurrentSession().createQuery(hql);
		query.setString(0, phonenumber);
		query.setString(1, password);
	    return (ceguser) query.uniqueResult();
	}
	public ceguser finduserById(int userid) {
		String hql="from ceguser where userid=? ";
		Query query = sessionfactory.getCurrentSession().createQuery(hql);
		query.setLong(0, userid);		
	    return (ceguser) query.uniqueResult();
	}
	public void addAddress(Address add){
	     sessionfactory.getCurrentSession().save(add); 
	    }
	public List<Address> findAddress(int userid) {
		String hql="from Address c where c.user.userid=? ";
		Query query = sessionfactory.getCurrentSession().createQuery(hql);
		query.setLong(0, userid);		
	    return query.list();
	}
		
}
