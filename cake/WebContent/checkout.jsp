<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" import="java.util.*,com.bear.cakeonline.entity.*" %>   
<c:set var="ctx" value="${pageContext.request.contextPath}" />  
<!DOCTYPE html>
<html>
<head>
<title>Checkout</title>
<!-- Custom Theme files -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //Custom Theme files -->
<link href="css/bootstrap.css" type="text/css" rel="stylesheet" media="all">
<link href="css/style.css" type="text/css" rel="stylesheet" media="all">
<!-- js -->
<script src="js/jquery.min.js"></script>

<script type="text/javascript" src="js/bootstrap-3.1.1.min.js"></script>
<!-- //js -->
<!-- cart -->
<script src="js/simpleCart.min.js"> </script>
<!-- cart -->
<script>
			function addToOrder()
			{	
				var obj;
				obj = document.getElementsByName("group");
			    var  check_val = [];			    	        	
			    for(var i=0;i<obj.length;i++){
			        if(obj[i].checked)			        				            				        	
			        	 check_val.push(obj[i].value);		        					        		        				        				        					        					            			        	
			    } 			  			 			   
			 window.location.href="${ctx}/confirmOrder?cartitemid="+check_val;
			}
			function count(c){
				var cd=c;		
				 var num = document.getElementById('count'+c).value;
				 $.ajax({  
				        async:true,  
				        type: "POST",  
				        url: "${ctx}/changeCount.do",//注意路径  
				        data:{cartitemid:cd,count:num},  				       		       
				    });  	
				 //window.location.href="${ctx}/changeCount?cartitemid="+cd+"&count="+num;	
								
			}
			</script>
			
			<script>
			function del(c){
				var cartitemid = c;  
			    //params.XX必须与Spring Mvc controller中的参数名称一致    			   
			    $.ajax({  
			        async:true,  
			        type: "POST",  
			        url: "${ctx}/delcartitem.do",//注意路径  
			        data:{cartitemid:cartitemid},  
			        dataType:"json",  
			        success:function(data){  
			            if(data.result=='SUCCESS'){ 			            
			            	 alert("删除成功");
			                $("#d"+c).remove();//主要就是这个删除成功后移除这行数据 
			               
			            }else{  
			                alert("删除失败，失败原因【" + data + "】");  
			            }  
			        },  			     			       
			    });  	
			}
			$(document).ready(function () {
				 /* $('.close1').on('click', function(){
					$('.cart-header').fadeOut('slow', function(){
						$('.cart-header').remove();
					});
					});	   */ 
					
			    //全选或全不选  
			    $("#all").click(function () {  
			        if (this.checked) {  
			            $("#list :checkbox").attr("checked", true);  
			        } else {  
			            $("#list :checkbox").attr("checked", false);  
			        }  
			    });  
			    //设置全选复选框  
			    $("#list :checkbox").click(function () {  
			        allchk();  
			    });  
			    function allchk() {  
			        var chknum = $("#list :checkbox").size();//选项总个数  
			      //  alert(chknum);
			        var chk = 0;  
			        $("#list :checkbox").each(function () {  
			            if ($(this).attr("checked")) {  
			                chk++;  
			               // alert($(this).attr("id"));
			            }  
			        });
			      //  alert(chknum+";"+chk);
			        if (chknum == chk) {//全选  
			            $("#all").attr("checked", true);  
			        } else {//不全选  
			            $("#all").attr("checked", false);  
			        }  
			    }  
			    //显示时执行一次  
			    allchk();  
			});  				
			</script>
