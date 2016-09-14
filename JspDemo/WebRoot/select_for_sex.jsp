<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>按性别查询</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body background="pic/background.jpg">
     <% 
    request.setCharacterEncoding("UTF-8");
    String gender = request.getParameter("gender");
    Connection conn = null; 
    Statement stat = null; 
    ResultSet rs = null;
    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");       
	String url="jdbc:sqlserver://localhost:1433;DatabaseName=AFC"; 
    String user = "张巨"; 
    String password = "868796"; 
    conn = DriverManager.getConnection(url,user,password); 
    stat = conn.createStatement(); 
    rs = stat.executeQuery("select * from student where gender='" + gender + "'");
    %>
    <br>
        <h3>符合条件的学生信息</h3><hr> 
    <br>
     <table width="450" border="100" cellSpacing=1 style="font-size:15pt;border:dashed 1pt">
    <tr>
    <td>学号</td>
    <td>姓名</td>
    <td>年龄</td>
    <td>性别</td>
    <td>专业</td>
    </tr>
    <% 
    while(rs.next())
    {
    out.print("<tr>");
    out.print("<td>" + rs.getInt("id") + "</td>");
    out.print("<td>" + rs.getString("name") + "</td>");
    out.print("<td>" + rs.getInt("age") + "</td>");
    out.print("<td>" + rs.getString("gender") + "</td>");
    out.print("<td>" + rs.getString("major") + "</td>");
        %>
    <td><a href="delete.jsp?id=<%=rs.getInt("id") %>">删除</a></td>
     <td><a href="update.jsp?id=<%=rs.getInt("id") %>">修改</a></td>
    <%
    out.print("</tr>");
    }
    %>
      </table>
      <br>
      <br>
      <h4><a href=showInfo.jsp>返回查询页面</a></h4>
       <% 
    if(rs != null)
    {
        rs.close();
        rs = null;
    }
        if(stat != null)
    {
        stat.close();
        stat = null;
    }
        if(conn != null)
    {
        conn.close();
        conn = null;
    }
    %> 
  </body>
</html>
