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
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	--><title>YOUR音乐播放器</title>
    <script src="bmob-min.js"></script>
    <script src="bmobSocketIo.js"></script>
    <script src="bmobSocketIo-min.js"></script>
    <script type="text/javascript" src="jquery.min.js"></script>
    <script type="text/javascript" src="bmob.js"></script>
    <script type="text/javascript" src="jquery.js"></script>
    <link rel="stylesheet" type="text/css"/>
    <link rel="shortcut icon" href="http://ozec80sj2.bkt.clouddn.com/icon.png" type="image/x-icon"/>

<style type="text/css">
.myplayer{
    margin:100px auto;
    border:1px solid #dddddd;
    width:650px;
}

#t_wrapper{
    position:relative;
    width:600px;
    margin:0px auto;
    height:30px;
    -webkit-touch-callout: none;
    -webkit-user-select: none;
    -khtml-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
}


#playlist{
    display:block;
    background:url("img_musicplayer/table3.png");
    color:#ffffff;
    width:550px;
    margin:0px auto;
}
#playlist ul{
    padding-right: 40px;
}

#playlist li{
    display:flex;
    flex-direction: row;
    flex-wrap:nowrap;
    justify-content:space-between;
    align-items:center;
    height:35px;
    padding-left:7px;
    border-bottom: 1px solid rgba(255,255,255,0.2);
    white-space: nowrap;
    flex-grow: 1;
}

#playlist li:hover{
    background:rgba(255,255,255,0.3);
}

#playlist a{
    display:block;
    width:100%;
    height:100%;
    color:#fff;
    text-decoration:none;
    line-height:40px;
    font-weight:300;
    text-overflow: ellipsis;
}

/* savelist style*/
#savelist{
    display:none;
    background:url("img_musicplayer/table3.png");
    color:#ffffff;
    width:550px;
    margin:0px auto;
}
#savelist ul{
    padding-right: 40px;
}

#savelist li{
    display:flex;
    flex-direction: row;
    flex-wrap:nowrap;
    justify-content:space-between;
    align-items:center;
    height:35px;
    padding-left:7px;
    border-bottom: 1px solid rgba(255,255,255,0.2);
    white-space: nowrap;
    flex-grow: 1;
}

#savelist li:hover{
    background:rgba(255,255,255,0.3);
}

#savelist a{
    display:block;
    width:100%;
    height:100%;
    color:#fff;
    text-decoration:none;
    line-height:40px;
    font-weight:300;
    text-overflow: ellipsis;
}
/* 列表标题 style*/
.container{
    width: 100%;
    position:relative;
    text-align: center;
}

