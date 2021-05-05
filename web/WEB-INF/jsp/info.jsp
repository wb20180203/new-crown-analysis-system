<%--
  Created by IntelliJ IDEA.
  User: 18312
  Date: 2021/3/19
  Time: 15:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="utf-8">
    <title>
        后台管理系统
    </title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/layui/css/layui.css"  media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/xadmin.css" media="all">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/xadmin.js" charset="utf-8"></script>
</head>
<body>
<div class="x-nav">
            <span class="layui-breadcrumb">
              <a><cite>首页</cite></a>
              <a><cite>会员管理</cite></a>
              <a><cite>疫情信息</cite></a>
            </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right"  href="javascript:location.replace(location.href);" title="刷新"><i class="layui-icon" style="line-height:30px">ဂ</i></a>
</div>
<div class="x-body">
    <form class="layui-form" action="${pageContext.request.contextPath}/info/querySome" method="get" style="width:80%">
        <div class="layui-form-pane" style="margin-top: 10px;">
            <div class="layui-form-item">
                <div class="layui-input-inline">
                    <input type="text" name="time" value="${requestScope.time}" placeholder="yyyy-mm-dd" autocomplete="off" class="layui-input">
                </div>
                <div class="layui-input-inline">
                    <input type="text" name="province"  value="${requestScope.province}" placeholder="请输入省份" autocomplete="off" class="layui-input">
                </div>
                <div class="layui-input-inline" style="width:80px">
                    <button class="layui-btn"  lay-submit="" lay-filter="sreach"><i class="layui-icon">&#xe615;</i></button>
                </div>
            </div>
        </div>
    </form>
    <xblock>
        <button class="layui-btn" onclick="admin_add('添加数据','${pageContext.request.contextPath}/info/add','580','580')"><i class="layui-icon">&#xe608;</i>添加</button>
        <span class="x-right" style="line-height:40px">共有数据：<span class="layui-badge">${pageData.totalSize}</span> 条</span>
    </xblock>
    <table class="layui-table">
        <thead>
        <tr>
            <th>
                省份
            </th>
            <th>
                时间
            </th>
            <th>
                确诊
            </th>

            <th>
                治愈
            </th>
            <th>
                死亡
            </th>
            <th>
                操作
            </th>
        </tr>
        </thead>
        <tbody>
        <%--        //jstl标签库做一个循环控制--%>
        <c:forEach items="${pageData.listData}" var="one">
            <tr>
                <td>
                        ${one.provinceName}
                </td>

                <td>
                        ${one.time}
                </td>
                <td>
                        ${one.confirmCount}
                </td>
                <td >
                        ${one.curedCount}
                </td>
                <td >
                        ${one.deadCount}
                </td>

                <td class="td-manage">
                    <a title="查看当日该省地区情况" href="${pageContext.request.contextPath}/area/detailsOfProvince?province=${one.provinceName}&time=${one.time}"
                       class="ml-5" style="text-decoration:none">
                        <i class="layui-icon">&#xe648;</i>
                    </a>
