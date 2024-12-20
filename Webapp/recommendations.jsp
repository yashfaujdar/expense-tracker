<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Recommendations | Voyager</title>
    <link rel="stylesheet" href="./assets/css/reset.css">
    <link href="https://fonts.googleapis.com/css?family=Muli:300,400,700,900" rel="stylesheet">
    <link rel="stylesheet" href="./assets/css/style.css">
    <link rel="stylesheet" href="promotions_style.css">

    <style>
        form{
            margin: auto;
            margin-top: 10px; 
            width:450px;
            height:490px; 
            display:flex;
            flex-direction:column; 
            justify-content:center; 
            align-items:center;
            text-align: center; 
            color: white;
            text-shadow: black 2px 2px 2px;
            font-size: 20px;
            opacity: 70%;
            background-color: black; 
            box-shadow: 3px 3px 5px 2px rgb(255, 255, 255), 0 0 20px black;
        }
        .options{
            display: block;
        }

        .options input{
            margin: auto;
        }

        .submit_btn:hover{
            background-color: black;
            opacity: 100%;
            color: orangered;
        }
    </style>
</head>

<body>

    <div id="scam" style="opacity:0;">
        <form name="myform" class="boxshadow" method="get" action="InR">
            <div id="ip-box">
                <p style="font-size: 28px; text-shadow: 2px 2px 2px orangered;">Location:</p>
                <br>
                <div class="options">
                    <input type="radio" id="loc_01" name="locn" value="l_01" required>Delhi<br>
                    <input type="radio" id="loc_02" name="locn" value="l_02">Mumbai<br>
                    <input type="radio" id="loc_03" name="locn" value="l_03">Pondicherry<br>
                    <input type="radio" id="loc_04" name="locn" value="l_04">Jaipur<br>
                    <input type="radio" id="loc_05" name="locn" value="l_05">Manali<br>
                </div><br>
    
                <p style="font-size: 28px; text-shadow: 2px 2px 2px orangered;">Recommendations:</p>
                <br>
                <textarea name="recs" rows="10" cols="30" style="width:350px" placeholder="Enter recommendations separated by ,"></textarea>
                <br/>
                <input class="submit_btn" style="width: 150px;height:40px;margin:auto;margin-top:20px;font-size:20px;background-color:white;opacity:70%;border-radius:5px;box-shadow:0px 0px 2px 2px white;text-shadow:2px 2px 2px white;" type="submit" value="Submit" />
            </div>
        </form>
    </div>

    <div id="insertOutput"></div>

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
                <span class="drop-list"><a href="profile_details.jsp">Profile</a></span><br>
                <span class="drop-list"><a href="LogOut">LogOut</a></span>
            </div>
        </div>
    </div>

    <div id="heading" style="font-size: 50px;">
        <h1 style="margin-left: 90px; margin-top: 50px;">
            <span>Recommendations</span> 
        </h1>
    </div>

    <script src="./assets/js/main.js"></script>
    <script>
        var gid;
        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                gid = this.responseText.split(",")[0];
            }
        }
        xhttp.open("GET", "GetSession", true);
        xhttp.send();

        window.onload = load();
        function load() {
            setTimeout(function(){fadein();}, 500);
        }

        function insert() {
            var locn = document.myform.locn.value;
            var recs = document.myform.recs.value;
            var url = "InR?locn=" + locn + "&recs=" + recs; 
            var xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function() {
                if (this.readyState == 4 && this.status == 200) {
                    var val = xhttp.responseText;
                    document.getElementById("scam").remove();
                    document.getElementById("insertOutput").innerHTML = val;
                }
            }
            xhttp.open("GET", url, true);
            xhttp.send();
        }

        function fadein() {
            var ele = document.getElementById("scam");
            ele.style.display = "flex";
            ele.style.opacity = parseFloat(ele.style.opacity) + 0.05;
            if (ele.style.opacity < 1) {
                setTimeout(function(){fadein();}, 50);
            }
        }
    </script>

</body>

</html>
