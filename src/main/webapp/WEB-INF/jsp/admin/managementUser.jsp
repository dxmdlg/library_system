<%--
     Created by IntelliJ IDEA.
     User: 19870
     Date: 2021/5/17
     Time: 18:56
     To change this template use File | Settings | File Templates.
   --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>中国地质大学图书馆</title>
    <link href="${pageContext.request.contextPath}/static/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/css/layout.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/css/allbook.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/static/js/jquery-3.3.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/bootstrap.min.js"></script>
    <script>
        $(function () {
            $(".list-li").click(function () {
                $(".list-li").removeClass("active-left");
                $(this).addClass("active-left");
            })

            $(".list-li:not(.active-left)").mouseover(function () {
                $(this).css("backgroundColor", "rgb(30,40,44)")
            })
            $(".list-li:not(.active-left)").mouseout(function () {
                $(this).css("backgroundColor", "rgb(34,45,50)")
            })
        })

        function addBlacklist(username){
            $.post(
                url="${pageContext.request.contextPath}/admin/addBlacklist",
                {"username":username},
                function (data){
                    if(data==1) {
                        location.reload();
                    }
                },
                type="text"
            )



        }

        function removeBlacklist(username){
            $.post(
                url="${pageContext.request.contextPath}/admin/removeBlacklist",
                {"username":username},
                function (data){
                    if(data==1) {
                        location.reload();
                    }
                },
                type="text"
            )
        }
    </script>

    <style>

        .addBook {
            float: left;
        }


    </style>
</head>

<body>
<!-- 导航栏 -->
<nav class="navbar navbar-default navbar-fixed-top" style="background-color: rgb(77,160,200);border: 0;">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">

            <a class="navbar-brand" id="a1" href="#"
               style="font-weight: 700;color: #fff;padding-left: 40px;padding-right: 40px;background-color: rgb(54,127,169);">中国地质大学图书馆管理系统</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav" id="header-ul">
                <li><a href="#" data-toggle="push-menu"><span class="glyphicon glyphicon-menu-hamburger"
                                                              aria-hidden="true"></span><span class="sr-only">(current)</span></a></li>
            </ul>
            <!-- <form class="navbar-form navbar-left">
          <div class="form-group">
            <input type="text" class="form-control" placeholder="Search">
          </div>
          <button type="submit" class="btn btn-default">Submit</button>
        </form> -->
            <ul class="nav navbar-nav navbar-right">
                <li style="padding: 15px;color:#777;">欢迎您！  ${sessionScope.nowAdmin.username} </li>
                <li><a href="${pageContext.request.contextPath}/quit" style="color:blue;">退出</a>

                </li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>

<!-- 左侧栏 -->
<aside class="aside-left">
    <section>
        <div class="user-panel">
            <div class="pull-left">
                <img class="img-circle" src="${pageContext.request.contextPath}/static/images/头像.jpg">
            </div>

            <div class="pull-left info" style="color: #fff;font-weight: 700;">
                <p>${sessionScope.nowAdmin.username}</p>
                <p>正在登陆中</p>
            </div>
        </div>
        <ul class="siderbar-menu">
            <li class="header">主菜单</li>
            <li class="list-li" ><a href="${pageContext.request.contextPath}/admin/allBook" class="a"><span class="glyphicon glyphicon-home"
                                                                                                                  aria-hidden="true"></span> &nbsp;图书目录</a></li>
            <li class="list-li active-left"><a href="${pageContext.request.contextPath}/admin/managementUser" class="a"><span class="glyphicon glyphicon-tasks"
                                                                                                                  aria-hidden="true"></span> &nbsp;用户管理</a></li>
            <li class="list-li"><a href="${pageContext.request.contextPath}/admin/findAllBorrow" class="a"><span class="glyphicon glyphicon-time"
                                                                                                                  aria-hidden="true"></span> &nbsp;借阅记录</a></li>
        </ul>

    </section>
</aside>

<!-- 主体内容 -->
<div class="main-context">
    <div class="l-title row">
        <div class="col-lg-3"><span > <span class="glyphicon glyphicon-home"
                                            aria-hidden="true"></span> <a href="${pageContext.request.contextPath}/admin/managementUser"
                                                                          style="text-decoration: none;color: black">用户管理</a></span><span style="color: rgb(119,119,139)"> > 用户列表</span></div>
    </div>



    <div class="show-table" style="box-shadow: 0 4px 12px rgb(0 0 0);">
        <table class="table table-striped table-hover" style="border: 1px solid #ccc;">
            <colgroup>
                <col width="190px">
                <col width="270px">
                <col width="230px">
                <col width="270px">


            </colgroup>
            <thead>
            <tr>
                <th>Uid</th>
                <th>用户名</th>
                <th>借阅次数</th>
                <th>借阅记录</th>
                <th>黑名单</th>


            </tr>
            </thead>
            <tbody>
            <c:forEach items="${pageInfo.list}" var="user">
                <tr>
                    <td >${user.uid}</td>
                    <td >${user.username}</td>
                    <td >${user.times}</td>
                    <td ><a href="${pageContext.request.contextPath}/admin/userBorrowHistory?uid=${user.uid}" style="text-decoration: none">详情</a></td>
                    <c:if test="${user.type==0}">
                        <td ><button  class="btn btn-info" style="width: 150px;" onclick="addBlacklist('${user.username}')" >加入黑名单</button></td>
                    </c:if>
                    <c:if test="${user.type==1}">
                        <td ><button class="btn bg-danger" style="width: 150px;" onclick="removeBlacklist('${user.username}')">移除出黑名单</button></td>
                    </c:if>

            </c:forEach>
            </tbody>
        </table>

<%--        <div class="addBook">--%>
<%--            <button class="btn btn-info"><span class="glyphicon glyphicon-plus" aria-hidden="true"> </span> <a href="${pageContext.request.contextPath}/book/addBook" style="text-decoration: none;color: black">添加图书</a></button>--%>
<%--        </div>--%>

<%--        &lt;%&ndash;            分页栏&ndash;%&gt;--%>
        <%
            String method = "managementUser";
            session.setAttribute("method",method);
        %>
        <div class="page-nav"><nav aria-label="Page navigation">
            <ul class="pagination">
                <c:if test="${pageInfo.pageNum==1}">
                    <li class="disabled">
                            <span >
                                <span aria-hidden="true">&laquo;</span>
                            </span>
                    </li>
                </c:if>
                <c:if test="${pageInfo.pageNum!=1}">
                    <li>
                        <a href="${method}?pn=${pageInfo.pageNum-1}" aria-label="Previous" >
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                </c:if>

                <c:forEach items="${pageInfo.navigatepageNums}" var="i">
                    <c:if test="${pageInfo.pageNum==i}">
                        <li class="active"><a href="${method}?pn=${i}">${i}</a></li>
                    </c:if>
                    <c:if test="${pageInfo.pageNum!=i}">
                        <li><a href="${method}?pn=${i}">${i}</a></li>
                    </c:if>
                </c:forEach>

                <c:if test="${pageInfo.pageNum==pageInfo.pages}">
                    <li class="disabled">
                            <span>
                                <span aria-hidden="true">&raquo;</span>
                            </span>
                    </li>
                </c:if>
                <c:if test="${pageInfo.pageNum!=pageInfo.pages}">
                    <li>
                        <a href="${method}?pn=${pageInfo.pageNum+1}" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </c:if>
            </ul>
        </nav>
        </div>
    </div>

</div>

<footer class="footer">
    <p style="text-align: center;font:normal 700 14px sans-serif;display: block;"> 版权所有©中国地质大学（北京）</p>
</footer>
</body>

</html>
