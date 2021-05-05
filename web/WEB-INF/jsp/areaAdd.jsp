<%--
  Created by IntelliJ IDEA.
  User: 18312
  Date: 2021/3/21
  Time: 22:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
        <input type="hidden" name="time" value="${time}"/>
        <input type="hidden" name="provinceName" value="${province}"/>
        <div class="layui-form-item">
            <label for="areaName" class="layui-form-label">
                <span class="x-red">*</span>地区名
            </label>
            <div class="layui-input-inline">
                <input type="text" id="areaName" name="areaName" required="" lay-verify="areaName"
                       autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux">
                <span class="x-red">*</span>输入地区名
            </div>
        </div>
        <div class="layui-form-item">
            <label for="confirmCount" class="layui-form-label">
                <span class="x-red">*</span>确诊人数
            </label>
            <div class="layui-input-inline">
                <input type="number" id="confirmCount" name="confirmCount" required="" lay-verify="confirmCount"
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
                <input type="text" id="curedCount" name="curedCount" required="" lay-verify="curedCount"
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
                <input type="number" id="deadCount" name="deadCount" required="" lay-verify="deadCount"
                       autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux">
                <span class="x-red">*</span>输入死亡人数
            </div>
        </div>
        <div class="layui-form-item">
            <button  class="layui-btn" lay-filter="add" lay-submit="">
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
        form.on('submit(add)', function(data){
            console.log(data);
            //拿到用户编辑内容，
            var timeValue=data.field.time;
            var provinceValue=data.field.provinceName;
            var areaNameValue=data.field.areaName;
            var confirmValue=data.field.confirmCount;
            var curedValue=data.field.curedCount;
            var deadValue=data.field.deadCount;
            //希望服务器返回json格式的字符串
            $.ajax({
                url: "${pageContext.request.contextPath}/area/addOne",
                type: "post",
                datatype: "json",
                data: {"time":timeValue,"provinceName":provinceValue,"areaName":areaNameValue,"confirmCount":confirmValue,
                    "curedCount":curedValue,"deadCount":deadValue},
                //请求响应之后处理添加结果
                success:function (result) {
                    if(result.code==0){
                        layer.alert(result.msg,{icon:6},function () {
                            var index=parent.layer.getFrameIndex(window.name);
                            parent.layer.close(index);
                            //刷新用户界面
                            parent.location.reload();
                        })
                    }else{
                        layer.msg(result.msg,{icon:5})
                    }
                },
                error:function (err) {
                    layer.alert("错误")
                }
            })
            return false;
        });
    });
</script>

</body>

</html>
