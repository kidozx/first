<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2020/8/11
  Time: 19:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>

<html>
<head>
    <title>QQQQ</title>
</head>
<body>
<form>
    <table border="1">
        商品列表：
        <tr>
            <td>商品ID</td>
            <td>商品名称</td>
            <td>商品价格</td>
            <td>生产日期</td>
            <td>商品描述</td>

        </tr>
            <tr>
                <td>${itrem.pid }</td>
                <td>${iteem.pname }</td>
                <td>${iteem.shop_price }</td>
                <td><fmt:formatDate value="${iteem.pdate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                <td>${iteem.pdesc }</td>

            </tr>


    </table>
</form>
</body>
</html>
