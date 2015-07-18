<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>village-profile-check</title>
    <link href="../css/village_index_css.css" type="text/css" rel="stylesheet">
    <link href="../css/index.css" type="text/css" rel="stylesheet">
    <% String username = request.getParameter("username"); %>
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
    <div class="content_2">
        <div class="profileTb">
            <table>
                <tr>
                    <td>
                        <div class="input-tips_1">村委会名称：</div>
                    </td>
                    <td>
                        <p id="element1" name="element1" class="inputStyle_1">
                            A村
                        </p>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="input-tips_1">地址：</div>
                    </td>
                    <td>
                        <p id="element2" name="element2" class="inputStyle_1">
                            广东省东莞市凤岗镇
                        </p>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="input-tips_1">负责人姓名：</div>
                    </td>
                    <td>
                        <p id="element3" name="element3" class="inputStyle_1">
                            陈某某
                        </p>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="input-tips_1">联系方式：</div>
                    </td>
                    <td>
                        <p id="element4" name="element4" class="inputStyle_1">
                            0769-123456789
                        </p>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="input-tips_1">三资情况：</div>
                    </td>
                    <td>
                        <p name="element5" id="element5" class="inputStyle_2">
                            资金：xxxxxxxxxx；资产：xxxxxxxxxx；资源：xxxxxxxxxx。
                        </p>
                    </td>
                </tr>
            </table>
            <div style="padding-left:300px;margin-top:20px;">
                <a href="profile_edit_v.html">
                    <input type="button" value="修改" style="width:150px;" class="button_blue">
                </a>
            </div>
        </div>
    </div>
</body>
</html>