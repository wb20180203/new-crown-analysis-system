<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/3/15 0015
  Time: 17:13
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
              <a><cite>管理员列表</cite></a>
            </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right"  href="javascript:location.replace(location.href);" title="刷新"><i class="layui-icon" style="line-height:30px">ဂ</i></a>
</div>
<div class="x-body">
    <form class="layui-form" action="${pageContext.request.contextPath}/user/querySome" method="get" style="width:80%">
        <div class="layui-form-pane" style="margin-top: 15px;">
            <div class="layui-form-item">
                <div class="layui-input-inline">
                    <input type="text" name="queryString"  placeholder="请输入昵称或者电话号码查询" autocomplete="off" class="layui-input">
                </div>
                <div class="layui-input-inline" style="width:80px">
                    <button class="layui-btn"  lay-submit="" lay-filter="sreach"><i class="layui-icon">&#xe615;</i></button>
                </div>
            </div>
        </div>
    </form>
    <xblock>
        <button class="layui-btn layui-btn-danger" onclick="delAll()"><i class="layui-icon">&#xe640;</i>批量删除</button>
        <button class="layui-btn" onclick="admin_add('添加用户','${pageContext.request.contextPath}/user/add','580','580')"><i class="layui-icon">&#xe608;</i>添加</button>
        <span class="x-right" style="line-height:40px">共有数据：<span class="layui-badge">${pageData.totalSize}</span> 条</span>
    </xblock>
    <table class="layui-table">
        <thead>
        <tr>
            <th>
                <input type="checkbox" name="" value="">
            </th>
            <th>
                ID
            </th>
            <th>
                昵称
            </th>
            <th>
                登录名
            </th>

            <th>
                手机
            </th>
            <th>
                邮箱
            </th>
            <th>
                地址
            </th>
            <th>
                加入时间
            </th>
            <th>
                状态
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
                    <input type="checkbox" value="1" name="">
                </td>
                <td>
                        ${one.id}
                </td>

                <td>
                        ${one.name}
                </td>
                <td>
                        ${one.userName}
                </td>
                <td >
                        ${one.phone}
                </td>
                <td >
                        ${one.email}
                </td>
                <td >
                        ${one.address}
                </td>
                <td>
                        ${one.createTime}
                </td>
                <td class="td-status">

                    <c:if test="${one.isValid==1}">
                            <span class="layui-btn layui-btn-normal ">
                                已启用
                            </span>
                    </c:if>
                    <c:if test="${one.isValid==0}">
                            <span class="layui-btn layui-btn-disabled ">
                                已停用
                            </span>
                    </c:if>
                </td>
                <td class="td-manage">
                    <a style="text-decoration:none" onclick="admin_stop(this,'${one.id}')" href="javascript:;" title="停用">
                        <i class="layui-icon">&#xe601;</i>
                    </a>
                    <a title="编辑" href="javascript:;" onclick="admin_edit('编辑','${pageContext.request.contextPath}/user/edit','${one.id}','600','510')"
                       class="ml-5" style="text-decoration:none">
                        <i class="layui-icon">&#xe642;</i>
                    </a>
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
        <a class="layui-btn layui-btn-small "  href="${pageContext.request.contextPath}/user/listByPage?pageNumber=1&pageSize=${pageData.pageSize}">首页</a>
        <a class=" layui-btn layui-btn-small" href="${pageContext.request.contextPath}/user/listByPage?pageNumber=${pageData.previous}&pageSize=${pageData.pageSize}">上一页</a>
        <a class=" layui-btn layui-btn-small" href="${pageContext.request.contextPath}/user/listByPage?pageNumber=${pageData.nextPage}&pageSize=${pageData.pageSize}">下一页</a>
        <a class=" layui-btn layui-btn-small" href="${pageContext.request.contextPath}/user/listByPage?pageNumber=${pageData.totalPage}&pageSize=${pageData.pageSize}">尾页</a>
        <span>当前第${pageData.pageNumber}页，共${pageData.totalPage}页, 每页显示<select style="width: 80px" class=" layui-select" id="select" onchange="change()">
            <option  value="1" <c:if test="${pageData.pageSize == 1}">selected="selected"</c:if>>1</option>
            <option value="2" <c:if test="${pageData.pageSize == 2}">selected="selected"</c:if>> 2</option>
            <option value="5" <c:if test="${pageData.pageSize == 5}">selected="selected"</c:if>>5</option>
        </select></span>
    </div>
</div>

<script>
    function change() {
        var pageSize = $("#select").val();
        window.location.href = "${pageContext.request.contextPath}/user/listByPage?pageNumber=1&pageSize="+pageSize;
    }
    layui.use(['layer'], function(){
        $ = layui.jquery;//jquery

        layer = layui.layer;//弹出层

        //以上模块根据需要引入

    });

    //批量删除提交
    function delAll () {
        layer.confirm('确认要删除吗？',{icon:3,title:'提示信息'},function(index){
            //捉到所有被选中的，发异步进行删除
            layer.msg('删除成功', {icon: 1});
        });
    }
    /*添加*/
    function admin_add(title,url,w,h){
        x_admin_show(title,url,w,h);
    }

    /*停用*/
    function admin_stop(obj,id){
        layer.confirm('确认要停用吗？',function(index){
            //发异步把用户状态进行更改
            $.ajax({
                url: "${pageContext.request.contextPath}/user/stop",
                type: "post", //删除操作的意图是想要改变服务器的状态或者数据
                datatype:"json",
                data:{"userId": id},
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
            $(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="admin_start(this,'+id+')" href="javascript:;" title="启用"><i class="layui-icon">&#xe62f;</i></a>');
            $(obj).parents("tr").find(".td-status").html('<span class="layui-btn layui-btn-disabled">已停用</span>');
            $(obj).remove();
            layer.msg('已停用!',{icon: 5,time:1000});
        });
    }

    /*启用*/
    function admin_start(obj,id){
        layer.confirm('确认要启用吗？',function(index){
            //发异步把用户状态进行更改
            $.ajax({
                url: "${pageContext.request.contextPath}/user/start",
                type: "post", //删除操作的意图是想要改变服务器的状态或者数据
                datatype:"json",
                data:{"userId": id},
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

            $(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="admin_stop(this,'+id+')" href="javascript:;" title="停用"><i class="layui-icon">&#xe601;</i></a>');
            $(obj).parents("tr").find(".td-status").html('<span class="layui-btn layui-btn-normal">已启用</span>');
            $(obj).remove();
            layer.msg('已启用!',{icon: 6,time:1000});
        });
    }
    //编辑
    function admin_edit (title,url,id,w,h) {
        var newUrl = url +"?userId="+id;
        x_admin_show(title,newUrl,w,h);
    }
    /*删除*/
    function admin_del(obj,id){
        layer.confirm('确认要删除吗？',{icon:3,title:'提示信息'},function(index){
            //发异步ajax删除数据
            $.ajax({
                url: "${pageContext.request.contextPath}/user/remove",
                type: "post", //删除操作的意图是想要改变服务器的状态或者数据
                datatype:"json",
                data:{"userId": id},
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


           // $(obj).parents("tr").remove();

        });
    }
</script>

</body>
</html>