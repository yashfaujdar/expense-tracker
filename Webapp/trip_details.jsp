<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.net.*, java.io.*" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Your Trip | Voyager</title>
    <link rel="stylesheet" href="./assets/css/reset.css">
    <link href="https://fonts.googleapis.com/css?family=Muli:300,400,700,900" rel="stylesheet">
    <link rel="stylesheet" href="./assets/css/style.css">
    <link rel="stylesheet" href="trip_details-style.css">
    <style>
        footer {
            margin-bottom: -18px;
            width: 100vw;
            height: 35px;
            position: fixed;
            text-align: center;
            background-color: rgba(0, 0, 0, 1);
            height: 0.3in;
            font-size: small;
            color: grey;
        }
    </style>
</head>

<body>
    <div id="scam" style="opacity:0;">
        <div id="row1">
            <div id="iten" style="margin-right:auto;cursor: pointer;">
                Itinerary
            </div>
            <div id="budg" style="margin-left:auto;cursor: pointer;">
                Budget
            </div>
        </div>

        <div id="row2">
            <div id="checklist" style="cursor: pointer;">
                Checklists
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
            <div id="arr-div" style="margin-top:5px; margin-left:auto; border-radius:25px;display:flex;cursor: pointer;">
                <span id="arrow" style="font-size:40px; height:fit-content; margin-top:-5px; width:25px;">&#8964;</span>
                <img src="images/img.jpg" width="52px" style="border-radius:25px; margin-left:8px;">
            </div>
            <div id="drop">
                <span class="drop-list"><a href="profile_details.jsp" style="cursor: pointer;">Profile</a></span><br>
                <span class="drop-list"><a href="LogOut.jsp" style="cursor: pointer;">Log Out</a></span>
            </div>
        </div>
    </div>
    <div id="hero-slider">
        <div id="logo" class="mask">
        </div>
        <div id="slideshow">
            <div id="slides-main" class="slides">
                <div class="slide" data-index="0">
                    <div class="abs-mask">
                        <div class="slide-image">
                        </div>
                    </div>
                </div>
            </div>

            <div id="slides-aux" class="slides mask"></div>
        </div>
        <div id="info">
            <div class="slider-title-wrapper">
                <span class="line"></span>
                <h1 class="slider-title">
                    <span>Details</span>
                </h1>
            </div>
            <div id="details">
                <em>TRIP NAME</em><br>
                <p>Start city</p><br>
                <div id="st-city">
                    <%= request.getAttribute("startCity") %>
                </div>
                <p>Destination</p><br>
                <div id="dest">
                    <%= request.getAttribute("destination") %>
                </div>
                <p>Start date</p><br>
                <div id="st-date">
                    <%= request.getAttribute("startDate") %>
                </div>
                <p>End date</p><br>
                <div id="end-date">
                    <%= request.getAttribute("endDate") %>
                </div>
            </div>
        </div>

        <nav id="slider-nav">
            <span class="current" style="margin-right:50px;">01</span>
        </nav>
    </div>
    <footer>
        ©Copyright Voyager Pvt. Ltd. All Rights Reserved<br>
    </footer>

    <script src="./assets/js/main.js"></script>
    <script>
        setInterval(sessionValidater, 2000);
        function sessionValidater() {
            var xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function() {
                if (this.readyState == 4 && this.status == 200) {
                    if(this.responseText.split(",")[0]){
                    }
                    else{
                        window.location.replace("login.jsp");
                    }
                }
            }
            xhttp.open("GET", "GetSession", true);
            xhttp.send();
        }
        window.onload(load());

        function load() {
            setTimeout(function() { fadein(); }, 2100);

            var url_string = window.location.href;
            var url = new URL(url_string);
            var paramValue = url.searchParams.get("tid");

            document.getElementById("iten").addEventListener("click", function() {
                window.open('GetItin?tid=' + paramValue, "_blank");
            });
            document.getElementById("budg").addEventListener("click", function() {
                window.open('GetBudg?tid=' + paramValue, "_blank");
            });
            document.getElementById("checklist").addEventListener("click", function() {
                window.open('GetChecklist?tid=' + paramValue, "_blank");
            });

            var xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function() {
                if (this.readyState == 4 && this.status == 200) {
                    var details = this.responseText.split("\n");
                    document.getElementById("st-city").innerHTML = details[0];
                    document.getElementById("dest").innerHTML = details[1];
                    document.getElementById("st-date").innerHTML = details[2];
                    document.getElementById("end-date").innerHTML = details[3];
                }
            }
            xhttp.open("GET", "GetTripDetails?tid=" + paramValue, true);
            xhttp.send();
        }

        function fadein() {
            var ele = document.getElementById("scam");
            ele.style.display = "flex";
            ele.style.opacity = parseFloat(ele.style.opacity) + 0.05;
            if (ele.style.opacity < 1) {
                setTimeout(function() { fadein(); }, 70);
            }
        }
    </script>
</body>

</html>
