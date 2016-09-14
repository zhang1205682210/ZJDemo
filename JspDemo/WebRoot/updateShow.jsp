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
    
    <title>修改页面</title>
    
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
    String id1 = request.getParameter("id");
    String name1 = request.getParameter("name");
    String age1 = request.getParameter("age");
    String gender1 = request.getParameter("gender");
    String major1 = request.getParameter("major");
    Connection conn = null; 
    Statement stat = null; 
     Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");       
	String url="jdbc:sqlserver://localhost:1433;DatabaseName=AFC"; 
    String user = "张巨"; 
    String password = "868796";  
    conn = DriverManager.getConnection(url,user,password); 
    stat = conn.createStatement(); 
    stat.execute("update student set id=" + id1 + ",name='" + name1 + "',age=" + age1 + ",gender='" 
    	+ gender1 + "',major='" + major1+"' where id=" + id1 + ""); 
    ResultSet rs = stat.executeQuery("select * from student where id=" + id1 + ""); 
    
      
%>
<br>
     <h3>修改成功！</h3>
    <br>
    
    <h3>修改后的信息为：</h3>
    
    <hr>
    <br>
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
    out.print("<td>" + rs.getString("dender") + "</td>");
    out.print("<td>" + rs.getString("major") + "</td>");
    out.print("</tr>");
    }
    %>
      </table>
      <br>
      <br>
      <h3><a href=addStuInfo.jsp>返回添加信息页面</a></h3>
      <h3><a href=showInfo.jsp>返回信息查询页面</a></h3>
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