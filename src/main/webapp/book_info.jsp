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
    function buybook(bookid) {
        location="bc/buybook?bookid="+bookid;
    }
</script>
</head>
<body>
<div class="jumbotron">

<h3 align="center">这里是book_info.jsp页面</h3>
    <div class="container">
        <h4>书籍信息:</h4><br/><br/>
书名：${book.bookName}<br/>
出版社：${book.publicDept}<br/>
作者：${book.author}<br/>
价格：${book.price}<br/>
出版日期：${book.publicDate}<br/>
图片：<img src="${book.imgPath}" width="100"><br/>
简洁:<br/><textarea rows="6" cols="50">
    ${book.summary}
</textarea>
        <br/>
        <input type="button" class="btn btn-success" value="立即购买" onclick="buybook('${book.bookid}');"/>
        </div>


</div>
</body>
</html>
