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


<table class="layui-table" lay-data="{width: 1000, height:300, url:'${pageContext.request.contextPath}/product', page:true, id:'idTest'}" lay-filter="demo">
	<thead>
	<tr>
		<th lay-data="{type:'checkbox', fixed: 'left'}"></th>
		<th lay-data="{field:'pid', width:100, title: '商品编号', sort: true}"></th>
		<th lay-data="{field:'pname', width:150, title: '商品名称'}"></th>
		<th lay-data="{field:'shop_price', width:100, title: '本店价格'}"></th>
		<th lay-data="{field:'pdate', width:150, title: '上架日期', sort: true}"></th>
		<th lay-data="{field:'pdesc', width:350, title: '描述'}"></th>
		<th lay-data="{field:'experience', width:80, sort: true}"></th>

		<th lay-data="{fixed: 'right', width:178, align:'center', toolbar: '#barDemo'}"></th>
	</tr>
	</thead>
</table>
<script src="static/layui/layui.all.js"></script>
</body>
<script type="text/html" id="barDemo">
	<a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
	<a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
	<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
<script>
	layui.use('table', function() {
		var table = layui.table;
		//监听表格复选框选择
		table.on('checkbox(demo)', function (obj) {
			console.log(obj)
		});
		//监听工具条
		table.on('tool(demo)', function (obj) {
			var data = obj.data;
			if (obj.event === 'detail') {
				layer.msg('ID：' + data.id + ' 的查看操作');
			} else if (obj.event === 'del') {
				layer.confirm('真的删除行么', function (index) {
					obj.del();
					layer.close(index);
				});
			} else if (obj.event === 'edit') {
				layer.alert('编辑行：<br>' + JSON.stringify(data))
			}
		});
	})
</script>
</html>