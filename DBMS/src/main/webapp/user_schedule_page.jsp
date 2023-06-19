<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.IOException"%>
<%@page import="work.*"%>
<%@page import="java.sql.SQLException"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.ResultSetMetaData" %>
<%@ page import="work.Connect"%>

<%! Connection conn = null; %>
<%!ArrayList<String>c=new ArrayList<String>(); %>
<%!String salary=""; %>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Page</title>
<link rel="stylesheet" href="manager_page.css">
</head>
<body>
<%!String id; %>
<% //get userid input
ServletContext context1 = getServletContext();
String uid1 = (String) context1.getAttribute("inputid");
System.out.println("manager_page1!"+uid1);
%>
<% String connectionURL = "jdbc:mysql://my-database-1.ck5d9adueifx.ap-southeast-2.rds.amazonaws.com/part-time training system"; 
		String username = "admin";
		String password = "LN6MVu8Jr38vmyylUBD0";
		// Establishing database connection
		try {
		    Class.forName("com.mysql.jdbc.Driver");
		    conn = DriverManager.getConnection(connectionURL, username, password);
		    String sql = "";
          
		    PreparedStatement statement = conn.prepareStatement("SELECT d.duty_date, d.start_time,d.end_time,u.experience FROM register AS r,user AS u, duty_time AS d WHERE r.registrant_id=u.user_id AND r.duty_time_id=d.duty_time_id AND d.duty_time_id IN (SELECT duty_time_id FROM register WHERE registrant_id= ? ) AND verdict=true GROUP BY d.duty_time_id, d.start_time,d.end_time");
		   statement.setString(1,id);
		   // statement.setString(1, "3");
		    PreparedStatement statement2= conn.prepareStatement("SELECT SUM((TIMESTAMPDIFF(HOUR,d.start_time,d.end_time))*u.hourly_wage) AS wage FROM register AS r,user AS u, duty_time AS d WHERE r.registrant_id=u.user_id AND r.duty_time_id=d.duty_time_id AND registrant_id= ? AND verdict=true ORDER BY d.duty_time_id;");
		    statement2.setString(1,id);
		   // statement2.setString(1, "3");
		    
		    boolean success,success2;
			success =statement.execute();
			success2 =statement2.execute();
			int index = 0;
			if(success) {
				Connect con = new Connect();
				ResultSet result = statement.getResultSet();
				try{
					c=con.showResultSet(result);
				}catch(Exception e){
					e.printStackTrace();
				}
			}
			if(success2) {
				Connect con2 = new Connect();
				ResultSet result2 = statement2.getResultSet();
				try{
					salary=(String)con2.showResultSet(result2).get(0);
				}catch(Exception e){
					e.printStackTrace();
				}
			}	
            statement.close();
		} catch (Exception e) {
		    e.printStackTrace();
		}
%>

<img src="pic/manager_page.png" alt="manager" width="100" height="100">
    <h1>排班表</h1>
    <section class="container1">
    <h3>已被定案的值班時間:</h3>
    <%for(int i=0;i<c.size();i+=4){
    	String exp="同事經歷:";
    	if(c.get(i+3).contains("Mor")) exp+="早";
    	if(c.get(i+3).contains("Noon")) exp+="中";
    	if(c.get(i+3).contains("Nig")) exp+="晚";
    	if(c.get(i+3).contains("LatNig")) exp+="大夜";
    	
    	%><h4><%=c.get(i)%> <%=c.get(i+1)%>~<%=c.get(i+2)%> <%=exp%><br><%
     } %></h4>
   <h3>預計薪資總計:<%=salary%></h3>
    <br>
</section>
    <button class="button3" onclick="window.location.href='user_bookjsp.jsp'">登記值班時間</button>
    <button class="button4" onclick="window.location.href='user_change.jsp'">修改值班時間</button>
    <br><br>
    <button class="button4" onclick="window.location.href='userpage.jsp'">回主畫面</button>
</body>
</html>