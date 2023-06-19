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
<% String connectionURL = "jdbc:mysql://my-database-1.ck5d9adueifx.ap-southeast-2.rds.amazonaws.com/part-time training system"; 
		String username = "admin";
		String password = "LN6MVu8Jr38vmyylUBD0";
		
		// Establishing database connection
		try {
		    Class.forName("com.mysql.jdbc.Driver");
		    conn = DriverManager.getConnection(connectionURL, username, password);
		    String sql = "WITH finalizedRegister AS (SELECT duty_time_id, COUNT(*) As finalizedNum FROM register AS r, user As u WHERE u.user_id=r.registrant_id AND u.grade='part-time' AND verdict=true GROUP BY duty_time_id) SELECT DISTINCT d.duty_time_id, d.duty_date, d.start_time,d.end_time FROM duty_time As d LEFT JOIN finalizedRegister As f ON d.duty_time_id=f.duty_time_id WHERE d.part_time_job_employees_num > f.finalizedNum AND f.duty_time_id IN (SELECT duty_time_id FROM register WHERE registrant_id= ?) OR f.duty_time_id IS NULL";
          
		    PreparedStatement statement = conn.prepareStatement(sql);
		//    statement.setString(1, request.getParameter("uid"));	
		statement.setString(1, "3");	
		    boolean success;
			success =statement.execute();
			int index = 0;
			if(success) {
				Connect con = new Connect();
				ResultSet result = statement.getResultSet();
				con.showResultSet(result);
			}	
            statement.close();
		} catch (Exception e) {
		    e.printStackTrace();
		}
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Change Page</title>
<link rel="stylesheet" href="manager_change.css">
</head>
<body>
<% //get userid input
ServletContext context1 = getServletContext();
String uid1 = (String) context1.getAttribute("inputid");
System.out.println("user_page1!"+uid1);
%>

<h1>您已登記的值班時間</h1>
	<section class="container1">
	    <!--  <form action="intergrate" method="get">-->
	    	 <%for(int i=1;i<c.size();i+=4){
	 
	    	%><input type="checkbox" name="dt" id="dt<%=(i/4+1) %>" value="<%=c.get(i-1)%>" onclick="push(<%=(i/4+1)%>);" checked><%=c.get(i)%> <%=c.get(i+1)%>~<%=c.get(i+2)%></input>
	    	<%if((i-1)%8!=0){
	    		%><br><%
	    		} 
	     } %>
	    <br><br>
	    <!-- </form> -->
	</section>
<br>
<button class = "book" onclick="window.location.href='user_schedule_page.jsp'">回前頁</button>

    <!--  <section>
    <input type="checkbox" id=dt1 value="1" onclick="push(1);">2023-07-01 08:00~12:00</input>
    <input type="checkbox" id=dt3 value="3" onclick="push(2);">2023-07-01 16:00~20:00</input>
    <br><br>
    <input type="checkbox" id=dt2 value="2" onclick="push(3);">2023-07-01 12:00~16:00</input>
    <input type="checkbox" id=dt4 value="4" onclick="push(4);">2023-07-01 20:00~24:00</input>
    </section>-->
    <!--  <br><br>
    <button class = "button_change" onclick="execute();">確認修改</button>
    <button class = "button_change" onclick="window.location.href='manger_page.jsp'">回前頁</button>
    <p id="sqls"></p>-->
<script>
	function push(i){
		var id="dt"+i;
		if(!document.getElementById(id).checked){
			var msg=document.createElement('p');
			msg.setAttribute("name","sql"+i);
			msg.setAttribute("value","DELETE FROM register WHERE registrant_id=? AND duty_time_id="+document.getElementById(id).value);
			document.getElementById("sqls").appendChild(msg);
			
		}
	}
	function execute(){
		<%
		try {
			for(int i=0;i<c.size()/4;i++){
				String uid=request.getParameter("uid");
				String name="sql"+i;
				String query=request.getParameter(name);
				if(query!=null){
		            PreparedStatement statement = conn.prepareStatement(query);
		            statement.setString(1, uid);
		       		            
		            statement.executeUpdate();
		            statement.close();
				}
		    	
			}
		} catch (SQLException e) {
		    e.printStackTrace();
		}
		%>
		window.location.href ="user_success.jsp";
	}
</script>
</body>
</html>