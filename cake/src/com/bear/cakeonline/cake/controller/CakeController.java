package com.bear.cakeonline.cake.controller;

import java.io.UnsupportedEncodingException;
import java.lang.reflect.Array;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.annotation.SessionScope;
import com.bear.cakeonline.cake.service.CakeServiceImpl;
import com.bear.cakeonline.entity.Address;
import com.bear.cakeonline.entity.CakeFlavor;
import com.bear.cakeonline.entity.Cart;
import com.bear.cakeonline.entity.Cartitem;
import com.bear.cakeonline.entity.UserOrder;
import com.bear.cakeonline.entity.OrderDetial;
import com.bear.cakeonline.entity.cake;
import com.bear.cakeonline.entity.ceguser;
import com.bear.cakeonline.user.service.ceguserServiceImpl;
import com.bear.cakeonline.util.PageModel;
import com.bear.cakeonline.util.PageModelDaoImpl;
import com.bear.cakeonline.util.PageModelServiceImpl;
import com.bear.cakeonline.util.JSONUtils;

@Controller
public class CakeController {

	@Resource
	private CakeServiceImpl CakeServiceImpl;
	@Resource
	private PageModelServiceImpl pageModelServiceImpl;
	@Resource
	private ceguserServiceImpl ceguserserviceimpl;
	@RequestMapping("/index")
	public String index( Model model) {		
		List<cake> datas1 = this.CakeServiceImpl.findNewCake(0,1);
		List<cake> datas2 = this.CakeServiceImpl.findNewCake(1, 1);
		List<cake> datas3 = this.CakeServiceImpl.findNewCake(2, 8);	
		model.addAttribute("datas1", datas1);
		model.addAttribute("datas2", datas2);
		model.addAttribute("datas3", datas3);
		return "index";
	}

	@RequestMapping("/products")
	public String all(@RequestParam(value = "currPage", defaultValue = "1") String currPage, Model model) {
		int page = Integer.parseInt(currPage); // 当前页
		int pagesize = 6;
		List<CakeFlavor> falvorList = this.CakeServiceImpl.listAllFlavor();
		model.addAttribute("flavors", falvorList);
		List<cake> datas = this.CakeServiceImpl.listAllCake(page, pagesize);
		List<cake> datas2 = this.CakeServiceImpl.findAllCake();
		int totals = datas2.size();
		PageModel pageModel = pageModelServiceImpl.getPageModel(totals, datas, pagesize, page);
		model.addAttribute("pageModel", pageModel);
		return "products";
	}

	@RequestMapping("/pageselect")
	public String select(@RequestParam(value = "flavor", required = false) String[] flavors,
			@RequestParam(value = "size", required = false) String[] sizes,
			@RequestParam(value = "tier", required = false) Integer[] tiers,
			@RequestParam(value = "currPage", defaultValue = "1") String currPage, Model model) {
		int page = Integer.parseInt(currPage); // 当前页
		int pagesize = 6;
		String[] sizes1=sizes;
		List<String> b = null;
		List<Integer> size2 = null;	
		if(sizes1!=null) {		
			b = new ArrayList<String>();
			size2 = new ArrayList<Integer>();
			for (String a : sizes1) {
			if (a.contains(",")) {
				String[] c;
				c = a.split(",");
				for (int i = 0; i < c.length; i++) {
					b.add(c[i]);
				}

			} else {
				b.add(a);
			}
		}
		for (String str : b) {
			int i = Integer.parseInt(str);
			size2.add(i);
		}
		}
		List<CakeFlavor> falvorList = this.CakeServiceImpl.listAllFlavor();
		model.addAttribute("flavors", falvorList);
		List<cake> datas = this.CakeServiceImpl.ListFindCakesByFlavorSizeTier(flavors, size2, tiers, page, pagesize);
		List<cake> datas2 = this.CakeServiceImpl.FindCakesByFlavorSizeTier(flavors, size2, tiers);
		int totals = datas2.size();
		PageModel pageModel = pageModelServiceImpl.getPageModel(totals, datas, pagesize, page);
		model.addAttribute("pageModel", pageModel);
		return "products";
	}

