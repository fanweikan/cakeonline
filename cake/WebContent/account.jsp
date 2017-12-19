<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" import="java.util.*,com.bear.cakeonline.entity.*" %>   
<c:set var="ctx" value="${pageContext.request.contextPath}" />  
<!DOCTYPE html>
<html>
<head>
<title>Account</title>
<!-- Custom Theme files -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<script type="application/x-javascript">
 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 
 /*是否带有小数*/
 function    isDecimal(strValue )  {  
    var  objRegExp= /^\d+\.\d+$/;
    return  objRegExp.test(strValue);  
 }  

 /*校验是否中文名称组成 */
 function ischina(str) {
 	var reg=/^[\u4E00-\u9FA5]{2,4}$/;   /*定义验证表达式*/
 	return reg.test(str);     /*进行验证*/
 }

 /*校验是否全由8位数字组成 */
 function isStudentNo(str) {
 	var reg=/^[0-9]{8}$/;   /*定义验证表达式*/
 	return reg.test(str);     /*进行验证*/
 }

 /*校验电话码格式 */
 function isTelCode(str) {
 	var reg= /^((0\d{2,3}-\d{7,8})|(1[3584]\d{9}))$/;
 	return reg.test(str);
 }

 /*校验邮件地址是否合法 */
 function IsEmail(str) {
 	var reg=/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(\.[a-zA-Z0-9_-])+/;
 	return reg.test(str);
 }


 function  fun1(){
 	/*if(!isStudentNo(document.getElementById("sno").value)){
 		alert("学生编号是8位数字");
 		document.getElementById("sno").focus();
 		return false;
 	}*/

 	if(!ischina(document.getElementById("username").value)){
 		alert("用户姓名必须填写中文");
 		document.getElementById("username").focus();
 		return false;  
 	}
 	
 	if((document.getElementById("password").value)!=(document.getElementById("repassword").value)){
 		alert("两次输入密码不一致");
 		document.getElementById("password").focus();
 		return false;  
 	}

 	/*if(!IsEmail(document.getElementById("email").value)){
 		alert("邮箱地址错误");
 		document.getElementById("email").focus();
 		return false;  
 	}*/

 	if(!isTelCode(document.getElementById("tel").value)){
 		alert("电话号码不对");
 		document.getElementById("tel").focus();
 		return false;  
 	}

 	/*运行到这里说明验证通过返回true    submit提交按钮起作用提交表单*/
 	alert("提交成功")
 	return true;
 }
</script>
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
									<input type="password" name="password" id="password1">
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
	<!--account-->
	<div class="account">
		<div class="container">
			<div class="register">
			  
				<form  name="myform" action="regist" method="post" onsubmit="return fun1()"> 
					<div class="register-top-grid">
						<h3>个人信息</h3>
						<div class="input">
							<span>真实姓名<label>*</label></span>
							<input type="text" id="username" name="username" value="${user.username }" required="required" > 
							
						</div>
						<div class="input">
							<span>手机号<label>*</label></span>
							<input type="text" maxlength=11 id="tel" name="phonenumber" value="${ user.phonenumber}" required="required"> 
						</div>
						<div class="input">
							<span>收货地址<label>*</label></span>
							<input type="text" name="address" value="${address.address}" required="required">  
						</div>
						
						
					</div>
				    <div class="register-bottom-grid">
						<h3>登录信息</h3>
						<div class="input">
							<span>设置密码<label>*</label></span>
							<input type="password" name="password" id="password" value="${user.password}">
						</div>
						<div class="input">
							<span>确认密码<label>*</label></span>
							<input type="password" id="repassword" name="repassword">
						</div>
					</div>
					 <input type="submit" value="submit">
					   <div class="clearfix"> </div>
				</form>
				<div class="clearfix"> </div>
				<div class="register-but">
				 
				</div>
			</div>
	    </div>
	</div>
	<!--//account-->
	<!--footer-->
	<div class="footer">
		<div class="container">
			<div class="footer-grids">
				<div class="col-md-2 footer-grid">
					<h4>company</h4>
					<ul>
						<li><a href="products.jsp">products</a></li>
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