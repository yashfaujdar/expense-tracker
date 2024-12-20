<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>View Budget | Voyager</title>
    <link rel="stylesheet" href="./assets/css/reset.css">
    <link href="https://fonts.googleapis.com/css?family=Muli:300,400,700,900" rel="stylesheet">
    <link rel="stylesheet" href="./assets/css/style.css">
    <link rel="stylesheet" href="promo_style.css">

    <style>

        .view-page {
            margin: auto;
            display: flex;
            background-color: rgba(0,0,0,0.7);
            color: white;
            width: 400px;
            height: 0px;
        } 
        #ip-box{
            margin:auto;
            width: 250px;
            display:flex; 
            flex-direction: column;
            font-size: large;
        }

        #ip-box input{
            margin:auto
        }

        .options{
            display: flex;
        }

        .options input{
            margin: auto;
        }

        #submit_btn:hover{
            background-color: grey;
            opacity: 50%;
            color: black;
        }

    </style>
 
</head>
 
<body>
    <div id="scam" style="opacity:0;">
        <div id="row1">
            <form class="boxshadow" method="get" action="BudgExpDetails" style="display:flex; flex-direction:column;height:300px;">
                <label for="budg_name" style="font-size: 28px; text-shadow: 2px 2px 2px orangered;">Budget Category Name: </label>
                <br>
                <input type="hidden" id="tid" name="tid" value="<%= request.getParameter("tid") %>">
                <input style="width: 200px; height: 30px;" type="text" id="budg_name" name="budg_name" required placeholder="Enter Budget Category">
                <input type="submit" value="View Details" style="width: 150px;height:30px;margin:auto;margin-top:20px;margin-left:10px; font-size: 20px; text-shadow: 2px 2px 2px white;">
            </form> 
        </div>
    </div>

    <div class="nav-bar">
        <div id="logo-def">
            <a id="logo-img" href="index.html">
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
            <span>View Budget</span>
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
            document.getElementById("tid").value = tid;

            var xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function() {
                if (this.readyState == 4 && this.status == 200) {
                    // handle response if necessary
                }
                setTimeout(function(){
                    fadein();
                }, 300); 
            };
        }
        
        function fadein(){
            var ele = document.getElementById("scam");
            ele.style.display = "flex";
            ele.style.opacity = parseFloat(ele.style.opacity) + 0.05;
            if(ele.style.opacity < 1){
                setTimeout(function(){ fadein(); }, 50);  
            }
        }

        function view(){
            var url_string = window.location.href;
            var url = new URL(url_string);

            var budg_name = document.getElementById('budg_name').value;
            var xhttp = new XMLHttpRequest();

            xhttp.onreadystatechange = function() {
                if (this.readyState == 4 && this.status == 200) {
                    document.getElementById("moveup-page").innerHTML = "";
                    document.getElementById("moveup-page").innerHTML = this.responseText;
                    if(document.getElementsByClassName("sign-page").length != 0){
                        document.getElementsByClassName("sign-page")[0].style.opacity = 100;
                    }
                    if(document.getElementsByClassName("view-page").length != 0){
                        document.getElementsByClassName("view-page")[0].style.opacity = 100;
                    }
                }
                setTimeout(function(){
                    fadein();
                }, 300);
            };
        
            xhttp.open("GET", "BudgExpDetails?trip_id=" + tid + "&budget_name=" + budg_name, true);
            xhttp.send();
        }
 
        function moveup(h){
            if(h == 75){
                return;
            }
            document.getElementById("moveup-page").style.height = h + "vh";
            h = h + 1;
            setTimeout(function(){ moveup(h); }, 10);
            document.getElementById("heading").remove();
        }

        function fadeout(n){
            if(document.getElementsByClassName("sign-page").length == 0 && document.getElementsByClassName("log-page").length == 0){
                return;
            }
            if(n == 2 && document.getElementsByClassName("sign-page").length != 0){
                var ele = document.getElementsByClassName("sign-page")[0];
                if(ele.style.opacity == 0){
                    return;
                }
                ele.style.opacity -= 0.05;
            }
            if(n == 1 && document.getElementsByClassName("view-page").length != 0){
                var ele = document.getElementsByClassName("view-page")[0];
                if(ele.style.opacity == 0){
                    return;
                }
                ele.style.opacity -= 0.05;
            }
            setTimeout(function(){ fadeout(n); }, 10);
        }
    </script>

</body>

</html>
