<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>village-index</title>
    <link href="../css/village_index_css.css" type="text/css" rel="stylesheet">
    <link href="../css/index.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../JS/jquery.min.js"></script>
    <script type="text/javascript" src="../JS/sliders.js"></script>
    <%
    String username = (String)session.getAttribute("username");
    %>
</head>
<body>
<div class="container">
    <div class="heading">
        <div class="logo">
            <img src="../images/VillagePal_logo.png" width="162px" height="108px">
        </div>
        <div class="nav_bar">
            <ul class="clear">
                <li class="first"><a href=<%="../village/village_index.jsp?username=" + username %>>首页</a></li>
                <li>
                    <span class="Darrow"></span>
                    <a href="#">管理个人信息</a>
                    <dl>
                        <dt><span class="arrow"></span></dt>
                        <dd><a href=<%="change_password_v.jsp?username=" + username %>>修改密码</a></dd>
                        <dd><a href=<%="check_profile_v.jsp?username=" + username%>>查看个人信息</a></dd>
                    </dl>
                </li>
                <li>
                    <span class="Darrow"></span>
                    <a href="#">招商引资</a>
                    <dl>
                        <dt><span class="arrow"></span></dt>
                        <dd><a href=<%="publish_project_v.jsp?username=" + username %>>发布项目</a></dd>
                        <dd><a href=<%="check_project_page1_v.jsp?username=" + username %>>管理项目</a></dd>
                    </dl>
                </li>
                <li>
                    <a href=<%="all_project_page1_v.jsp?username=" + username %>>投资项目</a>
                <li>
                <li>
                    <span class="Darrow"></span>
                    <a href="#">查看平台用户</a>
                    <dl>
                        <dt><span class="arrow"></span></dt>
                        <dd><a href=<%="all_village_page1_v.jsp?username=" + username %>>查看村集体</a></dd>
                        <dd><a href=<%="all_enterprise_page1_v.jsp?username=" + username %>>查看企业</a></dd>
                    </dl>
                </li>
                <li class="last"><a href="villageManage.jsp?logout=1">注销</a></li>
            </ul>
        </div>
    </div>
    <div class="content_0">
    <div class="banner">
        <div id="slide-holder">
            <div id="slide-runner">
                <img id="slide-img-1" src="../images/凤岗镇雁田村.png">
                <img id="slide-img-2" src="../images/长安镇咸西村.png">
                <img id="slide-img-3" src="../images/虎门镇金洲村.png">
                <img id="slide-img-4" src="../images/南城街道周溪村.png">

                <div id="slide-controls">
                    <p id="slide-client" class="text"><strong></strong><span></span></p>

                    <p id="slide-desc" class="text"></p>

                    <p id="slide-nav"></p>
                </div>
            </div>
        </div>
        <script>
            if (!window.slider) {
                var slider = {};
            }

            slider.data = [
                {
                    "id": "slide-img-1", // 与slide-runner中的img标签id对应
                    "client": "东莞市凤岗镇雁田村",
                    "desc": ""
                },
                {
                    "id": "slide-img-2",
                    "client": "东莞市长安镇咸西村",
                    "desc": ""
                },
                {
                    "id": "slide-img-3",
                    "client": "东莞市虎门镇金洲村",
                    "desc": ""
                },
                {
                    "id": "slide-img-4",
                    "client": "东莞市南城街道周溪村",
                    "desc": ""
                }
            ];
        </script>
    </div>
</div>
</div>
</body>
</html>