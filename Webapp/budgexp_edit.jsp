<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Add Budget or Expense | Voyager</title>
    <link rel="stylesheet" href="./assets/css/reset.css">
    <link href="https://fonts.googleapis.com/css?family=Muli:300,400,700,900" rel="stylesheet">
    <link rel="stylesheet" href="./assets/css/style.css">
    <link rel="stylesheet" href="budg_hmpg_style.css">
</head>

<body> 
    <div id="scam" style="opacity:0;">
        <div id="row1">
            <div id="viewbudgexp" style="margin-right:auto;" onclick="fn1()">
                Add Budget
            </div>
            <div id="editbudgexp" style="margin-left:auto;" onclick="fn2()">
                Add Expenses
            </div>
        </div>
    </div>

    <div class="nav-bar">
        <div id="logo-def">
            <a id="logo-img" href="index.jsp">
                <img src="images/logo2-1.png" alt="logo" width="270px">
            </a>
        </div>
        <div id="prof">
            <div id="arr-div" style="margin-top:5px; margin-left:auto; border-radius:25px;display:flex;">
                <span id="arrow" style="font-size:40px; height:fit-content; margin-top:-5px; width:25px;">&#8964;</span>
                <img src="images/img.jpg" width="52px" style="border-radius:25px; margin-left:8px;">
            </div>
            <div id="drop">
                <span><a href="profile_details.jsp">Profile</a></span><br>
                <span><a onclick="window.location.replace('LogOut');" style="cursor:pointer;">LogOut</a></span>
            </div>
        </div>
    </div>

    <div id="heading">
        <h1 style="margin-left: 90px; margin-top: 50px;">
            <span>Add Budget or Expenses</span>
        </h1>
    </div>

    <script src="./assets/js/main.js"></script>
    <script>
        window.onload = load;
        var tid;

        function load(){
            setTimeout(function(){ fadein(); }, 500);
            
            var url_string = window.location.href;
            var url = new URL(url_string);
            tid = url.searchParams.get("tid");
            
            // Handle asynchronous logic if necessary
            var xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function() {
                if (this.readyState == 4 && this.status == 200) { 
                    // Perform necessary action
                }
                setTimeout(function(){
                    fadein();
                }, 300);
            }; 
        }

        function fn1(){
            // Redirect to the add budget page with tid
            window.location.href = 'budg_edit.jsp?tid=' + tid;
        }

        function fn2(){
            // Redirect to the add expenses page with tid
            window.location.href = 'exp_edit.jsp?tid=' + tid;
        }

        function fadein(){ 
            var ele = document.getElementById("scam");
            ele.style.display = "flex";
            ele.style.opacity = parseFloat(ele.style.opacity) + 0.05;
            if(ele.style.opacity < 1){
                setTimeout(function(){ fadein(); }, 50);  
            }
        }
    </script>

</body>

</html>