.a_demo_four {
    background-color:#d06280;
    font-family: 'Open Sans', sans-serif;
    font-size:12px;
    text-decoration:none;
    color:#fff;
    position: relative;
    padding:10px 20px;
    padding-right: 50px;
    background-image: linear-gradient(bottom, #c43b62 0%, #d06280 100%);
    background-image: -o-linear-gradient(bottom, #c43b62 0%, #d06280 100%);
    background-image: -moz-linear-gradient(bottom, #c43b62 0%, #d06280 100%);
    background-image: -webkit-linear-gradient(bottom, #c43b62 0%, #d06280 100%);
    background-image: -ms-linear-gradient(bottom, #c43b62 0%, #d06280 100%);
    background-image: -webkit-gradient(
            linear,
            left bottom,
            left top,
            color-stop(0, #c43b62),
            color-stop(1, #d06280)
    );
    -webkit-border-radius: 5px;
    -moz-border-radius: 5px;
    -o-border-radius: 5px;
    border-radius: 5px;
    -webkit-box-shadow: inset 0px 1px 0px #d06280, 0px 5px 0px 0px #982e4b, 0px 10px 5px #999;
    -moz-box-shadow: inset 0px 1px 0px #d06280, 0px 5px 0px 0px #982e4b, 0px 10px 5px #999;
    -o-box-shadow: inset 0px 1px 0px #d06280, 0px 5px 0px 0px #982e4b, 0px 10px 5px #999;
    box-shadow: inset 0px 1px 0px #d06280, 0px 5px 0px 0px #982e4b, 0px 10px 5px #999;
}

.a_demo_four:active {
    top:3px;
    background-image: linear-gradient(bottom,#d06280 0%, #c43b62 100%);
    background-image: -o-linear-gradient(bottom,#d06280 0%, #c43b62 100%);
    background-image: -moz-linear-gradient(bottom, #d06280 0%,#c43b62 100%);
    background-image: -webkit-linear-gradient(bottom, #d06280 0%, #c43b62 100%);
    background-image: -ms-linear-gradient(bottom, #d06280 0%, #c43b62 100%);
    background-image: -webkit-gradient(
            linear,
            left bottom,
            left top,
            color-stop(0,#d06280),
            color-stop(1, #c43b62)
    );
    -webkit-box-shadow: inset 0px 1px 0px #d06280, 0px 2px 0px 0px #982e4b, 0px 5px 3px #999;
    -moz-box-shadow: inset 0px 1px 0px #d06280, 0px 2px 0px 0px #982e4b, 0px 5px 3px #999;
    -o-box-shadow: inset 0px 1px 0px #d06280, 0px 2px 0px 0px #982e4b, 0px 5px 3px #999;
    box-shadow: inset 0px 1px 0px #d06280, 0px 2px 0px 0px #982e4b, 0px 5px 3px #999;
}

.a_demo_four::before {
    background-color:#c43b62;
    background-image:url("http://ozec80sj2.bkt.clouddn.com/right_arrow.png");
    background-repeat:no-repeat;
    background-position:center center;
    content:"";
    width:20px;
    height:20px;
    position:absolute;
    right:15px;
    top:50%;
    margin-top:-9px;
    -webkit-border-radius: 50%;
    -moz-border-radius: 50%;
    -o-border-radius: 50%;
    border-radius: 50%;
    -webkit-box-shadow: inset 0px 1px 0px #3b121d, 0px 1px 0px #d06280;
    -moz-box-shadow: inset 0px 1px 0px #3b121d, 0px 1px 0px#d06280;
    -o-box-shadow: inset 0px 1px 0px #3b121d, 0px 1px 0px #d06280;
    box-shadow: inset 0px 1px 0px #3b121d, 0px 1px 0px#d06280;
}

.a_demo_four:active::before {
    top:50%;
    margin-top:-12px;
    -webkit-box-shadow: inset 0px 1px 0px #d06280, 0px 3px 0px #4e1827, 0px 6px 3px #621e30 ;
    -moz-box-shadow: inset 0px 1px 0px #d06280, 0px 3px 0px #4e1827, 0px 6px 3px #621e30;
    -o-box-shadow: inset 0px 1px 0px #d06280, 0px 3px 0px #4e1827, 0px 6px 3px #621e30;
    box-shadow: inset 0px 1px 0px #d06280, 0px 3px 0px #4e1827, 0px 6px 3px #621e30;
}

.saveimg{
    height:20px;
    width:20px;
}

#zhuxiao{
    display:flex;
    flex-direction: row;
    justify-content:flex-end;
}

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
</style>
<script type="text/javascript">
    Bmob.initialize("e71de293b16addd1ded15236810102b9", "f722c79b7725c8a68645b8ce602a4e8f");
    // 切换DIV（全部列表收藏列表的切换实现）

    //调取用户ID
   var loginer = localStorage.getItem('username');


    //从数据库中调取所有音乐资源
    var str = '<ul>';
    var Score = Bmob.Object.extend("Music");
    var query = new Bmob.Query(Score);
    query.find({
        success: function (all_results) {
            //渲染前先从收藏数据表里通过个人的ID获取所有收藏的歌曲
            var GameScore = Bmob.Object.extend("Save");
            var query1 = new Bmob.Query(GameScore);
            // 查询所有数据
            query1.find({
                success: function (coll_results) {
                    // 循环处理查询到的数据
                    var coll_arr = [];
                    for (var i = 0; i < coll_results.length; i++) {
                        var coll_object = coll_results[i];
                        var saver = coll_object.get('saver');
                        var songname = coll_object.get('songname');
                        if (loginer == saver) {
                            coll_arr.push(songname);
                        }
                        else {
                        }
                    }
                    //从数据库中调取用户收藏的音乐资源
                    for (var j = 0; j < all_results.length; j++) {
                        var all_object = all_results[j];
                        var musicname = all_object.get('musicname');
                        if($.inArray(musicname,coll_arr) != -1){
                            var author = all_object.get('author');
                            var from = all_object.get('musicfrom');
                            var img_id = all_object.id;
                            document.getElementById("playlist").innerHTML += "<li>" + "<a href='" + from + "'target='_blank'>" + musicname + '    -    ' + author + "</a>" + "<image value ='" + musicname + "' link ='" + from + "' singer ='" + author + "' state = 'true' src='3.png' id='" + img_id + "' class='saveimg'onclick='save(this)'></image> " + "</li>";
                        }
                        else{
                            var author = all_object.get('author');
                            var from = all_object.get('musicfrom');
                            var img_id = all_object.id;
                            document.getElementById("playlist").innerHTML += "<li>" + "<a href='" + from + "'target='_blank'>" + musicname + '    -    ' + author + "</a>" + "<image value ='" + musicname + "' link ='" + from + "' singer ='" + author + "' state = 'false' src='1.png' id='" + img_id + "' class='saveimg'onclick='save(this)'></image> " + "</li>";
                        }
                    }
                    str += '<ul>';
                },
                error: function (error) {
                    alert("查询失败: " + error.code + " " + error.message);
                }
            });
        },
        error: function (error) {
            alert("查询失败: " + error.code + " " + error.message);
        }
    });

//收藏按钮
    function save(obj) {
        var state=obj.getAttribute('state');
        var coll_id=obj.getAttribute('id');
        var gequ=obj.getAttribute('value');
        var yinyuan=obj.getAttribute('link');
        var geshou=obj.getAttribute('singer');
        if(state == 'true'){
            //点击取消收藏功能
            //查询这条已收藏的数据
            var Delete = Bmob.Object.extend("Save");
            var queryD = new Bmob.Query(Delete);
            queryD.equalTo("saver", loginer);
            queryD.equalTo("songfrom", yinyuan);
// 查询所有数据
            queryD.find({
                success: function(findresults) {
                var iddd = findresults[0].id;
                    //删除收藏表中的数据
                    queryD.get(iddd, {
                        success: function(object) {
                            object.destroy({
                                success: function(deleteObject) {
                                    alert("取消收藏成功");
                                   obj.setAttribute('state','false');
                                   obj.setAttribute('src',"1.png");
                                },
                                error: function(GameScoretest, error) {
                                    alert("取消收藏失败");
                                }
                            });
                        },
                        error: function(object, error) {
                        }
                    });
                },
                error: function(error) {
                }
            });
        }
        else{
//点击添加收藏功能
            var SaveData = Bmob.Object.extend("Save");
            var savedata = new SaveData();
            savedata.set("saver",loginer);
            savedata.set("songname", gequ);
            savedata.set("songauthor", geshou);
            savedata.set("songfrom", yinyuan);
            savedata.save(null, {
                success: function(object) {
                    alert("收藏成功");
                   obj.setAttribute('state','true');
                    obj.setAttribute('src',"3.png");
                },
                error: function(model, error) {
                    alert("收藏失败");
                }
            });
        }
    }

    //收藏列表渲染
    var str0 = '<ul>';
    var Score0 = Bmob.Object.extend("Save");
    var query0 = new Bmob.Query(Score0);
    query0.find({
        success: function(results0) {
            for (var i = 0; i < results0.length; i++) {
                var object0 = results0[i];
                var savesongname = object0.get('songname');
                var savesongauthor = object0.get('songauthor');
                var savesongfrom = object0.get('songfrom');
                var savesaver = object0.get('saver');
                var img_id0 =  object0.id;
                if(savesaver == loginer ){
                document.getElementById("savelist").innerHTML += "<li>" + "<a href='" + savesongfrom + "'target='_blank'>" + savesongname + '    -    ' + savesongauthor + "</a>" + "<image value ='" + savesongname + "' link ='" + savesongfrom + "' singer ='" + savesongauthor + "' state = 'true' src='3.png' id='" + img_id0 + "' class='saveimg'onclick='unsave(this)'></image> "+"</li>";
                                          }str0 +='<ul>';
            }
        },
        error: function(error) {
            alert("查询失败: " + error.code + " " + error.message);
        }
    });

    function unsave(obj) {
        var state=obj.getAttribute('state');
        var coll_id=obj.getAttribute('id');
        var gequ=obj.getAttribute('value');
        var yinyuan=obj.getAttribute('link');
        var geshou=obj.getAttribute('singer');
        if(state == 'true'){
            //点击取消收藏功能
            //查询这条已收藏的数据
            var Delete = Bmob.Object.extend("Save");
            var queryD = new Bmob.Query(Delete);
            queryD.equalTo("saver", loginer);
            queryD.equalTo("songfrom", yinyuan);
// 查询所有数据
            queryD.find({
                success: function(findresults) {
                    var iddd = findresults[0].id;
                    //删除收藏表中的数据
                    queryD.get(iddd, {
                        success: function(object) {
                            object.destroy({
                                success: function(deleteObject) {
                                    alert("取消收藏成功");
                                    obj.setAttribute('state','false');
                                    obj.setAttribute('src',"1.png");
                                },
                                error: function(GameScoretest, error) {
                                    alert("取消收藏失败");
                                }
                            });
                        },
                        error: function(object, error) {
                        }
                    });
                },
                error: function(error) {
                }
            });
        }
        else{
//点击添加收藏功能
            var SaveData = Bmob.Object.extend("Save");
            var savedata = new SaveData();
            savedata.set("saver",loginer);
            savedata.set("songname", gequ);
            savedata.set("songauthor", geshou);
            savedata.set("songfrom", yinyuan);
            savedata.save(null, {
                success: function(object) {
                    alert("收藏成功");
                    obj.setAttribute('state','true');
                    obj.setAttribute('src',"3.png");

                },
                error: function(model, error) {
                    alert("收藏失败");
                }
            });
        }
    }


</script>
  </head>
  
<body style="background-image:url(img_musicplayer/10341T306-7.jpg);background-size:cover;background-repeat:no-repeat">
<div id="zhuxiao">
    <a href="index.jsp"><input type="button" value="注销" class="button"></input></a>
</div>
<div class="myplayer">
    <div id="t_wrapper">
        <div class="container">
            <header>
                <nav>
                    <a href="playlist.jsp" class="a_demo_four">全部列表</a>
                  
                </nav>
            </header>
        </div>
    </div>
    <div id="playlist" class="playlist">
    </div>
 
</div>
  </body>
</html>