<%--                    <a title="编辑" href="javascript:;" onclick="admin_edit('编辑','${pageContext.request.contextPath}/info/proedit','${one.id}','600','510')"--%>
<%--                       class="ml-5" style="text-decoration:none">--%>
<%--                        <i class="layui-icon">&#xe642;</i>--%>
<%--                    </a>--%>
                    <a title="删除" href="#" onclick="admin_del(this,${one.id})"
                       style="text-decoration:none">
                        <i class="layui-icon">&#xe640;</i>
                    </a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>


    <div id="page" style="text-align: center">
        <c:choose>
            <c:when test="${empty requestScope.time && empty requestScope.province}">
                <a class="layui-btn layui-btn-small "  href="${pageContext.request.contextPath}/info/province?pageNumber=1&pageSize=${pageData.pageSize}">首页</a>
            </c:when>
            <c:otherwise>
                <a class="layui-btn layui-btn-small "  href="${pageContext.request.contextPath}/info/querySome?pageNumber=1&pageSize=${pageData.pageSize}<c:if test="${not empty requestScope.time}">&time=${requestScope.time}</c:if><c:if test="${not empty requestScope.province}">&province=${requestScope.province}</c:if>">首页</a>
            </c:otherwise>
        </c:choose>
        <c:choose>
            <c:when test="${empty requestScope.time && empty requestScope.province}">
                <a class=" layui-btn layui-btn-small" href="${pageContext.request.contextPath}/info/province?pageNumber=${pageData.previous}&pageSize=${pageData.pageSize}">上一页</a>
            </c:when>
            <c:otherwise>
                <a class=" layui-btn layui-btn-small" href="${pageContext.request.contextPath}/info/querySome?pageNumber=${pageData.previous}&pageSize=${pageData.pageSize}<c:if test="${not empty requestScope.time}">&time=${requestScope.time}</c:if><c:if test="${not empty requestScope.province}">&province=${requestScope.province}</c:if>">上一页</a>
            </c:otherwise>
        </c:choose>
        <c:choose>
            <c:when test="${empty requestScope.time && empty requestScope.province}">
                <a class=" layui-btn layui-btn-small" href="${pageContext.request.contextPath}/info/province?pageNumber=${pageData.nextPage}&pageSize=${pageData.pageSize}">下一页</a>
            </c:when>
            <c:otherwise>
                <a class=" layui-btn layui-btn-small" href="${pageContext.request.contextPath}/info/querySome?pageNumber=${pageData.nextPage}&pageSize=${pageData.pageSize}<c:if test="${not empty requestScope.time}">&time=${requestScope.time}</c:if><c:if test="${not empty requestScope.province}">&province=${requestScope.province}</c:if>">下一页</a>
            </c:otherwise>
        </c:choose>
        <c:choose>
            <c:when test="${empty requestScope.time && empty requestScope.province}">
                <a class=" layui-btn layui-btn-small" href="${pageContext.request.contextPath}/info/province?pageNumber=${pageData.totalPage}&pageSize=${pageData.pageSize}">尾页</a>
            </c:when>
            <c:otherwise>
                <a class=" layui-btn layui-btn-small" href="${pageContext.request.contextPath}/info/querySome?pageNumber=${pageData.totalPage}&pageSize=${pageData.pageSize}<c:if test="${not empty requestScope.time}">&time=${requestScope.time}</c:if><c:if test="${not empty requestScope.province}">&province=${requestScope.province}</c:if>">尾页</a>
            </c:otherwise>
        </c:choose>
        <span>当前第${pageData.pageNumber}页，共${pageData.totalPage}页, 每页显示<select style="width: 80px" class=" layui-select" id="select" onchange="change()">
            <option  value="1" <c:if test="${pageData.pageSize == 1}">selected="selected"</c:if>>1</option>
            <option value="5" <c:if test="${pageData.pageSize == 5}">selected="selected"</c:if>> 5</option>
            <option value="10" <c:if test="${pageData.pageSize == 10}">selected="selected"</c:if>>10</option>
        </select></span>
    </div>
</div>

<script>
    <c:choose>
        <c:when test="${empty requestScope.time && empty requestScope.province}">
            function change() {
            var pageSize = $("#select").val();
            window.location.href = "${pageContext.request.contextPath}/info/province?pageNumber=${pageData.pageNumber}&pageSize="+pageSize;
            }
        </c:when>
        <c:otherwise>
            function change() {
            var pageSize = $("#select").val();
            window.location.href = "${pageContext.request.contextPath}/info/querySome?pageNumber=${pageData.pageNumber}&pageSize="+pageSize+"<c:if test="${not empty requestScope.time}"> &time=${requestScope.time}</c:if><c:if test="${not empty requestScope.province}"> &province=${requestScope.province}</c:if>";
            }
        </c:otherwise>
    </c:choose>
    layui.use(['layer'], function(){
        $ = layui.jquery;//jquery

        layer = layui.layer;//弹出层

        //以上模块根据需要引入

    });

    /*添加*/
    function admin_add(title,url,w,h){
        x_admin_show(title,url,w,h);
    }


    //编辑
    function admin_edit (title,url,id,w,h) {
        var newUrl = url +"?id="+id;
        x_admin_show(title,newUrl,w,h);
    }
    /*删除*/
    function admin_del(obj,id){
        layer.confirm('确认要删除吗？',{icon:3,title:'提示信息'},function(index){
            //发异步ajax删除数据
            $.ajax({
                url: "${pageContext.request.contextPath}/info/remove",
                type: "post", //删除操作的意图是想要改变服务器的状态或者数据
                datatype:"json",
                data:{"id": id},
                success:function (res) {
                    //{"code": 0, "msg": "删除成功"}
                    //{"code": -1, "msg": "删除失败"}
                    if(res.code == 0){
                        layer.msg(res.msg,{icon:1,time:1000}, function () {
                            location.reload();
                        });
                    }else if(res.code == -1) {
                        layer.msg(res.msg,{icon:5,time:1000});
                    } else {
                        layer.msg(res.msg,{icon:5,time:1000});
                    }
                },
                error:function (err) {
                    layer.alert(JSON.stringify(err)); //弹框提示错误信息
                }

            });
        });
    }
</script>

</body>
</html>
