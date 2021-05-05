<%--
  Created by IntelliJ IDEA.
  User: 18312
  Date: 2021/3/18
  Time: 10:23
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
        <input type="hidden" name="id" value="${editUser.id}">
        <div class="layui-form-item">
            <label for="name" class="layui-form-label">
                <span class="x-red">*</span>昵称
            </label>
            <div class="layui-input-inline">
                <input type="text" id="name" name="name" required="" lay-verify="name" value="${editUser.name}"
                       autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux">
                <span class="x-red">*</span>输入用户昵称
            </div>
        </div>
        <div class="layui-form-item">
            <label for="name" class="layui-form-label">
                <span class="x-red">*</span>年龄
            </label>
            <div class="layui-input-inline">
                <input type="number" id="age" name="age" required="" lay-verify="required" value="${editUser.age}"
                       autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux">
                <span class="x-red">*</span>输入用户昵称
            </div>
        </div>
        <div class="layui-form-item">
            <label for="name" class="layui-form-label">
                <span class="x-red">*</span>登录名
            </label>
            <div class="layui-input-inline">
                <input type="text" id="username" name="username" required="" lay-verify="required" value="${editUser.userName}"
                       autocomplete="off" class="layui-input layui-disabled" disabled="disabled">
            </div>
            <div class="layui-form-mid layui-word-aux">
                <span class="x-red">*</span>输入登录名
            </div>
        </div>
        <div class="layui-form-item">
            <label for="phone" class="layui-form-label">
                <span class="x-red">*</span>手机
            </label>
            <div class="layui-input-inline">
                <input type="text" id="phone" name="phone" required="" lay-verify="phone" value="${editUser.phone}"
                       autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux">
                <span class="x-red">*</span>
            </div>
        </div>
        <div class="layui-form-item">
            <label for="L_email" class="layui-form-label">
                <span class="x-red">*</span>邮箱
            </label>
            <div class="layui-input-inline">
                <input type="text" id="L_email" name="email" required="" lay-verify="email" value="${editUser.email}"
                       autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux">
                <span class="x-red">*</span>
            </div>
        </div>
        <div class="layui-form-item">
            <label id = "address" class="layui-form-label">
                <span class="x-red">*</span>省份
            </label>
            <div class="layui-input-inline">
                <select name="role">
                    <option value="重庆" <c:if test="${ediUser.address=='重庆'}"></c:if>>重庆</option>
                    <option value="四川" <c:if test="${ediUser.address=='四川'}"></c:if>>四川</option>
                    <option value="山东" <c:if test="${ediUser.address=='山东'}"></c:if>>山东</option>
                    <option value="北京" <c:if test="${ediUser.address=='北京'}"></c:if>>北京</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label for="L_pass" class="layui-form-label">
                <span class="x-red">*</span>密码
            </label>
            <div class="layui-input-inline">
                <input type="password" id="L_pass" name="pass" required="" lay-verify="pass" value="${editUser.password}"
                       autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux">
                6到16个字符
            </div>
        </div>
        <div class="layui-form-item">
            <label for="L_repass" class="layui-form-label">
                <span class="x-red">*</span>确认密码
            </label>
            <div class="layui-input-inline">
                <input type="password" id="L_repass" name="repass" required="" lay-verify="repass" value="${editUser.password}"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="L_repass" class="layui-form-label">
            </label>
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

        //自定义验证规则
        form.verify({
            name: function(value){
                if(value.length < 2){
                    return '昵称至少得2个字符啊';
                }
            }
            ,pass: [/(.+){6,12}$/, '密码必须6到12位']
            ,repass: function(value){
                if($('#L_pass').val()!=$('#L_repass').val()){
                    return '两次密码不一致';
                }
            }
        });

        //监听提交
        form.on('submit(save)', function(data){
            console.log(data);
            //拿数据
            var idValue=data.field.id;
            var nameValue=data.field.name;
            var ageValue=data.field.age;
            var phoneValue=data.field.phone;
            var emailValue=data.field.email;
            var passwordValue=data.field.pass;
            var addressValue=data.field.role;
            //发送ajax请求到服务器
            $.ajax({
                url: "${pageContext.request.contextPath}/user/save",
                type: "post",
                datatype: "json",
                data: {"id":idValue,"name":nameValue,"age":ageValue,"phone":phoneValue,
                    "email":emailValue,"address":addressValue, "password":passwordValue},
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