<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.IOException"%>
<%@page import="work.*"%>
<%@page import="java.sql.SQLException"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="work.intergrate"%>
<%@ page import="work.Connect"%>
<%@page import="javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>登入</title>
<link rel="stylesheet" href ="login.css">
</head>
<body classes = "body" bgcolor="#d2ece0">

    

	<div class="container">
	<h1>工讀生培訓APP</h1>
</div>
<div class="container-1">
	<h3>Welcome</h3>
	
	 <form action="intergrate" method="get">
	<label>使用者帳號:</label>
	<input id="uid"  name ="uid" placeholder="Type " type="text">
	<br>
	<!-- <label>使用者密碼:</label>-->
	<!-- <input id="passwords" type="text" placeholder="Type">-->
	<br><br>
	<button class="button" id ="login" onclick="getInputValue();">login</button>
	

	<script>
		function getInputValue(){
			var value1 = document.getElementById("userid").value;
			
			/*let value2 =document.getElementById("passwords").value;*/
			document.getElementById("login").addEventListener("click",redirectFunction());
			value = value1;
			request.setAttribute("inputid",value1);
			System.out.println("userid input= "+uid);
			function redirectFunction(){
				
				if(value1>0 && value1<15){
					if(value1>5){
						window.location.href ="userpage.jsp"
						alert("員工編號"+value1+",你好!"); 
					}else if (value1<=5){
						window.location.href ="manager.jsp"
						alert("員工編號"+value1+",你好!"); 
					}
				}else{
					alert("請輸入正確的員工編號!");
					
				}	
				}
			}
		
</script>
</form>
</div>

</body>
</html>