<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>updateEmp</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/r/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/r/css/style.css">
</head>
<body>
<div class="container">
    <div class="row head"></div>
    <div class="row body">
        <form class="form-horizontal" id="updateEmpForm" action="${pageContext.request.contextPath}/emp/updateEmp" method="post">
            <input type="hidden" value="${emp.id}" name="id">
            <div class="form-group">
                <label for="name" class="col-sm-2 control-label">姓名</label>
                <div class="col-sm-6 name">
                    <input type="text" class="form-control" id="name" name="name" value="${emp.name}">
                </div>
                <div class="col-sm-4 checkName">

                </div>
            </div>
            <div class="form-group">
                <label for="phone" class="col-sm-2 control-label">手机</label>
                <div class="col-sm-6 phone">
                    <input type="text" class="form-control" id="phone" name="phone" value="${emp.phone}">
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">性别</label>
                <div class="radio" style="left: 15px">
                    <label>
                        <input type="radio" name="sex" value="男"<c:if test="${emp.sex == '男'}"> checked="checked"</c:if>>
                        男
                    </label>

                    <label>
                        <input type="radio" name="sex" value="女" <c:if test="${emp.sex == '女'}">checked="checked"</c:if>>
                        女
                    </label>
                </div>
            </div>
            <div class="form-group">
                <label for="salary" class="col-sm-2 control-label">工资</label>
                <div class="col-sm-6 salary">
                    <input type="text" class="form-control" id="salary" name="salary" value="${emp.salary}">
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">部门</label>
                    <div class="col-sm-6">
                        <select class="form-control" name="dept_id">
                            <c:forEach items="${deptList}" var="dept">
                                <option <c:if test="${emp.dept_id == dept.id}">selected="selected"</c:if> value="${dept.id}">${dept.dname}</option>
                            </c:forEach>
                        </select>
                    </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <button type="button" class="btn btn-primary sub">确认</button>
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
        var isName = true;
        var isPhone = true;
        var isSalary = true;
        $("#name").blur(function () {
            var name = $("#name").val();
            var reg = /[\u4e00-\u9fa5]{2,4}$/;
            if(reg.test(name)){
                /*$(".checkName").html("√");*/
                $(".name").attr("class","col-sm-6 name has-success");
                isName = true;
            }else{
                /*$(".checkName").html("2~4位中文");*/
                $(".name").attr("class","col-sm-6 name has-error");
                isName = false;
            }
        });
        $("#phone").blur(function () {
            var name = $("#phone").val();
            var reg = /[1][3|5|6|7|8][0-9]{9}$/;
            if(reg.test(name)){
                $(".phone").attr("class","col-sm-6 phone has-success");
                isPhone = true;
            }else{
                $(".phone").attr("class","col-sm-6 phone has-error");
                isPhone = false;
            }
        });
        $("#phone").keyup(function () {
            $("#phone").val($("#phone").val().replace(/[^\d]/g,''));
        });
        $("#salary").blur(function () {
            var name = $("#salary").val();
            var reg = /^[0-9]{0,6}$/;
            if(reg.test(name)){
                $(".salary").attr("class","col-sm-6 salary has-success");
                isSalary = true;
            }else{
                $(".salary").attr("class","col-sm-6 salary has-error");
                isSalary = false;
            }
        });
        $("#salary").keyup(function () {
            $("#salary").val($("#salary").val().replace(/[^\d]/g,''));
        });
        $(".sub").click(function () {
            if(isName && isPhone && isSalary){
                //提交表单
                $("#addEmpForm").submit();
            }
        });
        $("#salary").blur(function () {
            var name = $("#salary").val();
            var reg = /^[0-9]{0,6}$/;
            if(reg.test(name)){
                $(".salary").attr("class","col-sm-6 salary has-success");
                isSalary = true;
            }else{
                $(".salary").attr("class","col-sm-6 salary has-error");
                isSalary = false;
            }
        });
        $("#salary").keyup(function () {
            $("#salary").val($("#salary").val().replace(/[^\d]/g,''));
        });
        $(".sub").click(function () {
            if(isName && isPhone && isSalary){
                //提交表单
                $("#updateEmpForm").submit();
            }
        });
    });
</script>
</body>
</html>