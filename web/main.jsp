<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/3/15 0015
  Time: 15:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh-cn">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <title>数据分析系统</title>
    <link rel="stylesheet" href="css/pintuer.css">
    <link rel="stylesheet" href="css/admin.css">
    <link rel="stylesheet" href="./css/xadmin.css">
    <script src="js/jquery-3.2.1.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="./lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="./js/xadmin.js"></script>


    <style>
        html,body{
            height: 90%;
        }
    </style>

</head>
<body style="height: 100%;" >
<div class="header bg-main">
    <div class="logo margin-big-left fadein-top" >
        <h1>
            <img src="images/y.jpg" class="radius-circle rotate-hover" height="40" alt="" />
            ${loginUser.name} <%--用el表达式访问session的表达式--%>
        </h1>
    </div>
    <div class="head-l">
        <a href="javascript:openUrl('userData.jsp')" class="button button-little bg-green button-small"  >首页</a> &nbsp;&nbsp;
        <a href="javascript:openUrl('${pageContext.request.contextPath}/user/listByPage')" class="button-small button button-little bg-green"  >用户列表</a> &nbsp;&nbsp;
        <a href="javascript:openUrl('${pageContext.request.contextPath}/info/province')" class="button-small button button-little bg-green"  >疫情信息</a> &nbsp;&nbsp;
        <a href="#" class="button-small button button-little bg-blue" onclick="x_admin_show('修改密码','update-pwd.html',500,300)"> 修改密码</a> &nbsp;&nbsp;
        <a href="${pageContext.request.contextPath}/user/logout" class="button-small button button-little bg-red"> 退出登录</a>
    </div>
</div>

<div style="height: 100%;">
    <iframe scrolling="auto" rameborder="0" src="${pageContext.request.contextPath}/data/home" name="right" width="100%" height="100%"></iframe>
</div>

</body>
</html>
<script>
    //打开中间页面
    function openUrl(url){
        $("iframe").attr("src",url)
    }
</script>
