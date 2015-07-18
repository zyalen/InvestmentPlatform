<%@page import="javax.websocket.Session"%>
<%@page import="entity.Project"%>
<%@page import="entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="userControl" class="control.UserControl"></jsp:useBean>
<jsp:useBean id="projectControl" class="control.ProjectControl"></jsp:useBean>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Village Manager</title>
<%
// Request URL
String username = (String) session.getAttribute("username");
String requestPage = request.getHeader("referer");
String server = request.getServerName();
String port = Integer.toString(request.getServerPort());
String realPage = requestPage.substring(requestPage.indexOf(port) + port.length(), requestPage.indexOf(".jsp"));
%>
</head>
<body>
<%
if(request.getParameter("logout") != null) {
	session.invalidate();
	userControl.logout();
	response.sendRedirect("../universal/login.jsp");
	
} else if(realPage.equals("/InvestmentPlatform/universal/login")) {
	
	// User info
	username = request.getParameter("username");
	response.sendRedirect("government_index.jsp?username="+username);
	
	// All villages
	String[][] allVillages = userControl.getAllUser(1, "1");
	session.setAttribute("allUsers", allVillages);
	int villageCount = userControl.getUserCount("1");
	session.setAttribute("villageCount", villageCount);
	
	// All enterprises
	String[][] allEnterprises = userControl.getAllUser(1, "2");
	session.setAttribute("allEnterprises", allEnterprises);
	int enterpriseCount = userControl.getUserCount("2");
	session.setAttribute("enterpriseCount", enterpriseCount);
	
	// All projects
	int allProjectsCount = projectControl.getProjectCounts();
	session.setAttribute("allProjectsCount", allProjectsCount);
	String[][] allProjects = projectControl.getAllProject(1, allProjectsCount);
	session.setAttribute("allProjects", allProjects);

} else if(realPage.equals("/InvestmentPlatform/government/all_project_page1_g")) {
	if(request.getParameter("pageNo") != null) {
		int pageNo = Integer.parseInt(request.getParameter("pageNo"));
		
		int allProjectsCount = projectControl.getProjectCounts();
		session.setAttribute("allProjectsCount", allProjectsCount);
		String[][] allProjects = projectControl.getAllProject(pageNo, allProjectsCount);
		session.setAttribute("allProjects", allProjects);
		
		response.sendRedirect("all_project_page1_g.jsp?pageNo=" + Integer.toString(pageNo) + "&username=" + username);
		
	} else if(request.getParameter("delete") != null) {
		int i = Integer.parseInt(request.getParameter("i"));
		String[][] allProjects = (String[][])session.getAttribute("allProjects");
		String projectName = allProjects[i][0];
		String pUsername = allProjects[i][2];
		projectControl.deleteProject(pUsername, projectName);
		
		int allProjectsCount = projectControl.getProjectCounts();
		session.setAttribute("allProjectsCount", allProjectsCount);
		allProjects = projectControl.getAllProject(1, allProjectsCount);
		session.setAttribute("allProjects", allProjects);
		
		response.sendRedirect("all_project_page1_g.jsp?&username=" + username);
	}
} else if(realPage.equals("/InvestmentPlatform/government/all_enterprise_page1_g")) {
	
	if(request.getParameter("pageNo") != null) {
		int pageNo = Integer.parseInt(request.getParameter("pageNo"));
		
		int enterpriseCount = userControl.getUserCount("2");
		String[][] allEnterprises = userControl.getAllUser(pageNo, "2");
		session.setAttribute("allEnterprises", allEnterprises);
		response.sendRedirect("all_enterprise_page1_g.jsp?pageNo=" + Integer.toString(pageNo) + "&username=" + username);
		
	} else if(request.getParameter("delete") != null) {
		int i = Integer.parseInt(request.getParameter("i"));
		String[][] allEnterprises = (String[][])session.getAttribute("allEnterprises");
		String company = allEnterprises[i][0];
		userControl.deleteUser(company, "2");
		
		int enterpriseCount = userControl.getUserCount("2");
		session.setAttribute("enterpriseCount", enterpriseCount);
		allEnterprises = userControl.getAllUser(1, "2");
		session.setAttribute("allEnterprises", allEnterprises);
		
		response.sendRedirect("all_enterprise_page1_g.jsp?&username=" + username);
	}

} else if(realPage.equals("/InvestmentPlatform/government/all_village_page1_g")) {
	
	if(request.getParameter("pageNo") != null) {
		int pageNo = Integer.parseInt(request.getParameter("pageNo"));
		
		int enterpriseCount = userControl.getUserCount("1");
		String[][] allVillage = userControl.getAllUser(pageNo, "1");
		session.setAttribute("allUsers", allVillage);
		response.sendRedirect("all_village_page1_g.jsp?pageNo=" + Integer.toString(pageNo) + "&username=" + username);
		
	} else if(request.getParameter("delete") != null) {
		int i = Integer.parseInt(request.getParameter("i"));
		String[][] allVillage = (String[][])session.getAttribute("allUsers");
		String company = allVillage[i][0];
		userControl.deleteUser(company, "1");
		
		int villageCount = userControl.getUserCount("1");
		session.setAttribute("villageCount", villageCount);
		allVillage = userControl.getAllUser(1, "1");
		session.setAttribute("allUsers", allVillage);
		
		response.sendRedirect("all_village_page1_g.jsp?&username=" + username);
	}
	
}
%>
</body>
</html>