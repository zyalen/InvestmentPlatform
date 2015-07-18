<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html">
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>VillagePal-login</title>
    <link href="../css/login_css.css" type="text/css" rel="stylesheet">
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
        <div class="login">
            <div class="login_form">
                <form action="loginCheck.jsp" name="loginform" accept-charset="utf-8" class="loginForm"
                      method="post" autofocus="autofocus">
                    <div class="uinArea">
                        <label class="input-tips">帐号：</label>
                        <div class="inputOuter">
                            <input type="text"  onkeyup="value=value.replace(/[^\w\.\/]/ig,'')"
                            	name="username" class="inputStyle" placeholder="请输入账号" 
                            	autocomplete="on"  required="required" maxlength="20" >
                        </div>
                    </div>
                    <div class="pwdArea">
                        <label class="input-tips">密码：</label>
                        <div class="inputOuter">
                            <input type="password" name="password" class="inputStyle" placeholder="请输入密码"
                            	 required="required" maxlength="20">
                        </div>
                    </div>
                    <%
					try {
						String errflag = request.getParameter("errflag");
						// 1: can't find username
						// 2: can't find password
						if(errflag != null) {
							if(errflag.equals("1")) {
								out.println("<font color='red'>找不到用户名</font>");
							} else if(errflag.equals("2")) {
								out.println("<font color='red'>密码错误</font>");
							} else if(errflag.equals("3")){
								out.println("<font color='red'>未知错误</font>");
							}
						}
					} catch(Exception e) {
						System.out.println(e);
						// e.printStackTrace();
					}
					%>
                    <div style="padding-left:80px;margin-top:20px;">
                        <input type="submit" value="登 录" style="width:150px;" class="button_blue">
                    </div>
                    <br/>
                    <div style="padding-left:80px;margin-top:20px;">
                        <a href="register.jsp">
                            <input type="button" value="注册" style="width:150px;" class="button_blue">
                        </a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>