</head>
<body>
	<!--header-->
	<div class="header">
		<div class="container">
			<nav class="navbar navbar-default" role="navigation">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<h1 class="navbar-brand"><a  href="index.jsp">Yummy</a></h1>
				</div>
				<!--navbar-header-->
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li><a href="index.jsp" class="active">首页</a></li>
						<li><a href="products" class="active">全部商品</a>	</li>																																	
					</ul> 
					<!--/.navbar-collapse-->
				</div>
				<!--//navbar-header-->
			</nav>
			<div class="header-info">
				<div class="header-right search-box">
					<a href="#"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></a>				
					<div class="search">
						<form class="navbar-form">
							<input type="text" class="form-control">
							<button type="submit" class="btn btn-default" aria-label="Left Align">
								Search
							</button>
						</form>
					</div>	
				</div>
				<div class="header-right login">
					<a href="#"><span class="glyphicon glyphicon-user" aria-hidden="true"></span></a>
					<% if(session.getAttribute("user")==null)
					{ %>
					
					<div id="loginBox">                
						<form id="loginForm" action="login" method="post">
							<fieldset id="body">
								<fieldset>
									<label for="email">手机号</label>
									<input type="text" name="phonenumber" id="email">
								</fieldset>
								<fieldset>
									<label for="password">密码</label>
									<input type="password" name="password" id="password">
								</fieldset>
								<input type="submit" id="login" value="登陆">
								<label for="checkbox"><input type="checkbox" id="checkbox"> <i>记住我</i></label>
							</fieldset>
							<p>新用户 ？ <a class="sign" href="account.jsp">注册</a> <span><a href="#">忘记密码?</a></span></p>
						</form>
					</div>
					<% }else{ %>
					<div id="loginBox">                
						<form id="loginForm">
							<fieldset id="body">
								<fieldset>
									<label >当前用户：${user.username}</label>									
								</fieldset>													
							</fieldset>                						  
							<p> <a class="sign" href="${ctx}/index.jsp">退出登录</a> <span><a href="${ctx}/index.jsp">切换账号</a></span></p>
						</form>
					</div>
					<%} %>
				</div>
				<div class="header-right cart">
					<a href="#"><span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span></a>
					<div class="cart-box">
						<h4><a href="checkout">
							<span class="simpleCart_total"> $0.00 </span> (<span id="simpleCart_quantity" class="simpleCart_quantity"> 0 </span>) 
						</a></h4>
						<p><a href="javascript:;" class="simpleCart_empty">Empty cart</a></p>
						<div class="clearfix"> </div>
					</div>
				</div>
				<div class="clearfix"> </div>
			</div>
			<div class="clearfix"> </div>
		</div>
	</div>
	<!--//header-->
	<!--cart-items-->
	<div class="cart-items">
		<div class="container" id="list">
			<h2>My Shopping Cart(3)</h2>	
	 		<c:forEach var="cartitem" items="${cartitems}" >	 																								
			        <div class="cart-header" id="d${cartitem.cartitem_id}" >				        					
			        <div class="close1" onclick="del(${cartitem.cartitem_id})"> </div>				
				    <div class="cart-sec simpleCart_shelfItem"  >				    	
					<div class="cart-item cyc">	
					<input id="checkbox${cartitem.cartitem_id}" style="float:top" type="checkbox" name="group" value="${cartitem.cartitem_id }"><i></i>																	
						 <img src="${ctx}/${cartitem.cake.str}" class="img-responsive" alt="">
					</div>
					<div class="cart-item-info">
						<h3><a href="#">${cartitem.cake.name}</a><span>口味：${cartitem.cake.flavor}</span></h3>
						<ul class="qty">
							<li>单价:<p id="price${cartitem.cartitem_id}">${cartitem.cake.price}</p></li>												        
						</ul>
						<ul class="qty">														
					        <li> 数量 :<p >
					        <input min="1" type="number" id="count${cartitem.cartitem_id}" name="quantity" value="${cartitem.count}" class="form-control input-small" onchange="count(${cartitem.cartitem_id})"></p></li>
						</ul>
						<div class="delivery">							
							<div class="clearfix"></div>
						</div>	
					</div>
					<div class="clearfix"></div>					
				</div>
			</div>
		 </c:forEach>
		  全选<input type="checkbox" id="all"/>
<input style="float:right" type="button"  value="去结算" onclick="addToOrder()"/>							  																		
	</div>		   
</div>	
	<!--//checkout-->	
	<!--footer-->
	<div class="footer">
		<div class="container">
			<div class="footer-grids">
				<div class="col-md-2 footer-grid">
					<h4>company</h4>
					<ul>
						<li><a href="products.html">products</a></li>
						<li><a href="#">Work Here</a></li>
						<li><a href="#">Team</a></li>
						<li><a href="#">Happenings</a></li>
						<li><a href="#">Dealer Locator</a></li>
					</ul>
				</div>
				<div class="col-md-2 footer-grid">
					<h4>service</h4>
					<ul>
						<li><a href="#">Support</a></li>
						<li><a href="#">FAQ</a></li>
						<li><a href="#">Warranty</a></li>
						<li><a href="contact.html">Contact Us</a></li>
					</ul>
				</div>
				<div class="col-md-3 footer-grid">
					<h4>order & returns</h4>
					<ul>
						<li><a href="#">Order Status</a></li>
						<li><a href="#">Shipping Policy</a></li>
						<li><a href="#">Return Policy</a></li>
						<li><a href="#">Digital Gift Card</a></li>
					</ul>
				</div>
				<div class="col-md-2 footer-grid">
					<h4>legal</h4>
					<ul>
						<li><a href="#">Privacy</a></li>
						<li><a href="#">Terms and Conditions</a></li>
						<li><a href="#">Social Responsibility</a></li>
					</ul>
				</div>
				<div class="col-md-3 footer-grid icons">
					<h4>Connect with Us</h4>
					<ul>
						<li><a href="#"><img src="images/i1.png" alt=""/>Follow us on Facebook</a></li>
						<li><a href="#"><img src="images/i2.png" alt=""/>Follow us on Twitter</a></li>
						<li><a href="#"><img src="images/i3.png" alt=""/>Follow us on Google-plus</a></li>
						<li><a href="#"><img src="images/i4.png" alt=""/>Follow us on Pinterest</a></li>
					</div>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	<!--footer-->
	<div class="footer-bottom">
		<div class="container">
			<p>Copyright &copy; 2015.Company name All rights reserved.<a target="_blank" href="http://www.17sucai.com/">&#x7F51;&#x9875;&#x6A21;&#x677F;</a></p>
		</div>
	</div>
</body>
</html>