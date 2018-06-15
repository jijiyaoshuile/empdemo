<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>emplist</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/r/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/r/css/style.css">
</head>
<body>
<div class="container">
    <div class="row head"></div>
    <div class="row">
        <table class="table table-striped table-hover">
            <thead>
                <tr>
                    <th><input type="checkbox" class="chooseAll"></th>
                    <th>#</th>
                    <th>姓名</th>
                    <th>手机</th>
                    <th>性别</th>
                    <th>工资</th>
                    <th>部门</th>
                    <th>操作</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${pageInfo.list}" var="emp" varStatus="index">
                    <tr>
                        <td><input type="checkbox" class="item" value="${emp.id}"></td>
                        <td>${index.index+1}</td>
                        <td>${emp.name}</td>
                        <td>${emp.phone}</td>
                        <td>${emp.sex}</td>
                        <td>${emp.salary}</td>
                        <td>${emp.dept.dname}</td>
                        <td>
                            <button type="button" class="btn btn-info update-btn" update-id="${emp.id}">修改</button>
                            <button type="button" class="btn btn-danger delete-btn" delete-id="${emp.id}">删除</button>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
    <div class="row">
        <div class="col-sm-9">
            <button type="button" class="btn btn-primary addEmp">增加</button>
            <button type="button" class="btn btn-danger deleteAll">删除</button>
        </div>
        <div class="col-sm-3">
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <c:if test="${pageInfo.isFirstPage}">
                        <li class="disabled">
                            <a href="#" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                    </c:if>
                    <c:if test="${!pageInfo.isFirstPage}">
                        <li>
                            <a href="${pageContext.request.contextPath}/emp/emplist?pageNum=${pageInfo.prePage}" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                    </c:if>

                    <c:if test="${(pageInfo.pages - pageInfo.pageNum) > 4}">
                        <c:forEach begin="${pageInfo.pageNum}" end="${pageInfo.pageNum + 4}" var="Num" varStatus="index">
                            <c:if test="${index.index == pageInfo.pageNum}">
                                <li class="active"><a href="${pageContext.request.contextPath}/emp/emplist?pageNum=${index.index}">${Num}</a></li>
                            </c:if>
                            <c:if test="${!(index.index == pageInfo.pageNum)}">
                                <li><a href="${pageContext.request.contextPath}/emp/emplist?pageNum=${index.index}">${Num}</a></li>
                            </c:if>
                        </c:forEach>
                    </c:if>
                    <c:if test="${!((pageInfo.pages - pageInfo.pageNum) > 4)}">
                        <c:forEach begin="${(pageInfo.pages - 4) > 0 ? (pageInfo.pages - 4):1}" end="${pageInfo.pages}" var="Num" varStatus="index">
                            <c:if test="${index.index == pageInfo.pageNum}">
                                <li class="active"><a href="${pageContext.request.contextPath}/emp/emplist?pageNum=${index.index}">${Num}</a></li>
                            </c:if>
                            <c:if test="${!(index.index == pageInfo.pageNum)}">
                                <li><a href="${pageContext.request.contextPath}/emp/emplist?pageNum=${index.index}">${Num}</a></li>
                            </c:if>
                        </c:forEach>
                    </c:if>

                    <c:if test="${pageInfo.isLastPage}">
                        <li class="disabled">
                            <a href="#" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </c:if>
                    <c:if test="${!pageInfo.isLastPage}">
                        <li>
                            <a href="${pageContext.request.contextPath}/emp/emplist?pageNum=${pageInfo.nextPage}" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </c:if>
                </ul>
            </nav>
        </div>
    </div>
    <div class="row foot"></div>
</div>

<script type="text/javascript" src="${pageContext.request.contextPath}/r/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/r/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript">
    $(function(){

        //使用jQuery的绑定方式来绑定一个点击事件
        $(".delete-btn").click(function(){
            //$(this)代表着获取当前触发这个方法的那个节点对象
            var id = $(this).attr("delete-id");
            var path = "${pageContext.request.contextPath}/emp/deleteEmpById?id=" + id;
            location.href = path;
        });

        //全选的点击事件
        $(".chooseAll").click(function () {
            $(".item").prop("checked",$(this).prop("checked"));
        });

        //点击删除全部的按钮
        $(".deleteAll").click(function () {
            var ids = [];
            //1.拿到所有多选框的状态
            $(".item").each(function () {
                var item = $(this);
                if(item.prop("checked")){
                    var id = item.val();
                    ids[ids.length] = id;
                }
            });
            if(ids.length != 0){
                var path = "${pageContext.request.contextPath}/emp/deleteEmpById?id=" + ids;
                location.href = path;
            }else{
                location.href = "${pageContext.request.contextPath}/emp/emplist?pageNum=" + ${pageInfo.pageNum};
            }

        });
        //增加员工
        $(".addEmp").click(function () {
            var path = "${pageContext.request.contextPath}/emp/addEmpView";
            location.href = path;
        });

        //使用jQuery的绑定方式来绑定一个点击事件
        $(".update-btn").click(function(){
            //$(this)代表着获取当前触发这个方法的那个节点对象
            var id = $(this).attr("update-id");
            var path = "${pageContext.request.contextPath}/emp/updateEmpView?id=" + id;
            location.href = path;
        });
    });
</script>
</body>
</html>