<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查询商品列表</title>
	<link rel="stylesheet" href="static/layui/css/layui.css" media="all">


</head>
<body> 
<form action="${pageContext.request.contextPath }/query" method="post">
查询条件：
<table width="100%" border=1>

<tr>
	<td>商品名称:<input type="text" name="product.pname"></td>
	<td>商品价格:<input type="text" name="product.shop_price"></td>

	<td><input type="submit" value="查询"/></td>
</tr>
</table>
</form>
<%--<form action="${pageContext.request.contextPath }/deleteAll" method="post">--%>
<%--	<td><input type="submit" value="批量删除"/></td>--%>
<%--<table border="1">--%>
<%--商品列表：--%>
<%--<tr>--%>
<%--	<td>&amp;</td>--%>
<%--	<td>商品名称</td>--%>
<%--	<td>商品价格</td>--%>
<%--	<td>生产日期</td>--%>
<%--	<td>商品描述</td>--%>
<%--	<td>操作</td>--%>
<%--</tr>--%>
<%--<c:forEach items="${productList }" var="item">--%>
<%--<tr>--%>
<%--	<td><input type="checkbox" name="ids" value="${item.pid }"></td>--%>
<%--	<td>${item.pname }</td>--%>
<%--	<td>${item.shop_price }</td>--%>
<%--	<td><fmt:formatDate value="${item.pdate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>--%>
<%--	<td>${item.pdesc }</td>--%>

<%--&lt;%&ndash;    传统url&ndash;%&gt;--%>
<%--&lt;%&ndash;	<td><a href="${pageContext.request.contextPath }/itemEdit.action?id=${item.pid}">修改</a></td>&ndash;%&gt;--%>

<%--	<td><a href="${pageContext.request.contextPath }/itemEdit/${item.pid}">修改</a></td>--%>

<%--</tr>--%>
<%--</c:forEach>--%>

<%--</table>--%>

<%--</form>--%>
<table class="layui-table" id="test"></table>
<script src="static/layui/layui.all.js"></script>
</body>
<script>
	layui.use('table', function(){
		var table = layui.table;
		table.render({
			elem: '#test'
			,url:'${pageContext.request.contextPath}/product'
			,high:60
			,page: true
			,cols: [[
				 //{width:100, title: '商品'}
				,{field:'pid', width:100, title: '商品编号', sort: true}
				,{field:'pname', width:130, title: '商品名称'}
				// ,{field:'market_price', width:100, title: '超市价格', sort: true}
				,{field:'shop_price', width:100, title: '线上价格'}
				// ,{field:'pimage', title: '图片路径', width: 150}
				,{field:'pdate', width:150, title: '上架日期', sort: true}
				// ,{field:'is_hot', width:80, title: '是否热门', sort: true}
				,{field:'pdesc', width:350, title: '描述'}
			]]

		});
	});
</script>
</html>