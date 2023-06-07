<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Store Page</title>

<style>
body{
	background-color: tan;
}
.button {
  border: none;
  text-align: center;
  display: inline-block;
  font-size: xx-small;
/*  margin: 4px 2px;*/
  transition-duration: 0.4s;
  cursor: pointer;
      position:absolute; 
}

.button1 {
background-image:url("Fridge_Cartoons.jpg");
 background-size:100px 400px ;
   color: black; 
  width:100px;
  height: 400px;
  top: 120px;
  left:120px
}

.button2 {
background-image:url("cigar_cartoon_n.jpg");
background-size: 80px 50px;
  color: black; 
  width:80px;
  height: 50px;
  top: 40px;
  left: 850px;
}

.button3 {
background-image:url("Racks_Cartoon.jpg");
 background-size:780px 330px; 
  color: black; 
  width:780px;
  height: 330px; 
 left: 230px;
  top: 160px;
}

.button4 {
  background-image:url("seats_cartoons.jpg");
 background-size:600px 60px;
  color: black; 
  width:600px;
  height: 61px;
  top: 520px;
  left:250px;
}

.button5 {
background-image:url("pos_cartoon_n.jpg");
 background-size:80px 60px;
  color: black; 
  width:80px;
  height: 60px;
  top: 90px;
  left: 850px;
}

.button6 {
background-image:url("drinks_cartoon_n.jpg");
 background-size:100px 70px;
 repeat-x;
  color: black; 
  width:550px;
  height: 70px;
  top: 40px;
  left: 250px;
}

.button7 {
  background-color: gray; 
  color: black; 
  width:100px;
  height: 70px;
  left: 120px;
    top:40px;
}

.button8 {
  background-color: gray; 
  color: black; 
  width:60px;
  height: 100px;
  left: 950px;
  top: 40px;
}


.dialog{
	width: auto;
}



</style>

<script src="dialog-polyfill.js">


</script>

</head>
<body>
	
<!-- <a href="Fridges.html"> -->
	<button class="button button1" onclick="showDialog()">Fridge</button>
	<dialog id ="this-dialog">
	<p>This is the image of the fridges</p>
	<img src="Fridges.jpeg" width=100px height=100px>
	<br>
	Product info:
	<br> Drinks
	<br>Alcohol
	<br>Frozen food
	<!-- <a href="Fridges.html">
	<button >info</button>
	</a> --><br>
	<button onclick="hidethisdialog()">close</button>
	</dialog>
<!-- </a> -->

<!-- <a href="Cigarette.html"> -->
	<button class="button button2" onclick="showDialog2()">Cigarette</button>
	<dialog id ="this-dialog2">
	<p>this is the information for the product</p>
	<img src="cigar.jpg" width=100px height=100px>
	<br>
	<!--  <a href="newCigarrette.html">-->
	<button onclick="changepage2()">info</button>
	<script>
	function changepage2(){
		window.location.href ="practice_mode.jsp"
	}
</script>
	<!--  </a>-->
	<button onclick="hidethisdialog2()">close</button>
	</dialog>
<!-- </a> -->


<!-- <a href="Racks.html"> -->
	<button class="button button3" onclick="showDialog3()">Racks</button>
	<dialog id ="this-dialog3">
	<p>this is the information for the product</p>
	<img src="racks.jpg" width=100px height=100px>
	<br>
	<button onclick="hidethisdialog3()">close</button>
	</dialog>
<!-- </a> -->

<!-- <a href="Seats.html"> -->
	<button class="button button4" onclick="showDialog4()">Seats</button>
	<dialog id ="this-dialog4">
	<p>this is the information for the product</p>
	<img src="seats.jpg" width=100px height=100px>
	<br>
	<button onclick="hidethisdialog4()">close</button>
	</dialog>
<!-- </a> -->

<!-- <a href="POS.html"> -->
	<button class="button button5" onclick="showDialog5()">POS</button>
	<dialog id ="this-dialog5">
	<p>this is the information for the product</p>
	<img src="POS_n.jpg" width=100px height=100px>
	<br>
	<button onclick="hidethisdialog5()">close</button>
	</dialog>
<!-- </a> -->

<!-- <a href="Drinks.html"> -->
	<button class="button button6" onclick="showDialog6()">Drinks</button>
	<dialog id ="this-dialog6">
	<p>this is the information for the product</p>
	<img src="drinks.jpg" width=100px height=100px>
	<br>
	<button onclick="hidethisdialog6()">close</button>
	</dialog>
<!-- </a> -->

<!-- <a href="Office.html"> -->
	<button class="button button7" onclick="showDialog7()">Office</button>
	<dialog id ="this-dialog7">
	<p>this is the information for the product</p>
	
	<br>
	<button onclick="hidethisdialog7()">close</button>
	</dialog>
<!-- </a> -->

<!-- <a href="Door.html"> -->
	<button class="button button8" onclick="changepage()">Door</button>
		<script>
		function changepage(){
			window.location.href ="manager.jsp"
		}
	</script>
	
<!-- </a> -->

</body>
</html>