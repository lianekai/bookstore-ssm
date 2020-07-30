<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!-- 导入标签库 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
  <head>
    <base href="<%=basePath%>">
    <title></title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    <script src="<%=basePath%>bootstrap/js/jquery/2.0.0/jquery.min.js"></script>
    <script src="<%=basePath%>bootstrap/js/bootstrap/3.3.6/bootstrap.min.js"></script>
    <link rel="stylesheet" href="<%=basePath%>bootstrap/css/bootstrap/3.3.6/bootstrap.min.css" />
	<script type="text/javascript">
		function login(){
			 var loginname = $.trim($("#loginname").val());
			 console.log(loginname);
		      var loginpwd = $.trim($("#loginpwd").val());
		      console.log(loginpwd);
		      if(loginname == ""){
		            alert("请输入用户名");
		            return false;
		        }else if(loginpwd == ""){
		            alert("请输入密码");
		            return false;
		        }
		    //ajax去服务器端校验
		      var data= {loginname:loginname,loginpwd:loginpwd};
		      $.ajax({
		            type:"POST",
		            url:'lc/login',
		            data:data,
		            dataType:'json',
		            success:function(data){
		                   if(data.flag){		                	   
		                	   location.href="fpc/finddata"
		                   }
		                   else{
		                       alert("没有该用户！！") 
		                }
		            },
				  	error:function(data){
						alert("请求异常，请重新请求！")
					}
		        });
			};
	</script>
	<style type="text/css">
		body {
			background:url(images/login/login2.gif) #f8f6e9;
			}
			.mycenter{
			margin-top: 100px;
			margin-left: auto;
			margin-right: auto;
			height: 350px;
			width:500px;
			padding: 5%;
			padding-left: 5%;
			padding-right: 5%;
			}
			.mycenter mysign{
			width: 440px;
			}
			.mycenter input,checkbox,button{
			margin-top:2%;
			margin-left: 10%;
			margin-right: 10%;
			}
			.mycheckbox{
			margin-top:10px;
			margin-left: 40px;
			margin-bottom: 10px;
			height: 10px;
			}
	</style>
  </head>
  <body>
  		
  		<div class="mycenter">
			<div class="mysign">
				<div class="col-lg-11 text-center text-info">
		<h3>欢迎登录</h3>
		</div>
		<div class="col-lg-10">
  			<input type="text" class="form-control" name="loginname" id="loginname" placeholder="请输入账户名"/><br/>
  			
  		</div>
  		
  		<div class="col-lg-10"></div>
		<div class="col-lg-10">
  			<input type="password" class="form-control" name="loginpwd" id="loginpwd" placeholder="请输入 密码"/><br/>
 		</div>
 		
 		<div class="col-lg-10"></div>
		<div class="col-lg-10">
 			<button  onclick="login()" class="btn btn-success col-lg-12" type="button">登录</button>
 			</div>
		</div>
	</div>

  </body>
</html>
