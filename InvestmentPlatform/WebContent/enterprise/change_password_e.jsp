<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>enterprise-change-password</title>
    <link href="../css/enterprise_index_css.css" type="text/css" rel="stylesheet">
    <link href="../JS/JBox/Skins/Blue/jbox.css" rel="stylesheet" type="text/css"/>
    <script src="../JS/jBox/jquery-1.4.2.min.js" type="text/javascript"></script>
    <script src="../JS/jBox/jquery.jBox-2.3.min.js" type="text/javascript"></script>
    <script type="text/javascript" language="javascript">
    function comfirm(){
    	var pw1 = document.getElementById("pw1").value;
    	var pw2 = document.getElementById("pw2").value;
    	if(pw2 != "" && pw1 != pw2) {
    		document.getElementById("different").innerHTML="<font color='red'>密码不一致</font>";
    		document.getElementById("submit").disabled=true;
    	} else {
    		document.getElementById("different").innerHTML="";
    		document.getElementById("submit").disabled=false;
    	}
    }
    </script>
    <%
    String username = request.getParameter("username");
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
                <li class="last"><a href=<%="enterpriseManage.jsp?logout=1" %>>注销</a></li>
            </ul>
        </div>
    </div>
    <div class="content_1">
        <div class="register">
            <div class="register_form">
                <form action="enterpriseManage.jsp" name="changepw" accept-charset="utf-8" method="post">
                	<div class="pwdArea">
                   		<label class="input-tips">新密码：</label>
                    	<div class="inputOuter">
                        	<input type="password" id="pw1" class="inputStyle" 
                        		placeholder="请输入新密码" required="required" maxlength="20">
                    	</div>
                	</div>
                	<div class="pwdArea">
                    	<label class="input-tips">确认密码：</label>
                    	<div class="inputOuter">
                        	<input type="password" name="password" id="pw2" class="inputStyle" 
                        		placeholder="再次输入密码" required="required" maxlength="20" onkeyup="comfirm()"><span id="different"></span>
                    	</div>
                	</div>
                	<div style="padding-left:90px;margin-top:20px;">
                    	<input type="submit" id="submit" value="确定" style="width:150px;" class="button_blue">
                    	<%
                    	String error = request.getParameter("error");
                    	if(error != null) {
                    		if(error.equals("1")) {
                    			%>
                    			<font color="red">修改密码失败</font>
                    			<%
                    		}
                    	}
                    	%>
                	</div>
            	</form>
            </div>
        </div>
    </div>
</div>
</body>
</html>