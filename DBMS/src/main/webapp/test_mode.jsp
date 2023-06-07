<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cigarette</title>
<style>
.table1{
    position: relative;
    margin-left: auto;
    margin-right: auto;
    
  }
  .table2{
    position: realtive;
    margin-left: auto;
    margin-right: auto;
  }
  .homebutton{
    position: relative;
    margin-left: 45%;
    margin-right: 45%;
    text-align: center;
    margin-top: 2ch;
    display: inline-block;
    transition-duration: 0.4s;
    width: 120px;
    height: 40px;
  }
  </style>
<link rel="stylesheet" href="test_mode.css">
  <script src ="test_mode.js" defer ></script>
  <script>
  window.console = window.console || function(t) {};
</script>
</head>
<body>
   <section class="score">
    <span class="correct">0</span>/<span class="total">0</span>
    <button id="play-again-btn">Play Again</button>
  </section>
  <section class="draggable-elements">
      <!-- Will be dynamically populated - Example Element: -->
    <table  class="table2">
      <tr>
        <td>
          <img src="img/6.png" class="draggable" draggable="true" style="background-image: url(img/6.png);" id="6">
          </td>
        <td>
          <img src="img/1.png" class="draggable" draggable="true" style=" background-image: url(img/1.png); background-size: 1rem 1rem;" id="1">
          </td>
        <td>
          <img src="img/7.png" class="draggable" draggable="true" style="background-image: url(img/7.png); background-size: 1rem 1rem;" id="7">
        </td>
        <td>
          <img src="img/2.png" class="draggable" draggable="true" style="background-image: url(img/2.png); background-size: 1rem 1rem;" id="2">
          </td>
        <td>
          <img src="img/4.png" class="draggable" draggable="true" style="background-image: url(img/4.png); background-size: 1rem 1rem;" id="4">
        </td>
        <td>
          <img src="img/3.png" class="draggable" draggable="true" style="background-image: url(img/3.png); background-size: 1rem 1rem;" id="3">
        </td>   
        <td>
          <img src="img/8.png" class="draggable" draggable="true" style="background-image: url(img/8.png); background-size: 1rem 1rem;" id="8">
        </td>
        <td>
          <img src="img/5.png" class="draggable" draggable="true" style="background-image: url(img/5.png); background-size: 1rem 1rem;" id="5">
        </td>
        </tr>
        </table>
    <!-- <img src="img/9.png" class="draggable" draggable="true" style="color: #111111;" id="9">
    <img src="img/10.png" class="draggable" draggable="true" style="color: #111111;" id="10">
    <img src="img/11.png" class="draggable" draggable="true" style="color: #111111;" id="11">
    <img src="img/12.png" class="draggable" draggable="true" style="color: #111111;" id="12">
    <img src="img/13.png" class="draggable" draggable="true" style="color: #111111;" id="13">
    <img src="img/14.png" class="draggable" draggable="true" style="color: #111111;" id="14">
    <img src="img/15.png" class="draggable" draggable="true" style="color: #111111;" id="15"> -->
  </section>
  <section class="droppable-elements">
    <table class="table1">
      <tr>
        <td>
          <div class="droppable" data-draggable-id="1"><span>雲絲頓藍</span></div>
        </td>
        <td>
          <div class="droppable" data-draggable-id="2"><span>日本肯特長支6號</span></div>
          </td>
        <td>
          <div class="droppable" data-draggable-id="3"><span>萬寶路金硬盒</span></div>
          </td>
        <td>
          <div class="droppable" data-draggable-id="4"><span>萬寶路金軟包軟盒</span></div>
          </td>
        <td>
          <div class="droppable" data-draggable-id="5"><span>鴻運精裁6號</span></div>
        </td>
   </tr>
    </table>
    
    
    <!-- <div class="droppable" data-draggable-id="6"><span>馬爾斯長支</span></div>
    <div class="droppable" data-draggable-id="7"><span>雲絲頓天香</span></div>
    <div class="droppable" data-draggable-id="8"><span>維斯塔</span></div> -->
    <!-- <div class="droppable" data-draggable-id="9"><span>七星風藍硬盒</span></div>
    <div class="droppable" data-draggable-id="10"><span>七星LSS清藍</span></div>
    <div class="droppable" data-draggable-id="11"><span>馬爾斯長支</span></div>
    <div class="droppable" data-draggable-id="12"><span>長壽尊爵</span></div>
    <div class="droppable" data-draggable-id="13"><span>金登喜路</span></div>
    <div class="droppable" data-draggable-id="14"><span>藍色長支寶馬 </span></div>
    <div class="droppable" data-draggable-id="15"><span>大衛杜夫香菸紅</span></div> -->
  </section>
  <br><br>
   <button class="homebutton" id="backhome" onclick="changepage()">back</button>
	<script>
	  function changepage(){
	    window.location.href="practice_mode.jsp"
	  }
	</script>

</body>
</html>