<%@ page import="com.liu.domain.Book" %>
<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

    </script>
</head>

<body>
<!-- 导航栏 -->
<nav class="navbar navbar-default navbar-fixed-top" style="background-color: rgb(77,160,200);border: 0;">
    <div class="container-fluid">
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
            <li class="list-li "><a href="${pageContext.request.contextPath}/admin/allBook" class="a"><span class="glyphicon glyphicon-home"
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
                                            aria-hidden="true"></span> <a href="${pageContext.request.contextPath}/admin/managementUser" style="text-decoration: none;color: black">用户管理</a></span><span style="color: rgb(119,119,139)"> > 借阅历史</span></div>
    </div>


    <div class="show-table" style="box-shadow: 0 4px 12px rgb(0 0 0);">
        <table class="table table-striped table-hover" style="border: 1px solid #ccc;">
            <thead>
            <tr>
                <th>操作记录</th>
                <th>书名</th>
                <th>借出日期</th>
                <th>是否归还</th>
                <th>归还日期/应还日期</th>
            </tr>
            </thead>
            <tbody>

            <c:forEach items="${borrowPage.list}" var="borrow">
                <tr >
                    <td style="width: 100px;">${borrow.borrowId}</td>
                    <td style="width: 150px;">${borrow.bookName}</td>
                    <td style="width: 250px;"><fmt:formatDate value="${borrow.borrowTime}" pattern="yyyy-MM-dd HH:mm"/></td>
                    <c:if test="${borrow.isReturn==0}">
                        <td style="width: 100px;color: red;font-weight: 700">未归还</td>
                        <td style="width: 250px; "><fmt:formatDate value="${borrow.sReturnTime}" pattern="yyyy-MM-dd HH:mm"/></td>
                    </c:if>
                    <c:if test="${borrow.isReturn!=0}">
                        <td style="width: 100px;color: green;font-weight: 700 ">已归还</td>
                        <td style="width: 250px; "><fmt:formatDate value="${borrow.tReturnTime}" pattern="yyyy-MM-dd HH:mm"/></td>
                    </c:if>
                </tr>
            </c:forEach>
            </tbody>
        </table>

        <div class="page-nav"><nav aria-label="Page navigation"><ul class="pagination">
            <c:forEach items="${borrowPage.navigatepageNums}" var="i">
                <li><a href="${pageContext.request.contextPath}/admin/userBorrowHistory?pn=${i}&uid=${uid}">${i}</a></li>
            </c:forEach>
        </ul>
        </nav></div>
    </div>
</div>

<footer class="footer">
    <p style="text-align: center;font:normal 700 14px sans-serif;display: block;"> 版权所有©中国地质大学（北京）</p>
</footer>

</body>
</html>