<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	<link rel="stylesheet" type="text/css" >

    <title>YOUR音乐播放器</title>
    <script src="bmob-min.js"></script>
    <script src="bmobSocketIo.js"></script>
    <script src="bmobSocketIo-min.js"></script>
    <script type="text/javascript" src="jquery.min.js"></script>
    <script type="text/javascript" src="bmob.js"></script>
    <link rel="shortcut icon" href="img_musicplayer/bigicon.png" type="image/x-icon"/>
 <script type="text/javascript">
        Bmob.initialize("e71de293b16addd1ded15236810102b9", "f722c79b7725c8a68645b8ce602a4e8f");

        function loginClick() {
            var name = document.getElementById("name").value;
            var password = document.getElementById("password").value;
            var GameScore = Bmob.Object.extend("User_Login");
            var query = new Bmob.Query(GameScore);
            localStorage.setItem('username',name);
// 查询所有数据
            if(name == ""){
                alert("用户名不能为空！");
                return false;
            }
            else if(password == "") {
                alert("密码不能为空！");
                return false;
            }
            else{
                query.find({
                    success: function(results) {
                        // 循环处理查询到的数据
                        for (var i = 0; i < results.length; i++) {
                            var object = results[i];
                            var olduser = object.get("User_ID");
                            if(name == olduser){
                                var oldpassword = object.get("User_Password");
                                if(password == oldpassword){
                                    alert("登陆成功！");
                                    window.location.href="playlist.jsp";
                                   break;
                                }
                                else {
                                    alert("密码错误！");
                                }
                            }
                            else if(i == results.length-1){
                                alert("该账号未注册！");
                            }
                            }
                    },
                    error: function(error) {
                        alert("登陆失败！")
                    }
                });
            }
        }


    </script>
 <style type="text/css">
  @-webkit-keyframes greenPulse {
        from { background-color: #5f9ea0; -webkit-box-shadow: 0 0 9px #333; }
        50% { background-color:#add8e6; -webkit-box-shadow: 0 0 18px #add8e6; }
        to { background-color: #5f9ea0; -webkit-box-shadow: 0 0 9px #333; }
    }
    .button {
        -webkit-animation-name: greenPulse;
        -webkit-animation-duration: 4s;
        -webkit-animation-iteration-count: infinite;
        border: solid 1px;
        border-radius: 10px;
    }
    .tableback{
     background:url("img_musicplayer/tableb1.png");
        margin:auto;
        margin-top:18%;
        align:center;
    }
 </style>
</head>
	
  
<body style="background-image:url(img_musicplayer/1034.jpg);background-size:cover;background-repeat:no-repeat">
<div>
    <form id="form2">
        <table class="tableback" width="300" height="150">
        <tr align="center">
            <td>用户名</td>
            <td><input type="text" id="name" size="20" maxlength="20"></td>
        </tr>
        <tr align="center">
            <td>密码</td>
            <td><input type="password" id="password" size="20" maxlength="20"></td>
        </tr>
        </table>
         <table background="img_musicplayer/tableb1.png"  align="center" width="300" height="50">
            <tr align="center" >
                <td><button type="button" value="登陆" class="button" onclick="loginClick()">登陆</button></td>
                <td><a href="musiclogin.jsp"><input type="button" value="注册" class="button"></input></a></td>
            </tr>
        </table>
    </form>
</div>
    
</body>
</html>
