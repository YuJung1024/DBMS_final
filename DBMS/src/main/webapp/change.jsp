<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>Welcome to the store</title>

</head>
<style>
	div.startbutton{
		width: auto;
		height: auto;
		text-align: center;
		float: center;
		margin: center;
	}


</style>
<body>
<h1><center>歡迎來到本店!</center></h1>
	<center>Click the picture and start!</center>
	<br>
	<div class="startbutton">
	<button type="submit" id="start"><img src="store1.jpg" alt ="start"></button>
	</div>
</body>

<script>
	document.getElementById("start").addEventListener("click",redirectFunction);
	function redirectFunction(){
		window.location.href ="decoration.jsp"
	}
</script>

</html>