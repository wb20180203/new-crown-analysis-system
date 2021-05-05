<%--
  Created by IntelliJ IDEA.
  User: 18312
  Date: 2021/3/22
  Time: 9:49
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
    <h1 style="text-align: center">${province} ${time}</h1>
    <table class="layui-table">
        <thead>
        <tr>
            <th>
                地区
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
        <tr>
            <td>
                ${areaInfo.areaName}
            </td>
            <td>
                ${areaInfo.confirmCount}
            </td>
            <td >
                ${areaInfo.curedCount}
            </td>
            <td >
                ${areaInfo.deadCount}
            </td>

            <td class="td-manage">
                <a title="编辑" href="javascript:;" onclick="admin_edit('编辑','${pageContext.request.contextPath}/area/areaEdit?time=${time}&province=${province}','${areaInfo.id}','600','510')"
                   class="ml-5" style="text-decoration:none">
                    <i class="layui-icon">&#xe642;</i>
                </a>
                <a title="删除" href="#" onclick="admin_del(this,${areaInfo.id})"
                   style="text-decoration:none">
                    <i class="layui-icon">&#xe640;</i>
                </a>
            </td>
        </tr>
        </tbody>
    </table>

</div>

<script>
    function change() {
        var pageSize = $("#select").val();
        window.location.href = "${pageContext.request.contextPath}/info/province?pageNumber=1&pageSize="+pageSize;
    }
    layui.use(['layer'], function(){
        $ = layui.jquery;//jquery

        layer = layui.layer;//弹出层

        //以上模块根据需要引入

    });



    //编辑
    function admin_edit (title,url,id,w,h) {
        var newUrl = url +"&id="+id;
        x_admin_show(title,newUrl,w,h);
    }
    /*删除*/
    function admin_del(obj,id){
        layer.confirm('确认要删除吗？',{icon:3,title:'提示信息'},function(index){
            //发异步ajax删除数据
            $.ajax({
                url: "${pageContext.request.contextPath}/area/deleteOne?time=${time}&province=${province}",
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


