<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>project-demoA</title>
    <link href="../css/government_index_css.css" type="text/css" rel="stylesheet">
    <% 
    String username = request.getParameter("username");
    int i = Integer.parseInt(request.getParameter("i"));
    String[][] allProjects = (String[][])session.getAttribute("allProjects");
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
                <li class="first"><a href=<%="government_index.jsp?username="+username %>>首页</a></li>
                <li>
                    <span class="Darrow"></span>
                    <a href="#">审核用户信息</a>
                    <dl>
                        <dt><span class="arrow"></span></dt>
                        <dd><a href=<%="all_village_page1_g.jsp?username="+username %>>审核村集体</a></dd>
                        <dd><a href=<%="all_enterprise_page1_g.jsp?username="+username %>>审核企业</a></dd>
                    </dl>
                </li>
                <li><a href=<%="all_project_page1_g.jsp?username="+username %>>审核项目信息</a></li>
                <li class="last"><a href=<%="governmentManage.jsp?logout=1" %>>注销</a></li>
            </ul>
        </div>
    </div>
    <div class="content_3">
        <div class="profileTb">
            <table>
                <tr>
                    <td>
                        <div class="input-tips_1">项目名称：</div>
                    </td>
                    <td>
                        <p id="element1" name="element1" class="inputStyle_1">
                            <%=allProjects[i][0] %>
                        </p>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="input-tips_1">招商单位：</div>
                    </td>
                    <td>
                        <p id="element2" name="element2" class="inputStyle_1">
                            <%=allProjects[i][1] %>
                        </p>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="input-tips_1">联系人姓名：</div>
                    </td>
                    <td>
                        <p id="element3" name="element3" class="inputStyle_1">
                            <%=allProjects[i][2] %>
                        </p>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="input-tips_1">联系方式：</div>
                    </td>
                    <td>
                        <p id="element4" name="element4" class="inputStyle_1">
                            <%=allProjects[i][3] %>
                        </p>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="input-tips_1">联系地址：</div>
                    </td>
                    <td>
                        <p id="element5" name="element5" class="inputStyle_1">
                            <%=allProjects[i][4] %>
                        </p>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="input-tips_1">项目内容：</div>
                    </td>
                    <td>
                        <p name="element6" id="element6" class="inputStyle_2">
                            <%=allProjects[i][5] %>
                        </p>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</body>
</html>