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


        })
        function toDelete(){
            $("#form-alter").attr("action","${pageContext.request.contextPath}/book/deleteBook");
        }
    </script>

    <style>

        .alert-book {
            margin: 0 80px;
            margin-top: 60px;
            padding: 30px;
            padding-bottom: 70px;
            background-color: #fff;
            font-size: 18px;
            box-shadow: 0 4px 12px rgb(0 0 0);
            min-height: 70%;
        }

        .form-margin {
            margin-top: 40px;
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
            <li class="list-li active-left"><a href="${pageContext.request.contextPath}/admin/allBook" class="a"><span class="glyphicon glyphicon-home"
                                                                                                                     aria-hidden="true"></span> &nbsp;图书目录</a></li>
            <li class="list-li"><a href="${pageContext.request.contextPath}/admin/managementUser" class="a"><span class="glyphicon glyphicon-tasks"
                                                                                                               aria-hidden="true"></span> &nbsp;用户管理</a></li>
            <li class="list-li"><a href="${pageContext.request.contextPath}/admin/findAllBorrow" class="a"><span class="glyphicon glyphicon-time"
                                                                                                                aria-hidden="true"></span> &nbsp;借阅记录</a></li>
        </ul>

    </section>
</aside>

<!-- 主体内容 -->
<div class="main-context">
    <div class="row l-title">
        <div class="col-lg-3"><span > <span class="glyphicon glyphicon-home"
                                            aria-hidden="true"></span> <a href="${pageContext.request.contextPath}/admin/allBook" style="text-decoration: none;color: black">图书目录</a></span><span style="color: rgb(119,119,139)"> > 修改图书信息</span></div>
    </div>

    <div class="alert-book">
        <div class="row">
            <div class="col-lg-10 col-lg-offset-3 h1" style="font-weight: 700"> 修改书籍信息</div>
        </div>
        <form class="form-horizontal" action="${pageContext.request.contextPath}/admin/finishAlter" method="post" id="form-alter">
            <div class="form-group form-margin" >
                <label  class="col-sm-1 control-label">图书ID:</label>
                <input type="hidden" name="bookId" value="${book.bookId}">
                <div class="col-sm-7">
                    <span style="font: normal 700 16px 'Microsoft YaHei UI';padding: 10px 0;line-height: 34px">${book.bookId}</span>
                </div>
            </div>
            <div class="form-group form-margin">
                <label for="input1" class="col-sm-1 control-label">图书名称:</label>
                <div class="col-sm-7">
                    <input type="text" class="form-control" id="input1" value="${book.bookName}" name="bookName" required="required">
                </div>
            </div>
            <div class="form-group form-margin">
                <label for="input2" class="col-sm-1 control-label">作者</label>
                <div class="col-sm-7">
                    <input type="text" class="form-control" id="input2" value="${book.author}" name="author" required="required">
                </div>
            </div>
            <div class="form-group form-margin">
                <label for="input3" class="col-sm-1 control-label">出版社</label>
                <div class="col-sm-7">
                    <input type="text" class="form-control" id="input3" value="${book.publisher}" name="publisher" required="required">
                </div>
            </div>
            <div class="form-group form-margin">
                <label for="input4" class="col-sm-1 control-label">总量</label>
                <div class="col-sm-7">
                    <input type="text" class="form-control" id="input4" value="${book.totalNum}" name="totalNum" required="required">
                </div>
            </div>
            <div class="form-group form-margin">
                <label for="input5" class="col-sm-1 control-label">剩余量</label>
                <div class="col-sm-7">
                    <input type="text" class="form-control" id="input5" value="${book.surplusNum}" name="surplusNum" required="required">
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-3">
                    <button type="submit" class="btn btn-success">提交修改</button>
                </div>
                <div class="col-sm-3">
                    <button type="submit" class="btn btn-danger" id="delete" onclick="return toDelete()">删除书籍</button>
                </div>
            </div>
        </form>
    </div>




</div>

<footer class="footer">
    <p style="text-align: center;font:normal 700 14px sans-serif;display: block;"> 版权所有©中国地质大学（北京）</p>
</footer>
</body>

</html>