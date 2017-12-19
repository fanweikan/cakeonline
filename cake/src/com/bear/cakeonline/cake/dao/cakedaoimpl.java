package com.bear.cakeonline.cake.dao;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.bear.cakeonline.entity.Address;
import com.bear.cakeonline.entity.CakeFlavor;
import com.bear.cakeonline.entity.Cart;
import com.bear.cakeonline.entity.Cartitem;
import com.bear.cakeonline.entity.UserOrder;
import com.bear.cakeonline.entity.cake;
import com.bear.cakeonline.entity.ceguser;

@Repository
public class cakedaoimpl {

	@Resource
	private SessionFactory sessionFactory;
	/*��ҳ�������е�������*/
	public List<cake> findAll(int currPage, int pageSize){
		Query q=this.sessionFactory.getCurrentSession().createQuery("from cake");
		q.setFirstResult((currPage-1) * pageSize);
		q.setMaxResults(pageSize);
		return q.list();
	}
	/*����ҳ�������е�������*/
	public List<cake> findAllCake(){
		Query q=this.sessionFactory.getCurrentSession().createQuery("from cake");		
		return q.list();
	}
	/*�������п�ζ*/
	public List<CakeFlavor> findAllFlavor(){
		Query q=this.sessionFactory.getCurrentSession().createQuery("from CakeFlavor");
		return q.list();
	}
	/*��ҳ�������ҵ���*/
	public List<cake> findCakesByFlavorSizeTier(String[] flavors,List<Integer>sizes,Integer []tiers,int currPage, int pageSize){
		if(flavors==null&&sizes!=null&&tiers!=null) {
			Query q=this.sessionFactory.getCurrentSession().createQuery(" select c From cake c Where  c.size in(:size)and c.tier in(:tier)");
			q.setParameterList("size", sizes);
			q.setParameterList("tier", tiers);
			q.setFirstResult((currPage-1) * pageSize);
			q.setMaxResults(pageSize);
			return q.list();
		}
		if(flavors==null&&sizes==null&&tiers!=null) {
			Query q=this.sessionFactory.getCurrentSession().createQuery(" select c From cake c Where  c.tier in(:tier)");			
			q.setParameterList("tier", tiers);
			q.setFirstResult((currPage-1) * pageSize);
			q.setMaxResults(pageSize);
			return q.list();
		}
		if(flavors==null&&sizes!=null&&tiers==null) {
			Query q=this.sessionFactory.getCurrentSession().createQuery(" select c From cake c Where  c.size in(:size)  ");			
			q.setParameterList("size", sizes);
			q.setFirstResult((currPage-1) * pageSize);
			q.setMaxResults(pageSize);
			return q.list();
		}
		if(flavors!=null&&sizes==null&&tiers==null) {
			Query q=this.sessionFactory.getCurrentSession().createQuery(" select c From cake c Where c.flavor in(:flavor)");
			q.setParameterList("flavor", flavors);
			q.setFirstResult((currPage-1) * pageSize);
			q.setMaxResults(pageSize);
			return q.list();
		}
		if(flavors!=null&&sizes!=null&&tiers==null) {
			Query q=this.sessionFactory.getCurrentSession().createQuery(" select c From cake c Where  c.size in(:size) and c.flavor in(:flavor)");
			q.setParameterList("size", sizes);
			q.setParameterList("flavor", flavors);
			q.setFirstResult((currPage-1) * pageSize);
			q.setMaxResults(pageSize);
			return q.list();
		}
		if(flavors!=null&&sizes==null&&tiers!=null) {
			Query q=this.sessionFactory.getCurrentSession().createQuery(" select c From cake c Where c.flavor in(:flavor) and c.tier in(:tier)");
			q.setParameterList("flavor", flavors);
			q.setParameterList("tier", tiers);
			q.setFirstResult((currPage-1) * pageSize);
			q.setMaxResults(pageSize);
			return q.list();
		}
		Query q=this.sessionFactory.getCurrentSession().createQuery(" select c From cake c Where c.flavor in(:flavor)and c.size in(:size)and c.tier in(:tier)");
		q.setParameterList("flavor", flavors);
		q.setParameterList("size", sizes);
		q.setParameterList("tier", tiers);
		q.setFirstResult((currPage-1) * pageSize);
		q.setMaxResults(pageSize);
		return q.list();
		}
	/*����ҳ�������ҵ���*/
	public List<cake> FindCakesByFlavorSizeTier(String[] flavors,List<Integer>sizes,Integer []tiers){
		if(flavors==null&&sizes!=null&&tiers!=null) {
			Query q=this.sessionFactory.getCurrentSession().createQuery(" select c From cake c Where  c.size in(:size)and c.tier in(:tier)");
			q.setParameterList("size", sizes);
			q.setParameterList("tier", tiers);
			return q.list();
		}
		if(flavors==null&&sizes==null&&tiers!=null) {
			Query q=this.sessionFactory.getCurrentSession().createQuery(" select c From cake c Where  c.tier in(:tier)");			
			q.setParameterList("tier", tiers);
			return q.list();
		}
		if(flavors==null&&sizes!=null&&tiers==null) {
			Query q=this.sessionFactory.getCurrentSession().createQuery(" select c From cake c Where  c.size in(:size)  ");			
			q.setParameterList("size", sizes);
			return q.list();
		}
		if(flavors!=null&&sizes==null&&tiers==null) {
			Query q=this.sessionFactory.getCurrentSession().createQuery(" select c From cake c Where c.flavor in(:flavor)");
			q.setParameterList("flavor", flavors);
			return q.list();
		}
		if(flavors!=null&&sizes!=null&&tiers==null) {
			Query q=this.sessionFactory.getCurrentSession().createQuery(" select c From cake c Where  c.size in(:size) and c.flavor in(:flavor)");
			q.setParameterList("size", sizes);
			q.setParameterList("flavor", flavors);
			return q.list();
		}
		if(flavors!=null&&sizes==null&&tiers!=null) {
			Query q=this.sessionFactory.getCurrentSession().createQuery(" select c From cake c Where c.flavor in(:flavor) and c.tier in(:tier)");
			q.setParameterList("flavor", flavors);
			q.setParameterList("tier", tiers);
			return q.list();
		}		
		Query q=this.sessionFactory.getCurrentSession().createQuery(" select c From cake c Where c.flavor in(:flavor)and c.size in(:size)and c.tier in(:tier)");
		q.setParameterList("flavor", flavors);
		q.setParameterList("size", sizes);
		q.setParameterList("tier", tiers);		
		return q.list();
		}
	public cake findCakeById( int id){
		Query q=this.sessionFactory.getCurrentSession().createQuery("from cake where cake_id=?");
		q.setParameter(0, id);
		cake cake = (cake)q.uniqueResult();
		return cake;
	}

