<%--
  Created by IntelliJ IDEA.
  User: 19870
  Date: 2021/5/14
  Time: 16:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>图书管理系统</title>
    <link href="${pageContext.request.contextPath}/static/css/bootstrap.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/static/js/jquery-3.3.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/bootstrap.min.js"></script>
    <script>
        $(function(){

            $("#btn1").click(function(){
                $("div form").prop("action","userLogin");
                $("#username").prop("placeholder","用户名");
                $("#name01").html("用户名");
                $("#btn1").addClass("btn-info");
                $("#btn2").removeClass("btn-info");
            });
            $("#btn2").click(function(){
                $("div form").prop("action","adminLogin");
                $("#username").prop("placeholder","管理员名");
                $("#name01").html("管理员");
                $("#btn2").addClass("btn-info");
                $("#btn1").removeClass("btn-info");
            });
        })
        var reg =/^\w{4,15}$/;

        // function writeOver(){
        //     if(reg.test(($("#username").val()))&&(reg.test($("#password").val()))){
        //         return true;
        //     }else {
        //         $("#tip").html("<span class='glyphicon glyphicon-remove' aria-hidden='true'></span>请正确填写用户名或密码");
        //         return false;
        //     }
        // }
    </script>

    <style>
        * {
            margin: 0;
            padding: 0;
        }

        .content {
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            overflow: hidden;
            background-image: url(${pageContext.request.contextPath}/static/images/图书馆02.jpg);
            background-repeat: no-repeat;
            background-size: cover;
            background-color: pink;
        }

        .form-postion {
            margin: 300px auto;
            margin-top: 50px;
            width: 600px;
            height: 350px;
            background-color: rgba(255,255,255,0.95);
            border-radius: 8%;
            overflow: hidden;
        }
    </style>
</head>
<<body>
<div class="content">
    <div class="h1" style="margin: 130px auto;font:normal 700 90px sans-serif;text-align: center;margin-bottom: 0; color: white">图书馆管理系统</div>
    <div class="form-postion row">
        <div style="margin:0 auto; width: 88%; height: 17%;margin-top: 20px;padding: 20px;">
            <button class="btn btn-info col-lg-3 col-lg-offset-2" id="btn1">用户登录</button> <button class="btn col-lg-3 col-lg-offset-2" id="btn2">管理员登录</button>
        </div>
        <div class="form-l" style="margin:0 auto; width: 88%; height: 60%;margin-top: 20px;">
            <form class="form-horizontal" action="userLogin" method="POST">
                <div class="form-group">
                    <label for="username" class="col-sm-2 control-label" id="name01">用户名</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" id="username" placeholder="用户名" required="true" name="username">
                    </div>
                </div>
                <div class="form-group">
                    <label for="password" class="col-sm-2 control-label">密码</label>
                    <div class="col-sm-8">
                        <input type="password" class="form-control" id="password" placeholder="密码" required="true" name="password">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <div >
                            <label>
                                还没有账户？<a href="${pageContext.request.contextPath}/register">注册一个</a>
                            </label>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
<%--                        onclick="return writeOver()"--%>
                        <input type="submit" class="btn btn-primary" style="width: 77%;"  value="登录"></input>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <div >
                            <label id="tip" style="color: red;">
                                ${msg}
                            </label>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <div >
        <span style="position: absolute; bottom: 50px;left: 50px; font-size: 14px;">CUGB. © Copyright 2000 - 2021 Mailtech</span>
    </div>
</div>
</body>
</html>
