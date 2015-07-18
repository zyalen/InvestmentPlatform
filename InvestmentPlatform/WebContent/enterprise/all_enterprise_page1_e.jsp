<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>all-enterprise-page1</title>
    <link href="../css/enterprise_index_css.css" type="text/css" rel="stylesheet">
    <% 
    String username = request.getParameter("username");
    String[][] allEnterprise = new String[5][7];
    if(session.getAttribute("allEnterprises") == null) {
    	for(int i = 0; i < 5; i++) {
    		for(int j = 0; j < 7; j++) {
    			allEnterprise[i][j] = "";
    		}
    	}
    } else {
    	allEnterprise = (String[][])session.getAttribute("allEnterprises");
    }
	
    int allEnterpriseCount = 0;
    if(session.getAttribute("enterpriseCount") == null) {
    } else {
    	allEnterpriseCount = (int)session.getAttribute("enterpriseCount");
    }
    int maxPage = (allEnterpriseCount - 1) / 5 + 1;
    
    String pageNo = new String("1");
    if(request.getParameter("pageNo") == null) {
    	pageNo = "1";
    } else {
    	pageNo = request.getParameter("pageNo");
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
                <li class="last"><a href=<%="enterpriseManage.jsp?logout=1" %>>注销</a></li>
            </ul>
        </div>
    </div>
    <div class="content_4">
        <div class="cztable">
            <table width="600px" border="0" cellspacing="0" cellpadding="0" style="text-align:center;">
                <tr>
                    <th style="width: 15%; text-align: center;">
                        企业名称
                    </th>
                    <th style="width: 15%; text-align: center;">
                        地址
                    </th>
                    <th style="width: 15%; text-align: center;">
                        操作
                    </th>
                </tr>
                
                <%
                for(int i = 0; i < 5; i++) {
                	if(allEnterprise[i][0] != null) {
                		%>
                		<tr>
                    <td>
                       <%=allEnterprise[i][0] %>
                    </td>
                    <td>
                        <%=allEnterprise[i][1] %>
                    </td>
                    <td>
                        <a href=<%="enterprise_demo_e.jsp?i="+Integer.toString(i)+"&username="+username %>>
                            <button>点击查看</button>
                        </a>
                    </td>
                </tr>
                		<%
                	}
                }
                %>

            </table>
            <br/>
            
            <div class="MainStyle">
                <div class="">
                    <a href=<%="enterpriseManage.jsp?pageNo=1" + "&maxPage=" + Integer.toString(maxPage)%> target="_self">首页</a>
                </div>
                <div class="">
                    <%
                	if(Integer.parseInt(pageNo) == 1) {
                		%>
                		<a href=<%="all_enterprise_page1_e.jsp?pageNo=" + pageNo + "&maxPage=" + Integer.toString(maxPage)%> 
                			target="_self">上一页</a>
                		<%
                	} else {
                		%>
                		<a href=<%="enterpriseManage.jsp?pageNo=" + Integer.toString(Integer.parseInt(pageNo) - 1) + "&maxPage=" + Integer.toString(maxPage)%> 
                			target="_self">上一页</a>
                		<%
                	}
                	%>
                </div>
                <%
                for(int i = 1; i <= maxPage; i++) {
                	%>
                	<div class="">
                    <a href=<%="enterpriseManage.jsp?pageNo=" + Integer.toString(i) + "&maxPage=" + Integer.toString(maxPage)%> 
                    	target="_self"><%=i %></a>
                	</div>
                	<%
                }
                %>
                <div class="">
                	<%
                	if(Integer.parseInt(pageNo) == maxPage) {
                		%>
                		<a href=<%="all_enterprise_page1_e.jsp?pageNo=" + pageNo + "&maxPage=" + Integer.toString(maxPage)%> 
                			target="_self">下一页</a>
                		<%
                	} else {
                		%>
                		<a href=<%="enterpriseManage.jsp?pageNo=" + Integer.toString(Integer.parseInt(pageNo) + 1) + "&maxPage=" + Integer.toString(maxPage)%> 
                			target="_self">下一页</a>
                		<%
                	}
                	%>
                </div>
                <div class="">
                    <a href=<%="enterpriseManage.jsp?pageNo=" + Integer.toString(maxPage) + "&maxPage=" + Integer.toString(maxPage)%> target="_self">尾页</a>
                </div>
                <div class="">总共<b><%=allEnterpriseCount %></b>条数据</div>
                <div class="">每页<b>5</b>条数据</div>
                <div class=""><b><%=pageNo %></b>/<%=maxPage %></div>
            </div>
        </div>
    </div>
</div>
</body>
</html>