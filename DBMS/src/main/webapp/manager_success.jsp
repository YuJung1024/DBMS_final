<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Manager Success</title>
<link rel="stylesheet" type="text/css" href="manager_success.css">
</head>
<body>
    <img src="manager_check.png" alt="check" class="check">
    <h1>您的動作已成功執行</h1>
    <h2>請選擇下一個動作</h2>
    <button class = "button_add" onclick="window.location.href='manager_book.jsp'">建立班表</button>
    <button class = "button_check" onclick="window.location.href='manager_check.jsp'">定案排班時間</button>
    <button class = "button_book" onclick="window.location.href='manager_book.jsp'">登記值班時間</button>  
    <button class = "button_back" onclick="window.location.href='manger_page.jsp'">回主功能選單</button>
    <button class = "button_change" onclick="window.location.href='manager_change.jsp'">修改值班時間</button>
</body>
</html>