		public void addCartitem(Cartitem cartitem){
	    this.sessionFactory.getCurrentSession().save(cartitem); 
	}
	    public void addCart(Cart cart) {
	    this.sessionFactory.getCurrentSession().save(cart);
    }
	    public int findCartidByuserId( int userid){
			Query q=this.sessionFactory.getCurrentSession().createQuery("select cartid from Cart where userid=?");
			q.setParameter(0, userid);
			int cartid = (int)q.uniqueResult();
			return cartid;
		}  
	    public List<Cartitem> findCartitemByCartid( int Cartid){
			Query q=this.sessionFactory.getCurrentSession().createQuery("  From Cartitem where cartid=?"); 
			q.setParameter(0, Cartid);			
			return q.list();
	   }
	    public List<Integer> findcakeid(int Cartid){
			Query q=this.sessionFactory.getCurrentSession().createQuery(" select ci.cake.cake_id From Cartitem ci where ci.cart.cartid=?"); 
			q.setParameter(0, Cartid);			
			return q.list();
	   }
	    public List<cake> findCakesById( List<Integer> cakeids){
			Query q=this.sessionFactory.getCurrentSession().createQuery(" select c From cake c Where c.cake_id in(:cakeids)");
			q.setParameterList("cakeids", cakeids);			
			return q.list();
		}
	    public Cart findCartByuserId( int userid){
			Query q=this.sessionFactory.getCurrentSession().createQuery("from Cart where userid=?");
			q.setParameter(0, userid);
			Cart cart = (Cart)q.uniqueResult();
			return cart;
	    }
	    public int findCountByCartidAndcakeid( int cartid,int cakeid){
			Query q=this.sessionFactory.getCurrentSession().createQuery("select c.count from Cartitem c where c.cart.cartid = ? and c.cake.cake_id = ?");
			q.setParameter(0, cartid);
			q.setParameter(1, cakeid);
			int count = (int)q.uniqueResult();
			return count;
		}
	    public void updateCount(int count,int cartid,int cakeid) {
	    	Query q=this.sessionFactory.getCurrentSession().createQuery("update Cartitem c set c.count=? where c.cart.cartid=? and c.cake.cake_id=? ");
	        q.setParameter(0, count);
	        q.setParameter(1, cartid);
	        q.setParameter(2, cakeid);
	        q.executeUpdate();
	    }
	   /* ͨ��idɾ�����ﳵ����*/
	    public void deleteCartitem(int cartitemid) {
	    	Query q=this.sessionFactory.getCurrentSession().createQuery("Delete FROM Cartitem c Where c.cartitem_id=? ");
	        q.setParameter(0, cartitemid);      
	        q.executeUpdate();
	    }
	    public void changeCount(int count,int cartitemid) {
	    	Query q=this.sessionFactory.getCurrentSession().createQuery("update Cartitem c set c.count=? where c.cartitem_id=?  ");
	        q.setParameter(0, count);
	        q.setParameter(1, cartitemid);     
	        q.executeUpdate();
	    }
	    //ͨ��ids���ҹ��ﳵ����
	    public List<Cartitem> selectCartitem(List<Integer> cartitemids){
	    	Query q = this.sessionFactory.getCurrentSession().createQuery("from Cartitem c where c.cartitem_id in(:cartitems)");
			q.setParameterList("cartitems", cartitemids);
	    	return q.list();
	    }
	    /*���涩��*/
	    public void saveOrder(UserOrder userOrder) {
		    this.sessionFactory.getCurrentSession().save(userOrder);
	    }
	    /* ͨ��idsɾ�����ﳵ����*/
	    public void deleteCartitemByids(List<Integer> cartitemids) {
	    	Query q=this.sessionFactory.getCurrentSession().createQuery("Delete FROM Cartitem c Where c.cartitem_id in(:cartitemids) ");
	        q.setParameterList("cartitemids", cartitemids);      
	        q.executeUpdate();
	    }
	    /*ͨ��addressid����Address�б�*/
	    public Address findAddressById( Integer addressid){
			Query q=this.sessionFactory.getCurrentSession().createQuery(" select c From Address c Where c.addressid =?)");
			q.setParameter(0, addressid);			
			Address address = (Address)q.uniqueResult();
			return address;
		}
	    /*ͨ��cartitemids����cake�б�*/
	    public List<cake> selectCake(List<Integer> cartitemids){
	    	Query q = this.sessionFactory.getCurrentSession().createQuery("select c.cake from Cartitem c where c.cartitem_id in(:cartitems)");
			q.setParameterList("cartitems", cartitemids);
	    	return q.list();
	    }
	    /*ͨ��cartitemids����count�б�*/
	    public List<Integer> selectCounts(List<Integer> cartitemids){
	    	Query q = this.sessionFactory.getCurrentSession().createQuery("select c.count from Cartitem c where c.cartitem_id in(:cartitems)");
			q.setParameterList("cartitems", cartitemids);
	    	return q.list();
	    }
	    /*�������ݿ�ǰ��������*/
	    public List<cake> findNewCake(Integer first,Integer max){
			Query q=this.sessionFactory.getCurrentSession().createQuery("from cake");
			q.setFirstResult(first);
			q.setMaxResults(max);
			return q.list();
		}
}
     
