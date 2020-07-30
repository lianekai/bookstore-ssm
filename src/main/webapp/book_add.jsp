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
    <script language="javascript" type="text/javascript" src="<%=basePath%>js/My97DatePicker/WdatePicker.js" ></script>
    <style type="text/css">
        #book{
            width: 15em;
        }
        #publicDept{
            width: 15em;
        }
        #publicDate{
            width: 15em;
        }
        #author{
            width: 15em;
        }
        #summary{
            width: 50em;
        }
        #price{
            width: 15em;
        }
        #pic{
            width: 15em;
        }

    </style>

</head>
<body>
<div class="jumbotron">
<h3 align="center">这里是book_add.jsp页面</h3>
    <div class="container">
<form action="/bc/addbook" method="post" enctype="multipart/form-data">
    <div class="input-group input-group">
    <span class="input-group-addon" id="basic-addon1">书名</span>
    <input name="bookName" type="text" class="form-control" id="book" placeholder="书名" aria-describedby="basic-addon1">
    </div>
    <div class="input-group input-group">
    <span class="input-group-addon" id="basic-addon2">出版社</span>
    <input type="text" class="form-control" id="publicDept" name="publicDept" placeholder="出版社" aria-describedby="basic-addon2">
</div>
    <div class="input-group input-group">
        <span class="input-group-addon" id="basic-addon3">价格</span>
        <input type="text" class="form-control" id="price" name="price" placeholder="价格" aria-describedby="basic-addon3">
    </div>

    <div class="input-group input-group">
        <span class="input-group-addon" id="basic-addon4">出版日期</span>
        <input name="publicDate" type="text" class="form-control" id="publicDate" onclick="WdatePicker({'dateFmt':'yyyy-MM-dd'})" readonly="readonly" placeholder="出版日期"  aria-describedby="basic-addon4">
    </div>
    <div class="input-group input-group">
        <span class="input-group-addon" id="basic-addon5">作者</span>
        <input type="text" class="form-control" id="author" name="author" placeholder="作者" aria-describedby="basic-addon5">
    </div>
    <div class="input-group input-group">
        <span class="input-group-addon" id="basic-addon6">图片</span>
        <input type="file" class="form-control" id="pic" name="pic" placeholder="图片" aria-describedby="basic-addon6">
    </div>
    <textarea  class="form-control" cols="50" rows="6" id="summary" name="summary" placeholder="简介"></textarea>
    <input type="submit" class="btn btn-success" value="提交">
</form>
    </div>
</div>
</body>
</html>
