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
<base href="<%=basePath %>"/>
<script src="<%=basePath%>bootstrap/js/jquery/2.0.0/jquery.min.js"></script>
<script src="<%=basePath%>bootstrap/js/bootstrap/3.3.6/bootstrap.min.js"></script>
<link rel="stylesheet" href="<%=basePath%>bootstrap/css/bootstrap/3.3.6/bootstrap.min.css" />
    <style type="text/css">
        .on{
            text-decoration: none;
            font-size: 18px;
            color: #b92c28;
        }
        .off{
            text-decoration: none;
            font-size: 14px;
        }
        #bn1{
            width: 10em;
        }
        #dn1{
            width: 10em;
        }
        #au{
            width: 10em;
        }

    </style>
    <script type="text/javascript">
    function gopage(nowpage){
        var allpage=parseInt(document.getElementById("allpage").value);
        if(parseInt(nowpage)<1){alert("已经是第一页了哦！");}
        else if(parseInt(nowpage)>allpage){alert("已经是最后一页了哦！");}
        else{
            splitform.cp.value=nowpage;
            splitform.submit();
        }
    }
    function toAdd() {
        location.href="/bc/addbook";
    }

</script>
</head>
<body>
<div class="jumbotron">
<h3 style="font-family:宋体;font-weight:bold;font-size:40px" align="center">这里是main.jsp页面</h3>
<form  name="splitform" action="/fpc/finddata" method="post">
    <input type="hidden" value="${allpage}" name="allpage" id="allpage"/>
    <input type="hidden" value="${count}" name="count" id="count"/>
    <input type="hidden" value="${cp}" name="cp" id="cp"/>
<div class="container">
    书名：<input type="text" value="${bookname}" name="bookname" class="form-control" id="bn1"/>
    出版社：<input type="text" value="${deptname}" name="deptname" class="form-control" id="dn1"/>
    作者：<input type="text" value="${author}" name="author" class="form-control" id="au"/>
    价格：<input type="text" value="${loprice}" name="loprice"  />-<input type="text" value="${hiprice}" name="hiprice"/>
    <input type="button" value="查询" class="btn btn-primary" onclick="gopage('1');"/>
    <br/>
</div>
    <div class="container">
<table id="tb" width="1000" border="1" cellspacing="0" class="table table-hover">
    <thead>
        <th>请选择</th>
        <th>书名</th>
        <th>出版社</th>
        <th>作者</th>
        <th>出版时期</th>
        <th>简介</th>
        <th>操作</th>
    </thead>
    <c:forEach items="${booklist}" var="bl">
    <tbody>
        <tr>
            <td>
            <input type="checkbox" value="${bl.bookid}" name="bookid"/>
        </td>
            <td><a href="/bc/showbook?bookid=${bl.bookid}">${bl.bookName}</a></td>
            <td>${bl.publicDept}</td>
            <td>${bl.author}</td>
            <td><fmt:formatDate value="${bl.publicDate}" pattern="yyyy-MM-dd"/></td>
            <td>
                ${fn:substring(bl.summary,0,20)}${fn:length(bl.summary)>20?"...z":""}
            </td>
        </tr>
    </tbody>
    </c:forEach>
</table>
    <nav>
    <ul class="pagination">
        <li>
            <a onclick="gopage('${cp-1}');" aria-label="Previous">
                <span aria-hidden="true">&laquo;</span>
            </a>
        </li>
    <c:if test="${cp-3>0}">
        <li><a class="off" href="javascript:void(0);">...</a></li>
    </c:if>
    <c:if test="${cp-2>0}">
        <li><a class="off" href="javascript:gopage('${cp-2}');">${cp-2}</a></li>
    </c:if>
    <c:if test="${cp-1>0}">
        <li><a class="off" href="javascript:gopage('${cp-1}');">${cp-1}</a></li>
    </c:if>
        <li><a class="on" href="javascript:gopage('${cp}');">${cp}</a></li>
    <c:if test="${cp<allpage}">
        <li> <a class="off" href="javascript:gopage('${cp+1}');">${cp+1}</a></li>
    </c:if>
    <c:if test="${cp+1<allpage}">
        <li><a class="off" href="javascript:gopage('${cp+2}');">${cp+2}</a></li>
    </c:if>
    <c:if test="${cp+2<allpage}">
        <li><a class="off" href="javascript:void(0);">...</a></li>
    </c:if>
        <li>
            <a onclick="gopage('${cp+1}');" aria-label="Next">
                <span aria-hidden="true">&raquo;</span>
            </a>
        </li>
        <li>
            <input type="button" value="首页" class="btn btn-success" onclick="gopage('1');"/>
        </li>
        <li>
            <input type="button" value="尾页" class="btn btn-success" onclick="gopage('${allpage}');"/>
        </li>
    </ul>

    </nav>
    <span>
        共查询出<b><i>${count}</i></b>条数据，共<b><i>${allpage}</i></b>页，
        当前为<b><i>${cp}</i></b>页，
        每页显示
        <select name="ps" onchange="gopage('1')">
            <option value="1" ${ps==1?"selected":""}>1</option>
            <option value="3" ${ps==3?"selected":""}>3</option>
            <option value="5" ${ps==5?"selected":""}>5</option>
            <option value="10" ${ps==10?"selected":""}>10</option>
        </select>

        行。
    </span>
    <br/>
    <input type="button" class="btn btn-success" value="新增" onclick="toAdd();"/>
    </div>
</form>
</div>
</body>
</html>
