<%--
  Created by IntelliJ IDEA.
  User: 19870
  Date: 2021/5/14
  Time: 22:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>添加成功</title>
    <script src="${pageContext.request.contextPath}/static/js/jquery-3.3.1.min.js"></script>
    <link href="${pageContext.request.contextPath}/static/css/bootstrap.min.css" rel="stylesheet">

    <script src="${pageContext.request.contextPath}/static/js/bootstrap.min.js"></script>

    <script>

        $(
            function (){
                let h1 = $("h1")[0];
                let h2 = $("h2")[0];
                let time=5;
                setInterval(function (){
                    if (time==0){
                        location.href='${pageContext.request.contextPath}/admin/allBook'
                    }else {
                        h1.innerHTML="添加成功！ <small>"+time+"秒后将会自动跳转到<a href='${pageContext.request.contextPath}/admin/allBook'>首页</a>。</small>";
                        h2.innerHTML="继续添加请<a href='${pageContext.request.contextPath}/admin/addBook'>点击</a>。"
                        time--;
                    }
                },1000)
            }
        )
    </script>
</head>
<body>

<div class="page-header">
    <h1 style="padding-left: 60px"></h1>
    <h2 style="margin-left: 60px"></h2>
</div>
</body>
</html>

