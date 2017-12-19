<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" import="java.util.*,com.bear.cakeonline.entity.*" %>   
<c:set var="ctx" value="${pageContext.request.contextPath}" />    
<!DOCTYPE html>
<html>
<head>
<title>Home</title>
<!-- Custom Theme files -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //Custom Theme files -->
<link href="${ctx}/css/bootstrap.css" type="text/css" rel="stylesheet" media="all">
<link href="${ctx}/css/style.css" type="text/css" rel="stylesheet" media="all">
<!-- js -->
<script src="${ctx}/js/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/js/bootstrap-3.1.1.min.js"></script>
<!-- //js -->	
<!-- cart -->
<script src="${ctx}js/simpleCart.min.js"> </script>
<!-- cart -->
<script>
$(document).ready(function () {
				var aImg=document.getElementById("data1").getElementsByTagName("img");
                for(var i=0;i<aImg.length;i++){
             	aImg[i].style.height="373px";
      			aImg[i].style.width="760px";
       			}	
       			var aImg2=document.getElementById("data2").getElementsByTagName("img");
                for(var i=0;i<aImg2.length;i++){
             	aImg2[i].style.height="373px";
      			aImg2[i].style.width="760px";
       			}			 
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
							<p> <a class="sign" href="logout">退出登录</a> <span><a href="${ctx}/index.jsp">切换账号</a></span></p>
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
	<!--banner-->
	
	<div class="banner">
		<div class="container">
			<h2 class="hdng">Yummy <span>Cakes</span> for u</h2>
			<p>Our best cakes make your day special</p>
			<a href="products">SHOP NOW</a>
			<div class="banner-text">			
				<img src="${ctx}/images/2.png" alt=""/>	
			</div>
		</div>
	</div>
			
	<!--//banner-->
	<!--gallery-->
	<div class="gallery">
		<div class="container">
			<div class="gallery-grids">
			<c:forEach var="data1" items="${datas1 }">
				<div id="data1" class="col-md-8 gallery-grid glry-one">
					<a href="products"><img src="${ctx}/${data1.str}" class="img-responsive" alt=""/>
						<div class="gallery-info">
							<p><span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span> view</p>
							<a class="shop" href="single?cake_id=${data1.cake_id}">SHOP NOW</a>
							<div class="clearfix"> </div>
						</div>
					</a>
					<div class="galy-info">
						<p>${data1.name}</p>
						<div class="galry">
							<div class="prices">
								<h5 class="item_price">${data1.price}</h5>
							</div>
							<div class="rating">
								<span>☆</span>
								<span>☆</span>
								<span>☆</span>
								<span>☆</span>
								<span>☆</span>
							</div>						
							<div class="clearfix"></div>
						</div>
					</div>
				</div>
				</c:forEach>
				<c:forEach var="data2" items="${datas2}">
				<div id="data2" class="col-md-4 gallery-grid glry-two">
					<a href="products"><img src="${ctx}/${data2.str}" class="img-responsive" alt=""/>
						<div class="gallery-info galrr-info-two">
							<p><span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span> view</p>
							<a class="shop" href="single?cake_id=${data2.cake_id}">SHOP NOW</a>
							<div class="clearfix"> </div>
						</div>
					</a>
					<div class="galy-info">
						<p>${data2.name}</p>
						<div class="galry">
							<div class="prices">
								<h5 class="item_price">${data2.price}</h5>
							</div>
							<div class="rating">
								<span>☆</span>
								<span>☆</span>
								<span>☆</span>
								<span>☆</span>
								<span>☆</span>
							</div>						
							<div class="clearfix"></div>
						</div>
					</div>
				</div>
				</c:forEach>
				<c:forEach var="data3" items="${datas3}">
				<div class="col-md-3 gallery-grid ">
					<a href="products"><img src="${ctx}/${data3.str}" class="img-responsive" alt=""/>
						<div class="gallery-info">
							<p><span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span> view</p>
							<a class="shop" href="single?cake_id=${data3.cake_id}">SHOP NOW</a>
							<div class="clearfix"> </div>
						</div>
					</a>
					<div class="galy-info">
						<p>${data3.name}</p>
						<div class="galry">
							<div class="prices">
								<h5 class="item_price">${data3.price}</h5>
							</div>
							<div class="rating">
								<span>☆</span>
								<span>☆</span>
								<span>☆</span>
								<span>☆</span>
								<span>☆</span>
							</div>						
							<div class="clearfix"></div>
						</div>
					</div>
				</div>
				</c:forEach>
				</div>
			</div>	
		</div>
	</div>
	<!--//gallery-->
	<!--subscribe-->
	<div class="subscribe">
		 <div class="container">
			 <h3>Newsletter</h3>
			 <form>
				 <input type="text" class="text" value="Email" onFocus="this.value = '';" onBlur="if (this.value == '') {this.value = 'Email';}">
				 <input type="submit" value="Subscribe">
			 </form>
		 </div>
	</div>
	<!--//subscribe-->
	<!--footer-->
	<div class="footer">
		<div class="container">
			<div class="footer-grids">
				<div class="col-md-2 footer-grid">
					<h4>company</h4>
					<ul>
						<li><a href="products">products</a></li>
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
						<li><a href="#"><img src="${ctx}/images/i1.png" alt=""/>Follow us on Facebook</a></li>
						<li><a href="#"><img src="${ctx}/images/i2.png" alt=""/>Follow us on Twitter</a></li>
						<li><a href="#"><img src="${ctx}/images/i3.png" alt=""/>Follow us on Google-plus</a></li>
						<li><a href="#"><img src="${ctx}/images/i4.png" alt=""/>Follow us on Pinterest</a></li>
					</div>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	<!--//footer-->
	<div class="footer-bottom">
		<div class="container">
			<p>Copyright &copy; 2015.Company name All rights reserved.<a target="_blank" href="http://www.17sucai.com/">&#x7F51;&#x9875;&#x6A21;&#x677F;</a></p>
		</div>
	</div>
</body>
</html>