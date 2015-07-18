<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>enterprise-profile-check</title>
    <link href="../css/village_index_css.css" type="text/css" rel="stylesheet">
    <link href="../css/index.css" type="text/css" rel="stylesheet">
	<script type="text/javascript">
                function changeContent(){
                    var o1 = document.getElementById("element1");
                    var c1 = o1.innerHTML;
                    var _o1 = document.getElementById("td1");
                    _o1.innerHTML = "<input class='inputStyle_1' name='e1' "
                    	+"maxlength='100' required='required' value='"
                    	+c1+"'/>";

                    var o2 = document.getElementById("element2");
                    var c2 = o2.innerHTML;
                    var _o2 = document.getElementById("td2");
                    _o2.innerHTML = "<input class='inputStyle_1' name='e2' "
                    	+"maxlength='10' required='required' value='"
                    	+c2+"'/>";

                    var o3 = document.getElementById("element3");
                    var c3 = o3.innerHTML;
                    var _o3 = document.getElementById("td3");
                    _o3.innerHTML = "<input class='inputStyle_1' name='e3' "
                    	+"maxlength='100' required='required' value='"
                    	+c3+"'/>";

                    var o4 = document.getElementById("element4");
                    var c4 = o4.innerHTML;
                    var _o4 = document.getElementById("td4");
                    _o4.innerHTML = "<input class='inputStyle_1' name='e4' "
                    	+"maxlength='10' required='required' value='"
                    	+c4+"'/>";
                   
                    var o5 = document.getElementById("element5");
                    var c5 = o5.innerHTML;
                    var _o5 = document.getElementById("td5");
                    _o5.innerHTML = "<input class='inputStyle_1' name='e5' "
                    	+"maxlength='20' required='required' value='"
                    	+c5+"'/>";
                    
                    var o6 = document.getElementById("element6");
                    var c6 = o6.innerHTML;
                    var _o6 = document.getElementById("td6");
                    _o6.innerHTML = "<input class='inputStyle_1' name='e6' "
                    	+"maxlength='30' required='required' value='"
                    	+c6+"'/>";

                    var o7 = document.getElementById("element7");
                    var c7 = o7.innerHTML;
                    var _o7 = document.getElementById("td7");
                    _o7.innerHTML = "<textarea class='inputStyle_2' name='e7' "
                    	+"maxlength='255' required='required'>"+c7+"</textarea>";
                    	
                    var submit = document.getElementById("submit");
                    submit.disabled=false;
                }
    </script>

    <%
    String username = request.getParameter("username");
    String[] elements = new String[7];
    elements[0] = (String)session.getAttribute("company");
    elements[1] = (String)session.getAttribute("barCode");
    elements[2] = (String)session.getAttribute("address");
    elements[3] = (String)session.getAttribute("realname");
    elements[4] = (String)session.getAttribute("tel");
    elements[5] = (String)session.getAttribute("asset");
    elements[6] = (String)session.getAttribute("state");
    for(int i = 0; i < 7; i++) {
    	if(elements[i] == null) {
    		elements[i] = "";
    	}
    }
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
                <li class="first"><a href=<%="../enterprise/enterprise_index.jsp?username=" + username %>>首页</a></li>
                <li>
                    <span class="Darrow"></span>
                    <a href="#">管理个人信息</a>
                    <dl>
                        <dt><span class="arrow"></span></dt>
                        <dd><a href=<%="change_password_e.jsp?username=" + username %>>修改密码</a></dd>
                        <dd><a href=<%="check_profile_e.jsp?username=" + username%>>查看个人信息</a></dd>
                    </dl>
                </li>
                <li>
                    <a href=<%="all_project_page1_e.jsp?username=" + username %>>投资项目</a>
                <li>
                <li>
                    <span class="Darrow"></span>
                    <a href="#">查看平台用户</a>
                    <dl>
                        <dt><span class="arrow"></span></dt>
                        <dd><a href=<%="all_village_page1_e.jsp?username=" + username %>>查看村集体</a></dd>
                        <dd><a href=<%="all_enterprise_page1_e.jsp?username=" + username %>>查看企业</a></dd>
                    </dl>
                </li>
                <li class="last"><a href="<%="enterpriseManage.jsp?logout=1" %>">注销</a></li>
            </ul>
        </div>
    </div>
    <div class="content_2">
        <div class="profileTb">
        <form action="enterpriseManage.jsp" name="check_profile" accept-charset="utf-8" method="GET">
            <table>
                <tr>
                    <td>
                        <div class="input-tips_1">企业名称：</div>
                    </td>
                    <td id="td1">
                        <p id="element1" name="element1" class="inputStyle_1"><%=elements[0] %></p>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="input-tips_1">注册号：</div>
                    </td>
                    <td id="td2">
                        <p id="element2" name="element2" class="inputStyle_1"><%=elements[1] %></p>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="input-tips_1">注册地址：</div>
                    </td>
                    <td id="td3">
                        <p id="element3" name="element3" class="inputStyle_1"><%=elements[2] %></p>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="input-tips_1">法人代表：</div>
                    </td>
                    <td id="td4">
                        <p id="element4" name="element4" class="inputStyle_1"><%=elements[3] %></p>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="input-tips_1">联系方式：</div>
                    </td>
                    <td id="td5">
                        <p id="element5" name="element5" class="inputStyle_1"><%=elements[4] %></p>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="input-tips_1">注册资本：</div>
                    </td>
                    <td id="td6">
                        <p id="element6" name="element6" class="inputStyle_1"><%=elements[5] %></p>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="input-tips_1">企业说明：</div>
                    </td>
                    <td id="td7">
                        <p name="element7" id="element7" class="inputStyle_2"><%=elements[6] %></p>
                    </td>
                </tr>
            </table>

            <div style="margin-left:220px;margin-top:20px;margin-right: 20px;float: left">
                <input type="button" value="修改" style="width:150px;" class="button_blue" onclick="changeContent()">
            </div>

            <div style="margin-top:20px;">
                <input id="submit" type="submit" value="保存" style="width:150px;" class="button_blue" disabled="disabled">
            </div>
            </form>

        </div>
    </div>
</body>
</html>