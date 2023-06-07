<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Cigarette Practice</title>
<style>
img{
    size-adjust: auto;
    width: 100px;
    height: 175px;
}	

.button {
  border: none;
  /* align-items: center; */
  text-align: center;
  /* display: inline-block; */
  font-size: xx-small;
  transition-duration: 0.4s;
  cursor: pointer;
      position: absolute;
      width: 100px;
    height: 175px;
  background-size: cover;
  /* margin-left: auto;
  /* margin-right: auto; */
  /* margin-top: auto;
  margin-bottom: auto;
  left: auto; */ 
  
}

.button1 {
  background-image: url("img/1.png"); 
  color: black; 
  left:200px;

}

.button2 {
  background-image: url("img/2.png"); 
  color: black; 
  left:400px;
}

.button3 {
  background-image: url("img/3.png"); 
  color: black; 
  left:600px;
}

.button4 {
  background-image: url("img/4.png"); 
  color: black; 
  left:800px;
}

.button5 {
  background-image: url("img/5.png"); 
  color: black; 
  left:1000px;
}

.button6 {
  background-image: url("img/6.png"); 
  color: black; 
  left:200px;
  top:200px;
}

.button7 {
  background-image: url("img/7.png"); 
  color: black; 
  left:400px;
  top:200px;
}

.button8 {
  background-image: url("img/8.png"); 
  color: black; 
  left:600px;
  top:200px;
}

.button9 {
  background-image: url("img/9.png"); 
  color: black; 
  left:800px;
  top:200px;
}

.button10 {
  background-image: url("img/10.png"); 
  color: black; 
  left:1000px;
  top:200px;
}

.button11 {
  background-image: url("img/11.png"); 
  color: black; 
  left:200px;
  top:400px
}

.button12 {
  background-image: url("img/12.png"); 
  color: black; 
  left:400px;
  top:400px;
}

.button13 {
  background-image: url("img/13.png"); 
  color: black; 
  left:600px;
  top:400px;
}

.button14 {
  background-image: url("img/14.png"); 
  color: black; 
  left:800px;
  top:400px;
}

.button15 {
  background-image: url("img/15.png"); 
  color: black; 
  left:1000px;
  top:400px;
}

.dialog{
	width: auto;
}
.container{
  position:absolute;
		margin-top: 40%;
    padding-left: 30%;
		/*left:600px;*/
		font-size:25px;
		
}
.table1{
  position: relative;
  /*margin-left: auto;*/
  padding-left: 5ch;
  margin-right: auto;
  margin-top: auto;
  margin-bottom: auto;
}
.table2{
  padding-top: 65ch;
  padding-left: 55ch;
  position: relative;
  /*margin-left: auto;*/
  margin-right: auto;
  margin-top: auto;
  margin-bottom: auto;
  margin-top: 2ch;
}
.home{
  position: relative;
  margin-left: 40%;
  margin-right: 40%;
  font-size: 25px;
  margin-top: 45%;
  display: inline-block;
  transition-duration: 0.4s;
}


</style>

