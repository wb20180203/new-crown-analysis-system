<%--
  Created by IntelliJ IDEA.
  User: 18312
  Date: 2021/3/20
  Time: 8:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
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
<div class="x-body">
    <form class="layui-form">
        <input type="hidden" name="id" value="${editProvinec.id}">
        <div class="layui-form-item">
            <label for="confirmCount" class="layui-form-label">
                <span class="x-red">*</span>确诊人数
            </label>
            <div class="layui-input-inline">
                <input type="number" id="confirmCount" name="confirmCount" required="" lay-verify="confirmCount" value="${editProvinec.confirmCount}"
                       autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux">
                <span class="x-red">*</span>输入确诊人数
            </div>
        </div>
        <div class="layui-form-item">
            <label for="curedCount" class="layui-form-label">
                <span class="x-red">*</span>治愈人数
            </label>
            <div class="layui-input-inline">
                <input type="number" id="curedCount" name="curedCount" required="" lay-verify="curedCount" value="${editProvinec.curedCount}"
                       autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux">
                <span class="x-red">*</span>输入治愈人数
            </div>
        </div>
        <div class="layui-form-item">
            <label for="deadCount" class="layui-form-label">
                <span class="x-red">*</span>死亡人数
            </label>
            <div class="layui-input-inline">
                <input type="number" id="deadCount" name="deadCount" required="" lay-verify="deadCount" value="${editProvinec.deadCount}"
                       autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux">
                <span class="x-red">*</span>输入死亡人数
            </div>
        </div>
        <div class="layui-form-item">
            <button  class="layui-btn" lay-filter="save" lay-submit="">
                保存
            </button>
        </div>
    </form>
</div>

<script>
    layui.use(['form','layer'], function(){
        $ = layui.jquery;
        var form = layui.form
            ,layer = layui.layer;


        //监听提交
        form.on('submit(save)', function(data){
            console.log(data);
            //拿数据
            var idValue=data.field.id;
            var confirmValue=data.field.confirmCount;
            var curedValue=data.field.curedCount;
            var deadValue=data.field.deadCount;

            //发送ajax请求到服务器
            $.ajax({
                url: "${pageContext.request.contextPath}/info/update",
                type: "post",
                datatype: "json",
                data: {"id":idValue,"confirmCount":confirmValue,"curedCount":curedValue,"deadCount":deadValue},
                //请求响应之后处理添加结果
                success:function (result) {
                    if(result.code==0){
                        layer.alert(result.msg,{icon:6},function () {
                            var index=parent.layer.getFrameIndex(window.name);
                            parent.layer.close(index);
                            //刷新用户界面(用户列表)
                            parent.location.reload();
                        })
                    }else{
                        layer.msg(result.msg,{icon:5});
                    }
                },
                error:function (err) {
                    layer.alert(JSON.stringify(err))
                }
            });
            return false;
        });


    });
</script>

</body>

</html>
