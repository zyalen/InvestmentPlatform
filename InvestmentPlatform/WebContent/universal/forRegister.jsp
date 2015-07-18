<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="userControl" class="control.UserControl"></jsp:useBean>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>For Register</title>
</head>
<body>
	<%
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	String usertype = (request.getParameter("usertype"));
	if(userControl.register(username, password, usertype)) {
		response.sendRedirect("register_success.html");
	} else {
		response.sendRedirect("register.jsp?error=1");
	}
	%>
</body>
</html>