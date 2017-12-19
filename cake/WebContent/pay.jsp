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

	
</script>
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
<script src="${ctx}/js/simpleCart.min.js">
	
</script>

</script>
<link rel="stylesheet" type="text/css" href="css/style.css">
		<link rel="stylesheet" type="text/css" href="css/css.css" />
		<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
		<script type="text/javascript">
			$(function() {
				var region = $("#region");
				var address = $("#address");
				var number_this = $("#number_this");
				var name = $("#name_");
				var phone = $("#phone");
				$("#sub_setID").click(function() {
					var input_out = $(".input_style");
					for (var i = 0; i <= input_out.length; i++) {
						if ($(input_out[i]).val() == "") {
							$(input_out[i]).css("border", "1px solid red");
							
							return false;
						} else {
							$(input_out[i]).css("border", "1px solid #cccccc");
						}
					}
				});
				var span_momey = $(".span_momey");
				var count=$(".count");
				var b = 0;
				for (var i = 0; i < span_momey.length; i++) {
					b += parseFloat($(span_momey[i]).html()*$(count[i]).html());
				}
				var out_momey = $(".out_momey");
				out_momey.html(b);
				$(".shade_content").hide();
				$(".shade").hide();
				$('.nav_mini ul li').hover(function() {
					$(this).find('.two_nav').show(100);
				}, function() {
					$(this).find('.two_nav').hide(100);
				})
				$('.left_nav').hover(function() {
					$(this).find('.nav_mini').show(100);
				}, function() {
					$(this).find('.nav_mini').hide(100);
				})
				$('#jia').click(function() {
					$('input[name=num]').val(parseInt($('input[name=num]').val()) + 1);
				})
				$('#jian').click(function() {
					$('input[name=num]').val(parseInt($('input[name=num]').val()) - 1);
				})
				  $('.Caddress .add_mi').click(function() {
					$(this).css('background', 'url("images/mail_1.jpg") no-repeat').siblings('.add_mi').css('background', 'url("images/mail.jpg") no-repeat');
					addressid = $(this).attr("id");					
				})  
				$('.btn_closing').click(function() {					
					 $.ajax({
						    async:true, 
					        type: "POST",  
					        url: "${ctx}/addToOrder.do",//注意路径  
					        data:{addressid:addressid},  
					        dataType:"json", 					      
					        success:function(data){ 				        						           		            
					            	 alert("下单成功，返回产品页");
					            	 window.location.href="${ctx}/products";	
					            },					        
					        error:function(data){
					        	alert("下单失败，失败原因【" + data + "】");
					        }					       
					    });  	
				});										   				   				
			})
			var x = Array();
														
			function func(a, b) {
				x[b] = a.html();
				alert(x)
				a.css('border', '2px solid #f00').siblings('.min_mx').css('border', '2px solid #ccc');
			}

			function onclick_close() {
				var shade_content = $(".shade_content");
				var shade = $(".shade");
				if (confirm("确认关闭么！此操作不可恢复")) {
					shade_content.hide();
					shade.hide();
				}
			}

			function onclick_open() {
				$(".shade_content").show();
				$(".shade").show();
				var input_out = $(".input_style");
				for (var i = 0; i <= input_out.length; i++) {
					if ($(input_out[i]).val() != "") {
						$(input_out[i]).val("");
					}
				}
			}								
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
	<body>		
		<!-- 搜索区域开始 -->		
		<div class="Caddress">
			<div class="open_new">
				<button class="open_btn" onclick="javascript:onclick_open();">使用新地址</button>
			</div>
			<c:forEach var="Address" items="${addresses}" >
			<div class="add_mi"  id="${Address.addressid}">				
				<p style="border-bottom:1px dashed #ccc;line-height:28px;">${Address.consignee_name}收</p>
				<p>${Address.consignee_address} ${Address.consignee_phone}</p>
			</div>
			</c:forEach>						
		</div>

		<!--
        	作者：z@163.com
        	时间：2016-03-04
        	描述：商品内容
        -->
		<div class="shopping_content">
			<div class="shopping_table">
				<table border="1" bordercolor="#cccccc" cellspacing="0" cellpadding="0" style="width: 100%; text-align: center;">
					<tr>
						<th>商品图片</th>
						<th>商品名称</th>
						<th>商品属性</th>
						<th>商品价格</th>
						<th>商品数量</th>
						
					</tr>
					<c:forEach var="cartitem" items="${cartitems}">
					<tr>
						<td>
							<a><img src="${cartitem.cake.str}" /></a>
						</td>
						<td><span>${cartitem.cake.name}</span></td>
						<td>
							<div class="">
								<span id="">口味</span>：<span>${cartitem.cake.flavor}</span>
							</div>
							<div class="">
								<span id="">层数</span>：<span>${cartitem.cake.tier}</span>
							</div>
							<div class="">
								<span id="">尺寸</span>：<span>${cartitem.cake.size}</span>
							</div>
						</td>
						<td>
							<span class="span_momey">${cartitem.cake.price }</span>
						</td>
						<td>							
							<span class="count">${cartitem.count }	</span>						
						</td>						
					</tr>
				</c:forEach>
					
					
					
				</table>
				<div class="" style="width: 100%; text-align: right; margin-top: 10px;">
					<div class="div_outMumey" style="float: left;">
						总价：<span class="out_momey"></span>
					</div>
					<button class="btn_closing">立即下单</button>
				</div>
			</div>
		</div>

		<!--
        	作者：z@163.com
        	时间：2016-03-01
        	描述：shade 遮罩层
        -->
		<div class="shade">
		</div>
		<!--
        	作者：z@163.com
        	时间：2016-03-02
        	描述：shade_content
        -->
		<div class="shade_content">
			<div class="col-xs-12 shade_colse">
				<button onclick="javascript:onclick_close();">x</button>
			</div>
			<div class="nav shade_content_div">
				<div class="col-xs-12 shade_title">
					新增收货地址
				</div>
				<div class="col-xs-12 shade_from">
					<form action="newAddress" method="post">
						
						<div class="col-xs-12">
							<span class="span_style" id="">详细地址</span>
							<input class="input_style" type="text" name="consignee_address" id="address" value="" placeholder="&nbsp;&nbsp;请输入您的详细地址" />
						</div>
						
						<div class="col-xs-12">
							<span class="span_style" class="span_sty" id="">收货人姓名</span>
							<input class="input_style" type="text" name="consignee_name" id="name_" value="" placeholder="&nbsp;&nbsp;请输入您的姓名" />
						</div>
						<div class="col-xs-12">
							<span class="span_style" id="">手机号码</span>
							<input class="input_style" type="text" name="consignee_phone" id="phone" value="" placeholder="&nbsp;&nbsp;请输入您的手机号码" />
						</div>
						<div class="col-xs-12">
							<input class="btn_remove" type="button" id="" onclick="javascript:onclick_close();" value="取消" />
							<input type="submit" class="sub_set" id="sub_setID" value="提交" />
						</div>
					</form>
				</div>
			</div>
		</div>

		<!-- 底部开始 -->
		<div id="down">
			<div class="down_top">
				<a href="#">关于我们</a>
				<a href="#">联系我们</a>
				<a href="#">商家入驻</a>
				<a href="#">营销中心</a>
				<a href="#">手机商城</a>
				<a href="#">友情链接</a>
				<a href="#">销售联盟</a>
				<a href="#">商城社区</a>
				<a href="#">商城公益</a>
				<a href="#" style="border-right:none">English Site</a>
			</div>
			<div class="down_center">
				<span>北京市公安局朝阳分局备案编号110105014669  |  京ICP证070359号  |  <a href="#">互联网药品信息服务资格证编号(京)-经营性-2014-0008</a>  |  新出发京零 字第大120007号</span>
				<span><a href="#">音像制品经营许可证苏宿批005号</a>  |  出版物经营许可证编号新出发(苏)批字第N-012号  |  互联网出版许可证编号新出网证(京)字150号</span>
				<span><a href="#">网络文化经营许可证京网文[2011]0168-061号</a>  违法和不良信息举报电话：4006561155  Copyright © 2004-2014  商城JD.com 版权所有</span>
				<span>商城旗下网站：<a href="#">360TOP</a><a href="#">拍拍网</a><a href="#">网银在线</a></span>
			</div>
			<div class="down_bot">
				<img src="images/bot1.gif" alt="" />
				<img src="images/bot2.gif" alt="" />
				<img src="images/bot3.png" alt="" />
				<img src="images/bot4.png" alt="" />
			</div>
		</div>
		<!-- 底部结束 -->
	</body>

</html>