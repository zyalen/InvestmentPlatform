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
	userControl.setUser(username);
	User self = userControl.getUser();
	session.setAttribute("username", self.getUsername());
	session.setAttribute("company", self.getCompany());
	session.setAttribute("address", self.getAddress());
	session.setAttribute("realname", self.getRealname());
	session.setAttribute("tel", self.getTel());
	session.setAttribute("state", self.getState());
	response.sendRedirect("village_index.jsp?username="+username);
	
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
	
	// User's all projects
	int selfProjectCount = projectControl.getSelfProjectCounts(username);
	session.setAttribute("selfProjectCount", selfProjectCount);
	String[][] selfAllProjects = projectControl.getSelfProject(username, 1, selfProjectCount);
	session.setAttribute("selfAllProjects", selfAllProjects);
	
	// All projects
	int allProjectsCount = projectControl.getProjectCounts();
	session.setAttribute("allProjectsCount", allProjectsCount);
	String[][] allProjects = projectControl.getAllProject(1, allProjectsCount);
	session.setAttribute("allProjects", allProjects);

} else if(realPage.equals("/InvestmentPlatform/village/change_password_v")) {
	// Change password
	String password = request.getParameter("password");
	
	if(userControl.changePW(username, password)) {
		// Change password successfully
		session.invalidate();
		userControl.logout();
		out.print("修改成功，即将跳转到登录页面...");
		response.setHeader("refresh", "1;url=../universal/login.jsp");
	} else {
		// Fail to change password
		out.print("<font color='red'>修改失败</font>");
		response.sendRedirect("change_password_v.jsp?error=1&username="+username);
	}
	
} else if(realPage.equals("/InvestmentPlatform/village/check_profile_v")) {
	// Change profile
	String company = request.getParameter("e1");
	String address = request.getParameter("e2");
	String realname = request.getParameter("e3");
	String tel = request.getParameter("e4");
	String state = request.getParameter("e5");
	
	User changedUser = new User(username);
	changedUser.setCompany(company);
	changedUser.setAddress(address);
	changedUser.setRealname(realname);
	changedUser.setTel(tel);
	changedUser.setState(state);
	
	if(userControl.changeInfo(changedUser)) {
		session.setAttribute("company", changedUser.getCompany());
		session.setAttribute("address", changedUser.getAddress());
		session.setAttribute("realname", changedUser.getRealname());
		session.setAttribute("tel", changedUser.getTel());
		session.setAttribute("state", changedUser.getState());

		String[][] allVillages = userControl.getAllUser(1, "1");
		session.setAttribute("allUsers", allVillages);
		
		response.sendRedirect("check_profile_v.jsp?username="+username);	
	} else {
		response.sendRedirect("check_profile_v.jsp?error=1&username="+username);
	}
	
} else if(realPage.equals("/InvestmentPlatform/village/publish_project_v")) {
	// Publish new project
	String projectName = request.getParameter("element1");
	String village = request.getParameter("element2");
	String realname = request.getParameter("element3");
	String tel = request.getParameter("element4");
	String address = request.getParameter("element5");
	String state = request.getParameter("element6");
	
	Project project = new Project();
	project.setProjectname(projectName);
	project.setVillage(village);
	project.setRealname(realname);
	project.setTel(tel);
	project.setAddress(address);
	project.setState(state);
	
	if(projectControl.publishProject(username, project)) {
		// User's all projects
		int selfProjectCount = projectControl.getSelfProjectCounts(username);
		session.setAttribute("selfProjectCount", selfProjectCount);
		String[][] selfAllProjects = projectControl.getSelfProject(username, 1, selfProjectCount);
		session.setAttribute("selfAllProjects", selfAllProjects);
		
		// All projects
		int allProjectsCount = projectControl.getProjectCounts();
		session.setAttribute("allProjectsCount", allProjectsCount);
		String[][] allProjects = projectControl.getAllProject(1, allProjectsCount);
		session.setAttribute("allProjects", allProjects);
		
		response.sendRedirect("check_project_page1_v.jsp?username=" + username);
	} else {
		response.sendRedirect("publish_project_v.jsp?error=1&username=" + username);
	}
	
} else if(realPage.equals("/InvestmentPlatform/village/check_project_page1_v")) {
	if(request.getParameter("pageNo") != null) {
		int pageNo = Integer.parseInt(request.getParameter("pageNo"));
		
		int selfProjectCount = projectControl.getSelfProjectCounts(username);
		String[][] selfAllProjects = projectControl.getSelfProject(username, pageNo, selfProjectCount);
		session.setAttribute("selfAllProjects", selfAllProjects);
		response.sendRedirect("check_project_page1_v.jsp?pageNo=" + Integer.toString(pageNo) + "&username=" + username);
		
	} else if(request.getParameter("delete") != null) {
		int i = Integer.parseInt(request.getParameter("i"));
		String[][] selfAllProjects = (String[][])session.getAttribute("selfAllProjects");
		String projectName = selfAllProjects[i][0];
		projectControl.deleteProject(username, projectName);
		
		int selfProjectCount = projectControl.getSelfProjectCounts(username);
		session.setAttribute("selfProjectCount", selfProjectCount);
		selfAllProjects = projectControl.getSelfProject(username, 1, selfProjectCount);
		session.setAttribute("selfAllProjects", selfAllProjects);
		
		int allProjectsCount = projectControl.getProjectCounts();
		session.setAttribute("allProjectsCount", allProjectsCount);
		String[][] allProjects = projectControl.getAllProject(1, allProjectsCount);
		session.setAttribute("allProjects", allProjects);
		
		response.sendRedirect("check_project_page1_v.jsp?&username=" + username);
	}
} else if(realPage.equals("/InvestmentPlatform/village/all_project_page1_v")) {
	if(request.getParameter("pageNo") != null) {
		int pageNo = Integer.parseInt(request.getParameter("pageNo"));
		
		int projectCount = projectControl.getProjectCounts();
		String[][] allProjects = projectControl.getAllProject(pageNo, projectCount);
		session.setAttribute("allProjects", allProjects);
		response.sendRedirect("all_project_page1_v.jsp?pageNo=" + Integer.toString(pageNo) + "&username=" + username);
	}
} else if(realPage.equals("/InvestmentPlatform/village/all_enterprise_page1_v")) {
	if(request.getParameter("pageNo") != null) {
		int pageNo = Integer.parseInt(request.getParameter("pageNo"));
		
		int enterpriseCount = userControl.getUserCount("2");
		String[][] allEnterprises = userControl.getAllUser(pageNo, "2");
		session.setAttribute("allEnterprises", allEnterprises);
		response.sendRedirect("all_enterprise_page1_v.jsp?pageNo=" + Integer.toString(pageNo) + "&username=" + username);
	}

} else if(realPage.equals("/InvestmentPlatform/village/all_village_page1_v")) {
	if(request.getParameter("pageNo") != null) {
		int pageNo = Integer.parseInt(request.getParameter("pageNo"));
		
		int villageCount = userControl.getUserCount("1");
		String[][] allVillages = userControl.getAllUser(pageNo, "1");
		session.setAttribute("allUsers", allVillages);
		response.sendRedirect("all_village_page1_v.jsp?pageNo=" + Integer.toString(pageNo) + "&username=" + username);
	}
}
%>
</body>
</html>