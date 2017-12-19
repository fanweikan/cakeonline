<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" import="java.util.*,com.bear.cakeonline.entity.*" %>   
<c:set var="ctx" value="${pageContext.request.contextPath}" />  
<!DOCTYPE html>
<html>
<head>
<title>Products</title>
<!-- Custom Theme files -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<script type="application/x-javascript">	
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 
    function addToCart(c){	
	var username;
	username = "${user.username}";	
	if(username!= ""){
	    var cakeid=c;
		var count=document.getElementById("count"+c).value;	 
		if (/(^[1-9]\d*$)/.test(count)) { 		　　　　　 	    		
	 $.ajax({
		    async:true, 
	        type: "POST",  
	        url: "${ctx}/cart.do",//注意路径  
	        data:{cakeid:cakeid,count:count},  
	        dataType:"json", 					      
	        success:function(data){ 				        						           		            
	            	 alert("添加购物车成功");	            	 	
	            },					        
	        error:function(data){
	        	alert("添加购物车失败，失败原因【未登录】");
	        }					       
	    });  
	   }else{  
	        alert("数量中请输入正整数！"); 	      
	    }
	} 
	else{
		alert("请先登录！");		
	} 
}	
</script>
<!-- <script type="text/javascript">
 function myCheck()
      {
        for(var i=0;i<document.form1.elements.length-1;i++)
        {
         if(document.form1.elements[i].value=="")
         {
           alert("当前表单不能有空项");
           document.form1.elements[i].focus();
           return false;
         }
        }
        return true;
  </script> -->
<!-- //Custom Theme files -->
<link href="${ctx}/css/bootstrap.css" type="text/css" rel="stylesheet"
	media="all">
<link href="${ctx}/css/style.css" type="text/css" rel="stylesheet"
	media="all">
<link href="${ctx}/css/form.css" rel="stylesheet" type="text/css"
	media="all" />
<!-- js -->
<script src="${ctx}/js/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/js/bootstrap-3.1.1.min.js"></script>
<!-- //js -->
<!-- cart -->
<script src="${ctx}/js/simpleCart.min.js"></script>
<script src="${ctx}/js/jquery-1.6.js"></script>
	
</script>
<!-- cart -->
<!-- the jScrollPane script -->
<script type="text/javascript" src="${ctx}/js/jquery.jscrollpane.min.js"></script>
<script type="text/javascript" id="sourcecode">
	$(function() {
		$('.scroll-pane').jScrollPane();
	});
</script>

<!-- the mousewheel plugin -->
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
	<!--products-->
	
		<div class="products">
			<div class="container">
				<h2>Our Products</h2>
				<div class="col-md-9 product-model-sec">
					<c:if
						test="${(pageModel.datas != null) && (!empty pageModel.datas)}">
						<c:forEach var="cake" items="${pageModel.datas}">
							<div class="product-grid">
									<div class="more-product">
										<span> </span>
									</div>
									<div class="product-img b-link-stripe b-animate-go  thickbox">
										<img src="${ctx}/${cake.str}" class="img-responsive" alt="">
										<div class="b-wrapper">
											<h4 class="b-animate b-from-left  b-delay03">
												<button onclick="window.location.href='${ctx}/single?cake_id=${cake.cake_id}'">View</button>
											</h4>
										</div>
									</div>
								<div class="product-info simpleCart_shelfItem">
									<div class="product-info-cust prt_name">
										<h4>${cake.name}</h4>
										<span class="item_price">${cake.price}元</span> 
											<input type="text" class="item_quantity" id="count${cake.cake_id}" value="1" /> 
										<input type="button" class="item_add items" onclick="addToCart(${cake.cake_id})" value="Add">
										<div class="clearfix"></div>
									</div>
								</div>
							</div>
						</c:forEach>
					</c:if>
					</div>
			<form action="pageselect" method="post">
				<div class="col-md-3 rsidebar span_1_of_left">				
					<!---->
					<script type="text/javascript" src="${ctx}/js/jquery-ui.min.js"></script>
					<link rel="stylesheet" type="text/css"
						href="${ctx}/css/jquery-ui.css">
					<!---->
					<section class="sky-form">
						<h4>
							<span class="glyphicon glyphicon-minus" aria-hidden="true"></span>口味
						</h4>
						<div class="row row1 scroll-pane">

							<div class="col col-4">
								<c:forEach var="flavor" items="${flavors}">
									<label class="checkbox">		
							        <input type="checkbox"	name="flavor" value="${flavor.flavorName}"><i></i>${flavor.flavorName}</label>
								</c:forEach>
							</div>
						</div>
					</section>
					<section class="sky-form">
						<h4>
							<span class="glyphicon glyphicon-minus" aria-hidden="true"></span>尺寸
						</h4>
						<div class="row row1 scroll-pane">
							<div class="col col-4">
								<label class="checkbox">
									<input type="checkbox" name="size" value="5"><i></i>5寸</label> 
									<label class="checkbox">
									<input type="checkbox" name="size" value="6"><i></i>6寸</label> 
									<label class="checkbox">
									<input type="checkbox" name="size" value="7"><i></i>7寸</label>
								    <label class="checkbox">
								    <input type="checkbox" name="size" value="8,9,10"><i></i>7寸以上</label>									
							</div>
						</div>
					</section>
					<section class="sky-form">
						<h4>
							<span class="glyphicon glyphicon-minus" aria-hidden="true"></span>层数
						</h4>
						<div class="row row1 scroll-pane">
							<div class="col col-4">
								<label class="checkbox">
								<input type="checkbox" name="tier" value="1"><i></i>一层</label>
							    <label class="checkbox">
							    <input type="checkbox" name="tier" value="2"><i></i>两层</label> 
							    <label class="checkbox">
							    <input type="checkbox" name="tier" value="3"><i></i>两层以上</label>									
							</div>
						</div>
					</section>
					<section class="sky-form">
						<input type="submit"  value="开始查找" onclick="myCheck()">
					</section>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>			
	</td>
	</tr>
	</table>
	</div>
	<!-- 分页 -->
					<div style="text-align: right;text-align: bottom;">
						
						<span style="margin-top: 10px;">
						
							共有${pageModel.totals }条数据，共${pageModel.pageCount }页，
							当前是第${pageModel.currPage}/${pageModel.pageCount }页 </span> <br /> 
							
							
							<a href="${ctx}/products?currPage=1">首页</a>
						<%--如果当前页为第一页时，就没有上一页这个超链接显示 --%>
						<c:if test="${pageModel.currPage ==1}">
							<c:forEach begin="${pageModel.start}" end="${pageModel.end}"
								step="1" var="i">
								<c:if test="${pageModel.currPage == i}">
                        ${i}
                    </c:if>
								<c:if test="${pageModel.currPage != i}">
									<a href="${ctx}/products?currPage=${i}">${i}</a>
								</c:if>
							</c:forEach>
							<a href="${ctx}/products?currPage=${pageModel.currPage+1}">下一页</a>
						</c:if>

						<%--如果当前页不是第一页也不是最后一页，则有上一页和下一页这个超链接显示 --%>
						<c:if
							test="${pageModel.currPage > 1 && pageModel.currPage < pageModel.pageCount}">
							<a href="${ctx}/products?currPage=${pageModel.currPage-1}">上一页</a>
							<c:forEach begin="${pageModel.start}" end="${pageModel.end}"
								step="1" var="i">
								<c:if test="${pageModel.currPage == i}">
                        ${i}
                    </c:if>
								<c:if test="${pageModel.currPage != i}">
									<a href="${ctx}/products?currPage=${i}">${i}</a>
								</c:if>
							</c:forEach>
							<a href="${ctx}/products?currPage=${pageModel.currPage+1}">下一页</a>
						</c:if>

						<%-- 如果当前页是最后一页，则只有上一页这个超链接显示，下一页没有 --%>
						<c:if
							test="${pageModel.currPage == pageModel.pageCount && pageModel.currPage !=1}">
							<a href="${ctx}/products?currPage=${pageModel.currPage-1}">上一页</a>
							<c:forEach begin="${pageModel.start}" end="${pageModel.end}"
								step="1" var="i">
								<c:if test="${pageModel.currPage == i}">
                        ${i}
                    </c:if>
								<c:if test="${pageModel.currPage != i}">
									<a href="${ctx}/products?currPage=${i}">${i}</a>
								</c:if>
							</c:forEach>
						</c:if>
						<%--尾页 --%>
						<a href="${ctx}/products?currPage=${pageModel.pageCount}">尾页</a>
					</div>
	</form>			
	<!--//products-->
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
						<li><a href="#"><img src="${ctx}/images/i1.png" alt="" />Follow
								us on Facebook</a></li>
						<li><a href="#"><img src="${ctx}/images/i2.png" alt="" />Follow
								us on Twitter</a></li>
						<li><a href="#"><img src="${ctx}/images/i3.png" alt="" />Follow
								us on Google-plus</a></li>
						<li><a href="#"><img src="${ctx}/images/i4.png" alt="" />Follow
								us on Pinterest</a></li>
				</div>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
	</div>
	<!--//footer-->
	<div class="footer-bottom">
		<div class="container">
			<p>
				Copyright &copy; 2015.Company name All rights reserved.<a
					target="_blank" href="http://www.17sucai.com/">&#x7F51;&#x9875;&#x6A21;&#x677F;</a>
			</p>
		</div>
	</div>
</body>
</html>