<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Guide | Voyager</title>
    <link rel="stylesheet" href="./assets/css/reset.css">
    <link href="https://fonts.googleapis.com/css?family=Muli:300,400,700,900" rel="stylesheet">
    <link rel="stylesheet" href="./assets/css/style.css">
    <link rel="stylesheet" href="ag_hmpg_style.css">
</head>

<body>
    <div id="scam" style="opacity:0;">
        <div id="row1">
            <div id="recs"> 
                Add Recommendations
            </div>
        </div>
    </div> 

    <div class="nav-bar"> 
        <div id="logo-def">
            <a id="logo-img" href="index.html">
                <img src="images/logo2-1.png" alt="logo" width="270px">
            </a>
        </div>
        <div id="prof">
            <div id="arr-div" style="margin-top:5px; margin-left:auto; border-radius:25px; display:flex;">
                <span id="arrow" style="font-size:40px; height:fit-content; margin-top:-5px; width:25px;">&#8964;</span>
                <img src="images/img.jpg" width="52px" style="border-radius:25px; margin-left:8px;">
            </div>
            <div id="drop">
                <span class="drop-list"><a href="profile_details.html">Profile</a></span><br>
                <span class="drop-list"><a href="LogOut">LogOut</a></span>
            </div>
        </div>
    </div>

    <div id="heading">
        <h1 style="margin-left: 90px; margin-top: 50px;">
            <span>Guide</span>
        </h1>
    </div>
    <div id="user-name-display" style="margin: auto; margin-top: 50px; margin-left: 540px; font-family:PoiretOne-Regular; font-size:40px; text-shadow: 2px 2px 2px orangered; color: beige;">
        <!-- Dynamic guide name will be displayed here -->
        <c:if test="${not empty sessionScope.guideId}">
            Welcome Guide, @${sessionScope.guideId}!
        </c:if>
        <c:if test="${empty sessionScope.guideId}">
            <script>
                window.location.replace("login.html");
            </script>
        </c:if>
    </div>

    <footer>
        ©Copyright Voyager pvt. ltd. All Rights Reserved
    </footer>

    <script src="./assets/js/main.js"></script>
    <script>
        window.onload = load();

        function load(){
            setTimeout(function(){ fadein(); }, 500);
            document.getElementById("recs").addEventListener("click", function(){ window.location.href = 'recommendations.html'; });
        }

        function fadein(){
            var ele = document.getElementById("scam");
            ele.style.display = "flex";
            ele.style.opacity = parseFloat(ele.style.opacity) + 0.05;
            if (ele.style.opacity < 1) {
                setTimeout(function(){ fadein(); }, 50);  
            }
        }
    </script>

</body>

</html>
