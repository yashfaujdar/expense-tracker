<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>Home | Voyager</title>
    <link rel="stylesheet" href="trav_hmpg-style.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Aladin&display=swap" rel="stylesheet">
</head>

<body>
    <div class="nav-bar">
        <p style="margin:5px;">
            <a id="logo" href="index.jsp">
                <img src="images/logo2-1.png" alt="logo" width="250px;"> 
            </a>
            <div class="dropdown">
                <div id="prof" style="display: flex; cursor:pointer;" onmouseover="noarrow()" onmouseout="arrow()">
                    <span id="arrow" style="font-size:40px; height:fit-content; margin-top:px; width:25px;">&#8964;</span>
                    <img src="images/img.jpg" height="50px" style="margin-top:5px; margin-left:8px; border-radius:25px;">
                </div>
                <p id="drop">
                    <span><a href="profile_details.jsp" style="cursor:pointer;">Profile</a></span><br>
                    <span><a onclick="logout()" style="cursor:pointer;">Log Out</a></span>
                </p>
            </div>
        </p>
    </div>

    <div id="page">
        <div id="user-name-display">
            <% String uid = (String) session.getAttribute("uid"); %>
            <% if (uid != null) { %>
                Hi traveler, @<%= uid %>!
            <% } %>
        </div>
        <div id="animated-text">
            <svg width="372.16" height="83.281" viewBox="0 0 372.16 83.281" xmlns="http://www.w3.org/2000/svg">
                <g id="svgGroup" stroke-linecap="round" fill-rule="evenodd" font-size="9pt" stroke="#000" stroke-width="0.25mm" fill="none" style="stroke:#000;stroke-width:0.25mm;fill:none">
                </g>
            </svg>
        </div>

        <div class="trips">
            <div class="trip add-new">
                <div class="trip-box add-new-box">
                    <img src="images/lmau1e6ojtvrbpsr0ul1k62dv1-767e6cd275b68fdeced88185bb782fca.png" onclick="plantrip()">
                    <p class="trip-name add-new-name"></p>
                </div>
            </div>
            <% 
                String[] trips = (String[]) session.getAttribute("trips");
                if (trips != null) {
                    for (int i = 0; i < trips.length; i++) {
                        String[] tripDetails = trips[i].split(" ");
                        String tripName = tripDetails[0];
                        String tripDate = tripDetails[1];
                        String tripId = tripDetails[2];
            %>
            <div class="trip" onclick="get_trip('<%= tripId %>');">
                <div class="trip-box">
                    <img src="<%= bg_images[(int) (Math.random() * bg_images.length)] %>">
                    <p class="trip-name"><%= tripName %><br><%= tripDate %><span style="color:transparent;"><%= tripId %></span></p>
                </div>
            </div>
            <% 
                    }
                }
            %>
        </div>
    </div>

    <footer>
        ©Copyright Voyager pvt. ltd. All Rights Reserved<br>
    </footer>

    <script>
        var bg_images = ['images/kace-rodriguez-p3OzJuT_Dks-unsplash.jpg', 'images/82110e97218accc0de55d980631fcce7.jpg', 'images/wp2386087-turkish-wallpapers.jpg'];

        function sessionValidater(){
            setInterval(() => {
                fetch('GetSession').then(response => response.text()).then(data => {
                    if (!data.split(",")[0]) {
                        window.location.replace("login.jsp");
                    }
                });
            }, 2000);
        }
        sessionValidater();

        function get_trip(tripId){ 
            window.open("GetTrip?tid=" + tripId, "_blank");
        }

        function plantrip(){
            window.location.href = "plan_initiate.jsp";
        }

        function noarrow(){
            document.getElementById("arrow").innerHTML = "";
        }

        function arrow(){
            document.getElementById("arrow").innerHTML = "&#8964;";
        }

        function logout(){
            window.location.replace("LogOut");
        }

        function setTextAnimation(delay, duration, strokeWidth, timingFunction, strokeColor,repeat) {
            let paths = document.querySelectorAll("path");
            let mode=repeat?'infinite':'forwards'
            for (let i = 0; i < paths.length; i++) {
                const path = paths[i];
                const length = path.getTotalLength();
                path.style["stroke-dashoffset"] = `${length}px`;
                path.style["stroke-dasharray"] = `${length}px`;
                path.style["stroke-width"] = `${strokeWidth}px`;
                path.style["stroke"] = `${strokeColor}`;
                path.style["animation"] = `${duration}s svg-text-anim ${mode} ${timingFunction}`;
                path.style["animation-delay"] = `${i * delay}s`;
            }
        }
        setTextAnimation(0.1,3.3,2,'ease-in','#ffffff',true);

    </script>
</body>

</html>
