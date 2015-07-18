<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html">
<jsp:useBean id="userControl" class="control.UserControl"></jsp:useBean>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; UTF-8">
<title>Check Login</title>
</head>
<body>
	<%
	session.invalidate();
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	String errflag = userControl.login(username, password);
	String usertype;
	if(errflag.substring(0, 1).equals("0")) {
		usertype = errflag.substring(1, 2);
		if(usertype.equals("1")) {
			// Village
			response.sendRedirect("../village/villageManage.jsp?username=" + username);
		} else if(usertype.equals("2")) {
			// Enterprise
			response.sendRedirect("../enterprise/enterpriseManage.jsp?username=" + username);
		} else {
			// Government
			response.sendRedirect("../government/governmentManage.jsp?username=" + username);
		}
	} else {
		response.sendRedirect("login.jsp?errflag=" + errflag);
	}
	%>
</body>
</html>