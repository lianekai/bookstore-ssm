<%--
  Created by IntelliJ IDEA.
  User: lianekai
  Date: 2020/7/23
  Time: 18:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%
    String path=request.getContextPath();
    String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Title</title>
<base href="<%=basePath%>"/>
    <script src="<%=basePath%>bootstrap/js/jquery/2.0.0/jquery.min.js"></script>
    <script src="<%=basePath%>bootstrap/js/bootstrap/3.3.6/bootstrap.min.js"></script>
    <link rel="stylesheet" href="<%=basePath%>bootstrap/css/bootstrap/3.3.6/bootstrap.min.css" />
    <script type="text/javascript">
        /*$(function (){
            $("#accid").onclick(
                function () {
                 $.ajax({
                     url:"uc/showaccount",
                     data:{},
                     datatype:"json",
                     type:"post",
                     success:function(data) {
                         $(data).each(function () {
                             //alert(data);
                             var option = $("<option value='"+data.accid+"'>"+data.accid+"</option>")
                             $("#accid").append(option);
                         });
                     },
                     error:function(data){
                         alert("请求失败！")
                     }
                 });
                }
            );
        });*/
        $(function(){
            //$.ajax();
            //$.post();
            //$.get();

            //$.post("路径",{要传递的参数},function(data){回调函数},"返回数据的类型"){}
            $.post("uc/showaccount",
                {},
                function(data){//参数顺序不能颠倒
                    $.each(data,function(i,n){
                        $("#accid").append("<option value='"+n.accid+"'>"+n.accid+"</option>")
                    });
                },
                "json");
        });

        function showbalance(accId){
            $.ajax({
                type:"POST",
                url:"uc/showbalance",
                data:{"accId":accId},
                success:function(data){
                    $("#balanceinfo").html("￥"+data+"元");
                }
            });
        }


    </script>
</head>
<body>
<div class="jumbotron">
<h3 align="center">这里是book_order.jsp页面</h3>
    欢迎你：${sessionScope.myuser.realname}
    <div class="container">
你选择的书籍为：<br/>
        &nbsp; &nbsp;&nbsp;&nbsp;书名：${book.bookName}<br/>
        &nbsp; &nbsp;&nbsp;&nbsp;出版社：${book.publicDept}<br/>
        &nbsp; &nbsp;&nbsp;&nbsp;价格：${book.price}<br/>
        &nbsp; &nbsp;&nbsp;&nbsp;作者：${book.author}<br/>
        &nbsp; &nbsp;&nbsp;&nbsp;封面：<img src="${book.imgPath}" border="1" width="100" /><br/>
        &nbsp; &nbsp;&nbsp;&nbsp;作者：${book.summary}<br/>
        <hr/>
        库存数量：${count}
        <hr/>
        <select name="accid" id="accid" onchange="showbalance(this.value);">
            <option>====请选择一个账号======</option>
        </select>
        你选择的余额为：<span id="balanceinfo"></span>

        <input type="button" value="支付"/>
    </div>
</div>
</body>
</html>
