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



<%! Connection conn = null; %>
<%!ArrayList<String>c=new ArrayList<String>(); %>
<% String connectionURL = "jdbc:mysql://my-database-1.ck5d9adueifx.ap-southeast-2.rds.amazonaws.com/part-time training system"; 
		String username = "admin";
		String password = "LN6MVu8Jr38vmyylUBD0";
		
		// Establishing database connection
		try {
		    Class.forName("com.mysql.jdbc.Driver");
		    conn = DriverManager.getConnection(connectionURL, username, password);
		    String sql = "WITH finalizedRegister AS (SELECT duty_time_id, COUNT(*) As finalizedNum FROM register AS r, user As u WHERE u.user_id=r.registrant_id AND u.grade='full-time' AND verdict=true GROUP BY duty_time_id) SELECT DISTINCT d.duty_time_id, d.duty_date, d.start_time,d.end_time FROM duty_time As d LEFT JOIN finalizedRegister As f ON d.duty_time_id=f.duty_time_id WHERE d.full_time_job_employees_num > f.finalizedNum OR f.duty_time_id IS NULL";
          
		    PreparedStatement statement = conn.prepareStatement(sql);
		    boolean success;
			success =statement.execute(sql);
			int index = 0;
			if(success) {
				ResultSet result = statement.getResultSet();
				//c=work.Connect.showResultSet(result);
			}	
            statement.close();
		} catch (Exception e) {
		    e.printStackTrace();
		}
		
%>
<!DOCTYPE html>
<html >
<head>
    <meta charset="UTF-8">
    <title>Manager book</title>
    <link rel="stylesheet" href="manager_book.css">
</head>
<style>
.container1{
width:500px;
height: 160px;
    background-color: #d5f7e7;
    padding-left:0.3cm;

}
</style>
<body>
<% //get userid input(maybe)
//String  id =  (String)request.getAttribute("input_id");
//System.out.println(id);
%>

    <h1>尚有空缺的值班時間</h1>
    
    <section class="container1">
    <input type="checkbox" name=dt1 value="1">2023-07-01 08:00~12:00</input>
    <input type="checkbox" name=dt3 value="3">2023-07-01 16:00~20:00</input>
    <br><br>
    <input type="checkbox" name=dt2 value="2">2023-07-01 12:00~16:00</input>
    <input type="checkbox" name=dt4 value="4">2023-07-01 20:00~24:00</input>
    <br><br>
</section>
<br>
&nbsp;
<button class = "book" onclick="excuet();">登記所選時間</button>
&nbsp;
<button class = "book" onclick="window.location.href='manger_page.jsp'">回前頁</button>
</body>
<script>
	function execute(){
		<%
		// Retrieving form values
		String[] dts=new String[4];
		for(int i=1;i<=4;i++){
			String dti="dt"+i;
			if(request.getParameter(dti)!=null){
				dts[i-1] = request.getParameter(dti);
			}else{
				dts[i-1] = null;
			}
		}
		
			
		// Inserting form values into the database
		try {
			for(int i=0;i<4;i++){
				String uid=request.getParameter("uid");
				if(dts[i]!=null){
					String sql = "INSERT INTO register VALUES(?,?,FALSE,NULL)";
		            PreparedStatement statement = conn.prepareStatement(sql);
		            statement.setString(1, uid);
		            statement.setString(2, dts[i]);
		            
		            statement.executeUpdate();
		            statement.close();
				}
		    	
			}
		} catch (SQLException e) {
		    e.printStackTrace();
		}
		%>
		window.location.href ="manager_success.jsp";
	}

</script>
    </html>