<script src="dialog-polyfill.js"></script>
</head>
<body>
<section>
<table class="table1">
<tbody>	
<tr>
<td>
<button class="button button1" onclick="showDialog()"></button>
	<dialog id ="this-dialog">
	<p></p>
	<img src="img/1.png">
	<br>
	Product info:
  <br><span>名稱：雲絲頓藍 20支<br>
    別名：藍色雲絲(斯)頓 <br>
    價格：95元<br>
    品牌地：日本<br>
    </span>
	
	<br>
	<button onclick="hidethisdialog()">close</button>
	</dialog>
	</td>
	<td>
    <button class="button button2" onclick="showDialog2()"></button>
    <dialog id ="this-dialog2">
    <p></p>
    <img src="img/2.png">
    <br>
    Product info:
    <br><span>名稱：日本肯特長支6號<br>
      別名：肯特6號<br>
      價格：95元<br>
      品牌地：日本、韓國<br>
      </span>
    <br>
    <button onclick="hidethisdialog2()">close</button>
    </dialog>
    
    <button class="button button3" onclick="showDialog3()"></button>
    <dialog id ="this-dialog3">
    <p></p>
    <img src="img/3.png">
    <br>
    Product info: <br> 
    名稱：萬寶路金20支(硬盒)  <br>
	別名：白媽寶、白媽軟、金媽、媽波賴、金色萬寶路<br>
	價格：110元 / 95元<br>
	品牌地：瑞士<br>
    <br>
    <button onclick="hidethisdialog3()">close</button>
    </dialog>
    </td>
    <td>
    <button class="button button4" onclick="showDialog4()"></button>
    <dialog id ="this-dialog4">
    <p></p>
    <img src="img/4.png">
    <br>
    Product info:<br>
    萬寶路金軟包20支(軟盒) <br>
    別名：白媽寶、白媽軟、金媽、媽波賴、金色萬寶路 <br>
    價格：110元 / 95元 <br>
    品牌地：瑞士 <br>
    <br>
    <button onclick="hidethisdialog4()">close</button>
    </dialog>
    </td>
    <td>
    <button class="button button5" onclick="showDialog5()"></button>
    <dialog id ="this-dialog5">
    <p></p>
    <img src="img/5.png">
    <br>
    Product info: <br>
    名稱：鴻運精裁6號 <br>
    別名：藍色LS <br>
    價格：90元 <br>
	品牌地：美國、韓國 <br>
    <br>
    <button onclick="hidethisdialog5()">close</button>
    </dialog>
    </td></tr>
    
    <tr><td>
    <button class="button button6" onclick="showDialog6()"></button>
    <dialog id ="this-dialog6">
    <p></p>
    <img src="img/6.png">
    <br>
    Product info:<br>
	名稱：馬爾斯長支5毫克<br>
	別名：Mars 5號 <br>
	價格：95元<br>
	品牌地：台灣<br>  
    <br>
    <button onclick="hidethisdialog6()">close</button>
    </dialog>
	</td>
    <td>
    <button class="button button7" onclick="showDialog7()"></button>
    <dialog id ="this-dialog7">
    <p></p>
    <img src="img/7.png">
    <br>
    Product info:<br>
    名稱：雲絲頓天香5毫克 20支 <br>
	別名：天香 <br>
	價格：95元 <br>
	品牌地：日本 <br>
    <br>
    <button onclick="hidethisdialog7()">close</button>
    </dialog>
    <script>
	    function showDialog7(){
	    	var dia = document.getElementById('this-dialog7').showModal();
	    }
	
	    function hidethisdialog7(){
	    	document.getElementById('this-dialog7').close();
	    	
	    }
    </script>
    </td>
    <td>
    <button class="button button8" onclick="showDialog8()"></button>
    <dialog id ="this-dialog8">
    <p></p>
    <img src="img/8.png">
    <br>
    Product info: <br>
    名稱：維斯塔5毫克 <br>
	別名：VESTA 5號 <br>
	價格：100元 <br>
	品牌地：台灣 <br>
    <br>
    <button onclick="hidethisdialog8()">close</button>
    </dialog>
      <script>
	    function showDialog8(){
	    	var dia = document.getElementById('this-dialog8').showModal();
	    }
	
	    function hidethisdialog8(){
	    	document.getElementById('this-dialog8').close();
	    	
	    }
    </script>
    </td>
    <td>
    <button class="button button9" onclick="showDialog9()"></button>
    <dialog id ="this-dialog9">
    <p></p>
    <img src="img/9.png">
    <br>
    Product info: <br>
	名稱：七星風藍硬盒 20支 <br>
	別名：七星超淡、七星風藍 <br>
	價格：125元 <br>
	品牌地：日本 <br>

    <br>
    <button onclick="hidethisdialog9()">close</button>
    </dialog>
      <script>
	    function showDialog9(){
	    	var dia = document.getElementById('this-dialog9').showModal();
	    }
	
	    function hidethisdialog9(){
	    	document.getElementById('this-dialog9').close();
	    	
	    }
    </script>
    </td>
    <td>
    <button class="button button10" onclick="showDialog10()"></button>
    <dialog id ="this-dialog10">
    <p></p>
    <img src="img/10.png">
    <br>
    Product info: <br>
	名稱：七星LSS清藍3毫克 20支 <br>
	別名：LSS <br>
	價格：125元 <br>
	品牌地：日本 <br>

    <br>
    <button onclick="hidethisdialog10()">close</button>
    </dialog>
    <script>
	    function showDialog10(){
	    	var dia = document.getElementById('this-dialog10').showModal();
	    }
	
	    function hidethisdialog10(){
	    	document.getElementById('this-dialog10').close();
	    	
	    }
    </script>
    </td></tr>
    <tr>
    <td>
    <button class="button button11" onclick="showDialog11()"></button>
    <dialog id ="this-dialog11">
    <p></p>
    <img src="img/11.png">
    <br>
    Product info: <br>
	名稱：馬爾斯長支2毫克菸 <br>
	別名：Mars2號 <br>
	價格：95元 <br>
	品牌地：台灣 <br>
    <br>
    <button onclick="hidethisdialog11()">close</button>
    </dialog>
        <script>
	    function showDialog11(){
	    	var dia = document.getElementById('this-dialog11').showModal();
	    }
	
	    function hidethisdialog11(){
	    	document.getElementById('this-dialog11').close();
	    	
	    }
    </script>
    </td>
    <td>
    <button class="button button12" onclick="showDialog12()"></button>
    <dialog id ="this-dialog12">
    <p></p>
    <img src="img/12.png">
    <br>
    Product info: <br>
	名稱：尊爵白金G2 <br>
	別名：尊爵2毫克(長壽2號) <br>
	價格：100元 <br>
	品牌地：台灣 <br>
    <br>
    <button onclick="hidethisdialog12()">close</button>
    </dialog>
        <script>
	    function showDialog12(){
	    	var dia = document.getElementById('this-dialog12').showModal();
	    }
	
	    function hidethisdialog12(){
	    	document.getElementById('this-dialog12').close();
	    	
	    }
    </script>
    </td>
    <td>
    <button class="button button13" onclick="showDialog13()"></button>
    <dialog id ="this-dialog13">
    <p></p>
    <img src="img/13.png">
    <br>
    Product info: <br>
    名稱：大衛杜夫醇萃香煙(醇白) <br>
	別名：未知 <br>
	價格：100元 <br>
	品牌地：德國、台灣 <br>
    <br>
    <button onclick="hidethisdialog13()">close</button>
    </dialog>
        <script>
	    function showDialog13(){
	    	var dia = document.getElementById('this-dialog13').showModal();
	    }
	
	    function hidethisdialog13(){
	    	document.getElementById('this-dialog13').close();
	    	
	    }
    </script>
    </td>
    <td>
    <button class="button button14" onclick="showDialog14()"></button>
    <dialog id ="this-dialog14">
    <p></p>
    <img src="img/14.png">
    <br>
    Product info: <br>
	名稱：雲絲頓1毫克 <br>
	價格：95元 <br>
	品牌地：日本、台灣 <br>
    <br>
    <button onclick="hidethisdialog14()">close</button>
    </dialog>
        <script>
	    function showDialog14(){
	    	var dia = document.getElementById('this-dialog14').showModal();
	    }
	
	    function hidethisdialog14(){
	    	document.getElementById('this-dialog14').close();
	    	
	    }
    </script>
    </td>
    <td>
    <button class="button button15" onclick="showDialog15()"></button>
    <dialog id ="this-dialog15">
    <p></p>
    <img src="img/15.png">
    <br>
    Product info:
	名稱:倫敦登喜路SL白1毫克<br>
	別名：DUNHILL 1毫克<br>
	價格：110元 <br>
	品牌地：英國 <br>
    <br>
    <button onclick="hidethisdialog15()">close</button>
    </dialog>
        <script>
	    function showDialog15(){
	    	var dia = document.getElementById('this-dialog15').showModal();
	    }
	
	    function hidethisdialog15(){
	    	document.getElementById('this-dialog15').close();
	    	
	    }
    </script>
    </td></tr>
	</tbody>
	</table>
	</section>
	<table class="table2">
	<tr>
	<td>
    <button class="home" style="width:150px;height:40px" onclick="changepage()">back</button>
    <script>
		function changepage(){
			window.location.href ="decoration.jsp"
		}
	</script>
	</td>
	<td>
     <button class="home" style="width:150px;height:40px" onclick="changepage1()">test_mode</button>
    <script>
		function changepage1(){
			window.location.href ="test_mode.jsp"
		}
	</script>
   </td></tr></table>

</body>
</html>