	@RequestMapping("/single")
	public String single(@RequestParam(value = "cake_id") String cake_id, Model model) {
		int cakeid = Integer.parseInt(cake_id);
		cake cake = this.CakeServiceImpl.listSingleCake(cakeid);
		model.addAttribute("cake", cake);		
		return "single";
	}


/*添加购物车*/
	@RequestMapping("/cart")
	@ResponseBody//此注解不能省略 否则ajax无法接受返回值  
	public Map<String, Object> addtocart(Integer cakeid,Integer count,HttpSession session  ) {		 
		 ceguser user = (ceguser)session.getAttribute("user");
		 int userid1 = user.getUserid();		
		 int cartid = this.CakeServiceImpl.findcartid(userid1);
		 List<Integer> cakeids = this.CakeServiceImpl.findCakeID(cartid);
		 if(cakeids.contains(cakeid)) {
			int count0 = this.CakeServiceImpl.findCount(cartid, cakeid);
			count += count0;
			this.CakeServiceImpl.updatecount(count, cartid, cakeid);
		 }else {
		 Cartitem cartitem = new Cartitem();		 
	     cake cake = this.CakeServiceImpl.listSingleCake(cakeid);
		 cartitem.setCake(cake);
		 cartitem.setCount(count);
		 Cart cart = this.CakeServiceImpl.CartByuserid(userid1);
		 cartitem.setCart(cart);				 
		 this.CakeServiceImpl.saveCartitem(cartitem);
		 }
		 Map<String,Object> resultMap = new HashMap<String, Object>();  		  
		 resultMap.put("result","SUCCESS");  	   
		 return resultMap;  
	}
	@RequestMapping("/checkout")
    public String chekout(Model model,HttpSession session) {
		ceguser user = (ceguser)session.getAttribute("user");
		 int userid1 = user.getUserid();
		int cartid = CakeServiceImpl.findcartid(userid1);
		List<Cartitem> cartitems = this.CakeServiceImpl.findCartitem(cartid);				
		model.addAttribute("cartitems", cartitems);					
		return "checkout";
	}
	@RequestMapping("delcartitem")  
	@ResponseBody//此注解不能省略 否则ajax无法接受返回值  
	public Map<String, Object> delcartitem(Integer cartitemid,HttpSession session){  	      
	    Map<String,Object> resultMap = new HashMap<String, Object>();  
	    CakeServiceImpl.deleteCartitem(cartitemid);	   
	    //xxx逻辑处理  
	    resultMap.put("result","SUCCESS");  	   
	    return resultMap;  
	} 
     //确认订单
	@RequestMapping("/confirmOrder")
	public String addToOrder(@RequestParam("cartitemid")String[] cartitemid,HttpServletRequest request ) {		 
	ceguser user = (ceguser)request.getSession().getAttribute("user");
    int userid1 = user.getUserid();
    List<Address> addresses = this.ceguserserviceimpl.findaddress(userid1);
	List<Integer> cartitemids = new ArrayList<Integer>();
	for (String str : cartitemid) {
		int i = Integer.parseInt(str);
		cartitemids.add(i);					
	}
	List<Cartitem> datas = this.CakeServiceImpl.findCartitems(cartitemids);
	request.getSession().setAttribute("cartitems", datas);
	request.getSession().setAttribute("addresses", addresses);
	return "pay";
    }
	//购物车中修改数量
	@RequestMapping("/changeCount")
	public void changeCount(@RequestParam("cartitemid")String cartitemid,@RequestParam("count")String count ) {		 		
				
		 int count1 = Integer.valueOf(count);
		 int cartitemid1 = Integer.parseInt(cartitemid);		 
		 this.CakeServiceImpl.changgecount(count1, cartitemid1);		
	}
	/*下订单*/
	@RequestMapping("/addToOrder")
	@ResponseBody//此注解不能省略 否则ajax无法接受返回值  
	public Map<String,Object> addToOrder(Integer addressid,HttpSession session) {		 		
		 ceguser user = (ceguser)session.getAttribute("user");		
		 List <Cartitem> cartitems =(List<Cartitem>) session.getAttribute("cartitems");
		 List<Integer> cartitemids = new ArrayList<Integer>()  ;
		 Double totalPrice =0.0;
		 for(Cartitem i:cartitems) {
			 cartitemids.add(i.getCartitem_id());			
			 totalPrice+=i.getCake().getPrice();
		 }				 
		 Address address = this.CakeServiceImpl.findAddressById(addressid);
		 UserOrder userOrder = new UserOrder();
		 userOrder.setAddress(address);
		 userOrder.setUser(user);
		 userOrder.setTotalprice(totalPrice);
		 List<OrderDetial> orderdetials = new ArrayList<OrderDetial>();
		 for(Cartitem i:cartitems) {
			 OrderDetial orderDetial = new OrderDetial();
			 orderDetial.setOrder(userOrder);
			 orderDetial.setCake(i.getCake());
			 orderDetial.setCount(i.getCount());
			 orderdetials.add(orderDetial);
		 }
		 userOrder.setOrderdetials(orderdetials);		 
		 this.CakeServiceImpl.addToOrder(userOrder, cartitemids);
		 Map<String,Object> resultMap = new HashMap<String, Object>();
		 resultMap.put("result","SUCCESS");  
		 return resultMap;
	}
	
}
