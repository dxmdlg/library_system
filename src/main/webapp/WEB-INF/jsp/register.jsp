<%--
  Created by IntelliJ IDEA.
  User: 19870
  Date: 2021/5/16
  Time: 15:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>用户注册</title>
    <link href="${pageContext.request.contextPath}/static/css/bootstrap.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/static/js/jquery-3.3.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/bootstrap.min.js"></script>

    <script>
        let flag1=false;
        let flag2=false;
        let flag3=false;
        let flag4;
        let username;

        $(function(){
            let flag4=-1;
            function ajax(){
                $.post(
                    url="findSameUser",
                    {"username":username},
                    function (data){
                        if (data==0){
                            $(".tips")[0].style.display='block';
                            $("#username-f").removeClass("has-success");
                            $("#username-f").addClass("has-error");
                            $(".tips")[0].innerHTML="<span class='glyphicon glyphicon-remove' aria-hidden='true'></span>用户名已存在"

                        }else {
                            $(".tips")[0].style.display='none';
                            $("#username-f").removeClass("has-error")
                            $("#username-f").addClass("has-success")
                        }

                    },
                    type="text"
                )
            }

            var reg=/^\w{4,15}$/;
            $("#username").blur(
                function(){
                    username=$("#username").val()
                    ajax();
                    if(reg.test(username)){
                        $(".tips")[0].style.display='none';
                        $("#username-f").removeClass("has-error")
                        $("#username-f").addClass("has-success")

                        flag1=true;
                        ajax();
                    }
                    else{
                        $(".tips")[0].style.display='block';
                        $("#username-f").removeClass("has-success")
                        $("#username-f").addClass("has-error")
                        flag1=false;
                    }
                }

            )

            $("#password").blur(
                function(){
                    if(reg.test($("#password").val())){
                        $(".tips")[1].style.display='none';
                        $("#password-f").removeClass("has-error")
                        $("#password-f").addClass("has-success");
                        flag2=true;

                    }
                    else{
                        $(".tips")[1].style.display='block';
                        $("#password-f").removeClass("has-success")
                        $("#password-f").addClass("has-error")
                        $(".tips")[1].style.display='block';
                        flag2=false;
                    }
                }
            )

            $("#password2").blur(
                function(){
                    if($("#password").val()==$("#password2").val()){
                        $(".tips")[2].style.display='none';
                        $("#password2-f").removeClass("has-error")
                        $("#password2-f").addClass("has-success")
                        flag3=true;
                    }
                    else{
                        $(".tips")[2].style.display='block';
                        $("#password2-f").removeClass("has-success")
                        $("#password2-f").addClass("has-error")
                        flag3=false;
                    }
                }
            )
        })

        function test(){
            if($(".tips")[0].style.display=='none'){
                flag4= true;
            }else {
                flag4=false;
            }
            return flag1&&flag2&&flag3&&flag4;
        }
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
            background-image: url(${pageContext.request.contextPath}/static/images/注册页背景.jpg);
            background-repeat: no-repeat;
            background-size: cover;
            background-color: pink;
        }

        .r-form {
            width: 500px;
            height: 600px;
            background-color: rgba(255,255,255,0.95);
            border-radius: 4%;
            overflow: hidden;
            margin-top: 120px;
            padding: 25px;
            padding-left: 0px;
            padding-right: 0px;
        }



        .tips {
            position: absolute;
            top: 2px;
            display:none;
            width: 400px;
            height: 20px;
            color: red;
            font-size: 16px;
            margin-top: 70px;
        }



    </style>
</head>
<body style="background-color: rgb(100, 182, 248);">
<div class="content">

    <div class="container r-form" >
        <div class="row" style="margin-top:20px;">
            <div class="col-sm-11 col-sm-offset-1" style="font:normal 700 40px 'Microsoft YaHei'" id="cur2">欢迎注册！</div>
        </div>
        <div class="row" style="font-size:16px;color: #ccc;">
            <div class="col-sm-11 col-sm-offset-1">已有账号？<a href="login"> 登录</a></div>
        </div>
        <div class="row" style="margin-top:50px;">
            <div class="col-sm-10 col-sm-offset-1" style="font-size: 20px;">
                <form method="POST" action="${pageContext.request.contextPath}/toRegister">
                    <div class="form-group "  style="position: relative;" id="username-f">
                        <label for="username">用户名</label>
                        <input type="text" class="form-control" id="username" placeholder="4~15位字母或数字" name="username" required=true>
                        <span class="tips" ><span class="glyphicon glyphicon-remove" aria-hidden="true"></span>用户名格式不正确</span>
                    </div>
                    <div class="form-group" style="position: relative;margin-top: 50px;" id="password-f">
                        <label for="password">密码</label>
                        <input type="password" class="form-control" id="password" placeholder="4~15位字母、数字或下划线" name="password" required=true>
                        <span class="tips" ><span class="glyphicon glyphicon-remove" aria-hidden="true"></span>密码格式不正确</span>
                    </div>
                    <div class="form-group" style="position: relative;margin-top: 30px;" id="password2-f">
                        <label for="password2">确认密码</label>
                        <input type="password" class="form-control" id="password2" placeholder="4~15位字母、数字或下划线" name="password2" required=true>
                        <span class="tips" ><span class="glyphicon glyphicon-remove" aria-hidden="true"></span>两次密码不相同</span>
                    </div>

                    <button type="submit" onclick="return test()" class="btn btn-info" style="margin-top:50px; width: 100%;height: 40px;font-size: 24px;line-height: 20px;">注 册</button>
                </form>
            </div>
        </div>


    </div>

</div>


</body>
</html>
