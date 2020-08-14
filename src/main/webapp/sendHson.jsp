<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE HTML>
<html>
<head>
  <title>aaaaa</title>
  <script type="text/javascript" src="static/js/jquery-2.1.0.js"></script>
</head>

<body>

<div><button type="button" id="bbt">点击发送json</button></div>

</body>
<script type="text/javascript">
   $("#bbt").click(function(){
    $.ajax({
    type:"post",
      dataType:"json",
    data:{pname:"dadada",pid:"2",shop_price:"153.14"},
    url:"${pageContext.request.contextPath }/getjson",
    context:"application/json;charset=utf-8",
    success:function (data) {
        alert(data.pname),
        alert(data.pid),
        alert(data.shop_price)

    },
    error:function(data){
      alert("哦不！")
    }
  })

   })

</script>
</html>