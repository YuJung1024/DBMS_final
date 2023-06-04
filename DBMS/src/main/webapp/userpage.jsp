<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.IOException"%>
<%@page import="work.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>工讀生培訓平台</title>
<link rel="stylesheet" href="home.css">
</head>
<body classes = "body" bgcolor="#d2ece0">
	<div class = "container">
		<h1 class = "heading">工讀生訓練平台</h1>
	</div>

		<div class="container-5 ">
		<button class="button-5" onclick="changepage()">
		<img src ="shelf.png" loading ="lazy" width="76" alt = "" class="image-6"><strong>貨架模擬</strong>
	</button>
	<script>
		function changepage(){
			window.location.href ="change.jsp"
		}
	</script>
	</div>

	<div class="container-5">
		<button class="button-5">
		<img src="schedule.png" loading ="lazy" width = "69" size ="(max-width:479px)100vw,68.99801635742188px" srcset="schedule-p-500.png 500w,  schedule.png 512w" alt="" class="image-2">
		<strong>排班表</strong></button>
	</div>

	<div class="container-5">
		<button class="button-5" onclick="practice()">
		<img src="books.png" loading="lazy" width ="76"  size ="(max-width:470px)100vw,75px" srcset="books-p-500.png 500w,books.png 512w" alt="" class="image-3">
	<strong>題庫練習</strong></button>
	<script>
		function practice(){
			alert("尚待開發中~")
		}

	</script>
	</div>

	<div class="container-5">
		<button class="button-5" onclick="contact()">
		<img src="telephone.png"  loading="lazy" width="72" size="(max-width:470px)100vw,70px" srcset="telephone-p-500.png 500w,telephone.png 512w" alt="" class="image-4">
		<strong>聯絡負責人</strong></button>
		<script>
			function contact(){
				alert("尚待開發中~")
			}
		</script>
	</div>

	<div class="container-5">
		<button class="button-5">
		<img src="gear.png" loading="lazy" width="84" height="75" srcset="gear-p-500.png 500w,gear.png 512w" size="(max-width:470px)100vw,70px" alt="" class="image-5"><strong>設定</strong></button>
	</div>


</body>
</html>