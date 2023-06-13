<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Manager Page</title>
<link rel="stylesheet" href="manager_page.css">
</head>
<body>
<img src="pic/manager_page.png" alt="manager" width="100" height="100">
    <h1>排班表</h1>
    <button class="button1" onclick="window.location.href='manager_build.jsp'">建立班表</button>
    <button class="button2" onclick="window.location.href='manager_check.jsp'">定案排班時間</button>
    <br><br>
    <button class="button3" onclick="window.location.href='manager_book.jsp'">登記值班時間</button>
    <button class="button4" onclick="window.location.href='manager_change.jsp'">修改值班時間</button>
    <br><br>
    <button class="button4" onclick="window.location.href='manager.jsp'">回主畫面</button>
</body>
</html>