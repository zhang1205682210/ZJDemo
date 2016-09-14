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
    
    <title>学生信息</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	 <script type="text/javascript"">
    function validate()
    {
    var id = document.forms[0].id.value;
    var name = document.forms[0].name.value;
    var age = document.forms[0].age.value;
    var major = document.forms[0].major.value;
    if(id <= 0){
    	alert("学号不能为空，请输入学号！");
    	return false;
    }
    else if(name.length <= 0){
    	alert("姓名不能为空，请输入姓名！");
    	return false;
    }
    else if(age <= 0){
    	alert("请输入合法年龄！");
    	return false;
    }

        else if(major.length <= 0){
    	alert("专业不能为空，请输入所学专业！");
    	return false;
    }

    else{
    	return true;
    }
    	//document.getElementById("form").submit();
    }
    </script>
  </head>
  
  <body background="pic/background.jpg">
 <% 
    response.setCharacterEncoding("UTF-8");
    request.setCharacterEncoding("UTF-8");
    String id = request.getParameter("id");
    Connection conn = null; 
    Statement stat = null; 
    ResultSet rs = null;
    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");       
	String url="jdbc:sqlserver://localhost:1433;DatabaseName=AFC"; 
    String user = "张巨"; 
    String password = "868796"; 
    conn = DriverManager.getConnection(url,user,password); 
    stat = conn.createStatement(); 
    rs = stat.executeQuery("select * from student where id=" + id + "");
  %>
  <br>
    <h2>学生信息</h2>  <hr>    
    <br> 
  <h3>要修改的学生信息如下</h3>
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
    out.print("<td>" + rs.getInt("gender") + "</td>");
    out.print("<td>" + rs.getString("age") + "</td>");
    out.print("<td>" + rs.getString("major") + "</td>");
    out.print("</tr>");
  
  
    %>
      </table>
      
      <br>
         <br>
 <h3>将学生信息更改为：</h3>
 <form action="updateShow.jsp" method="post" onSubmit="return validate()">
<h4> 学号：<input type="text" name="id" value="<%=rs.getInt("id") %>" title="学号不能改变" readonly="readonly"></input><br></h4>
<h4>  姓名：<input type="text" name="name" title="姓名不能为空" onclick="return checkName(name)"></input><br></h4>
<h4>  年龄：<input type="text" name="age" title="年龄不能为空"></input><br></h4>
<h4>  性别：<input type="radio" name="gender" value="男">男
       <input type="radio" name="gender" value="女">女<br></h4>
<h4>  专业：<input type="text" name="major" title="专业不能为空"></input><br></h4>
 <input type="submit" value="修改"/>
  </form>

 <br>
<h3><a href=addStuInfo.jsp>返回添加信息页面</a></h3>
<h3><a href=showInfo.jsp>返回信息查询页面</a></h3>
<%
  }
 %>
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
