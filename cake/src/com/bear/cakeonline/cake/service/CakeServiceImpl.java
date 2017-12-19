package com.bear.cakeonline.cake.service;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bear.cakeonline.cake.dao.cakedaoimpl;
import com.bear.cakeonline.entity.Address;
import com.bear.cakeonline.entity.CakeFlavor;
import com.bear.cakeonline.entity.Cart;
import com.bear.cakeonline.entity.Cartitem;
import com.bear.cakeonline.entity.UserOrder;
import com.bear.cakeonline.entity.OrderDetial;
import com.bear.cakeonline.entity.cake;
import com.bear.cakeonline.entity.ceguser;

@Service

public class CakeServiceImpl {

	@Resource
	private cakedaoimpl cakeDaoImpl;
	//��ҳ��������
	public List<cake> listAllCake(int currPage, int pageSize){
		return this.cakeDaoImpl.findAll( currPage,  pageSize);
	}
	//����ҳȫ����������
	public List<cake> findAllCake(){
		return this.cakeDaoImpl.findAllCake( );
	}
	
	public List<CakeFlavor> listAllFlavor(){
		return this.cakeDaoImpl.findAllFlavor();
	}
	/*��ҳ�������ҵ���*/
	public List<cake> ListFindCakesByFlavorSizeTier(String[] flavors,List <Integer> sizes,Integer[] tiers,int currPage, int pageSize){
		return this.cakeDaoImpl.findCakesByFlavorSizeTier(flavors,sizes,tiers, currPage,  pageSize);
	}
	/*����ҳ�������ҵ���*/
	public List<cake> FindCakesByFlavorSizeTier(String[] flavors,List <Integer> sizes,Integer[] tiers){
		return this.cakeDaoImpl.FindCakesByFlavorSizeTier(flavors,sizes,tiers);
	}
	public cake listSingleCake(int id){
		return this.cakeDaoImpl.findCakeById(id);
	}
	public void saveCartitem(Cartitem cartitem) {
		cakeDaoImpl.addCartitem(cartitem);
	}
	public void saveCart(Cart cart) {
		cakeDaoImpl.addCart(cart);
	}
	public int findcartid(int userid) {
		return cakeDaoImpl.findCartidByuserId(userid);		
	}
	public List<Cartitem> findCartitem(int cartid) {
		return cakeDaoImpl.findCartitemByCartid(cartid);		
	}
	public List<Integer> findCakeID(int cartid) {
		return cakeDaoImpl.findcakeid(cartid);		
	}
	public List<cake> findCake(List<Integer> cakeids) {
		return cakeDaoImpl.findCakesById(cakeids);		
	}
	public Cart CartByuserid(int userid){
		return this.cakeDaoImpl.findCartByuserId(userid);
	}
	public int findCount(int cartid,int cakeid) {
		return cakeDaoImpl.findCountByCartidAndcakeid(cartid, cakeid);		
	}
	public void updatecount(int count,int cartid,int cakeid) {
		cakeDaoImpl.updateCount(count, cartid, cakeid);
	}
	public void deleteCartitem(int cartitemid) {
		cakeDaoImpl.deleteCartitem(cartitemid);
	}
	public void changgecount(int count,int cartitemid) {
		cakeDaoImpl.changeCount(count, cartitemid);
	}
	public List<Cartitem> findCartitems(List<Integer> cartitems) {
		return cakeDaoImpl.selectCartitem(cartitems);	
	}
	/*�¶���*/
	@Transactional
	public void addToOrder(UserOrder userOrder,List<Integer> cartitemids) {
		cakeDaoImpl.saveOrder(userOrder);
		cakeDaoImpl.deleteCartitemByids(cartitemids);		
	}
	/*ͨ��id����address�б�*/
	public Address findAddressById( Integer addressid){
		return cakeDaoImpl.findAddressById(addressid);
	}
	 /*ͨ��cartitemids����cake�б�*/
    public List<cake> selectCake(List<Integer> cartitemids){
    	return cakeDaoImpl.selectCake(cartitemids);
    }
    /*ͨ��cartitemids����count�б�*/
    public List<Integer> selectCounts(List<Integer> cartitemids){   	
    	return cakeDaoImpl.selectCounts(cartitemids);
    }
    /*�������ݿ�ǰ��������*/
    public List<cake> findNewCake(Integer first,Integer max){
    	return cakeDaoImpl.findNewCake(first, max);
	}
	 
	
}
