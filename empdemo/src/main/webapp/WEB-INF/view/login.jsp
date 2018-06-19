<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>login</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/r/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/r/css/style.css">
    </head>
    <body>
        <div class="container">
            <div class="row head"></div>
            <div class="row body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="username" class="col-sm-2 control-label">Username</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="username" placeholder="username" name="username">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="password" class="col-sm-2 control-label">Password</label>
                        <div class="col-sm-6">
                            <input type="password" class="form-control" id="password" placeholder="password" name="password">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <div class="checkbox">
                                <label>
                                    <input type="checkbox"> Remember me
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <button type="button" class="btn btn-primary login">登录</button>
                        </div>
                    </div>
                </form>
            </div>
            <div class="row foot"></div>
        </div>
        <script type="text/javascript" src="${pageContext.request.contextPath}/r/js/jquery-3.3.1.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/r/bootstrap/js/bootstrap.min.js"></script>
        <script type="text/javascript">
            $(function () {
                $(".login").click(function () {
                    var username = $("#username").val();
                    var password = $("#password").val();
                    if(username == "" || password == ""){
                        alert("用户名或密码不能为空");
                    }else{
                        //使用ajax将用户名和密码传到后台去校验
                        $.ajax({
                            type:"post",
                            url:"${pageContext.request.contextPath}/user/login",
                            data:"username=" + username + "&password=" + password,
                            success:function (isLogin) {
                                isLogin = isLogin.trim();
                                if(isLogin == "true"){
                                    //跳转到emplist页面
                                    var path = "${pageContext.request.contextPath}/emp/emplist";
                                    location.href = path;
                                }else{
                                    alert("用户名或者密码错误");
                                }
                            }
                        });
                    }
                });
            });
        </script>
    </body>
</html>