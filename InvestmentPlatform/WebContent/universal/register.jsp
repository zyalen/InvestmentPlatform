<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>VillagePal-register</title>
    <link href="../css/register_css.css" type="text/css" rel="stylesheet">
    <script type="text/javascript">
    function comfirm(){
    	var pw1 = document.getElementById("pw1").value;
    	var pw2 = document.getElementById("pw2").value;
    	if(pw2 != "" && pw1 != pw2) {
    		document.getElementById("differentPW").innerHTML="<font color='red'>密码不一致</font>";
    		document.getElementById("submit").disabled=true;
    	} else {
    		document.getElementById("differentPW").innerHTML="";
    		document.getElementById("submit").disabled=false;
    	}
    }
    </script>
</head>
<body>
<div class="container">
    <div class="heading">
        <img src="../images/welcome.png">
        <hr align="center" width="100%" size="3px" color="#ff7f50">
    </div>

    <div class="left">
        <img src="../images/VillagePal_logo.png" width="324px" height="216px">
    </div>
    <div class="line">
        <hr align="center" width="1px" size="280px" color="#ff7f50">
    </div>
    <div class="register">
        <div class="register_form">
            <form action="forRegister.jsp" name="registerform" accept-charset="utf-8" class="registerForm"
                  method="post">
                <div class="uinArea">
                    <label class="input-tips">帐号：</label>
                    <div class="inputOuter">
                        <input type="text" name="username" class="inputStyle" placeholder="请输入账号" 
                        	autocomplete="on" required="required" maxlength="20">
                    </div>
                </div>
                <div class="pwdArea">
                    <label class="input-tips">密码：</label>
                    <div class="inputOuter">
                        <input type="password" class="inputStyle" id="pw1" placeholder="请输入密码"
                        	required="required" maxlength="20">
                    </div>
                </div>
                <div class="pwdArea">
                    <label class="input-tips">确认密码：</label>
                    <div class="inputOuter">
                        <input type="password" name="password" id="pw2" class="inputStyle" 
                        	placeholder="再次输入密码" required="required" maxlength="20" onkeyup="comfirm()"><span id="differentPW"></span>
                    </div>
                </div>
                <div class="roleArea">
                    <label class="input-tips">选择身份：</label>
                    <div class="chooseRole">
                        <input type="radio" name="usertype" checked="checked" value="1">村集体
                        <input type="radio" name="usertype" value="2">企业
                    </div>
                </div>
                <div style="padding-left:80px;margin-top:20px;">
                    <input type="submit" value="确定" id="submit" style="width:150px;" class="button_blue">
   					<%
   					if(request.getParameter("error") != null) {
   					%>
    					<p><font color="red">注册失败</font></p>
    				<%
   					}
					%>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>