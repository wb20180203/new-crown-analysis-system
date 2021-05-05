<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/3/14 0014
  Time: 11:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>后台登录-X-admin2.0</title>
  <meta name="renderer" content="webkit|ie-comp|ie-stand">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
  <meta http-equiv="Cache-Control" content="no-siteapp" />

  <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
  <link rel="stylesheet" href="./css/xadmin.css">
  <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
  <script src="./lib/layui/layui.js" charset="utf-8"></script>
  <script type="text/javascript" src="./js/xadmin.js"></script>

</head>
<body class="login-bg">

<div class="login">
  <div class="message">用户登录</div>
  <div id="darkbannerwrap"></div>


  <hr class="hr15">

  <form method="post" class="layui-form" id="user" >
    <input name="username" placeholder="用户名"  type="text" lay-verify="required" class="layui-input" >
    <hr class="hr15">
    <input name="password" lay-verify="required" placeholder="密码"  type="password" class="layui-input">
    <hr class="hr15">
    <input value="登录" lay-submit lay-filter="userLogin" style="width:100%;" type="submit">
    <hr class="hr20" >
  </form>



</div>

<script>
  layui.use('form', function(){
    var form = layui.form;
    //监听提交
    form.on('submit(userLogin)', function(data){

      layui.layer.alert(JSON.stringify(data.field));
      //拿到输入框里面输入的用户名和密码
      var usernameValue=data.field.username;
      var passwordValue=data.field.password;
      //使用jquery框架发ajax请求
      $.ajax({
        url:"${pageContext.request.contextPath}/user/login", //绝对路径.pageContext.request.contextPath 取虚拟目录
        // 相对路径:当前资源的路径，明确目标资源和当前资源的相对路径关系 ./user/login ==>
        // http://localhost:8080/xinguan_war_exploded/index.jsp
        type:"post", //指明请求方式, get,post方式参数放在body里面, get：参数在url上
        dateType:"json", //期望服务器返回JSON格式字符串
        data:{"username": usernameValue, "password":passwordValue}, //data指明传递参数
        success:function (result) {
          //处理响应数据
          if (result.code == 0)
          {
            layui.layer.msg(result.msg, {time:1000, icon:6}, function () {
              //延时一秒执行该方法
              location.href="./main.jsp";
            })
          }else{
            layui.layer.msg(result.msg, {icon:5});
          }

        },
        error:function (err) {
          layer.alert(JSON.stringify(err)); // 弹框显示错误
        }
      });
      return false;
    });
  });


</script>

</body>
</html>