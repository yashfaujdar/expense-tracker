<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Travel Planner</title>
    <style>
        body {
            width: 100vw;
            height: 100vh;
            display: flex;
            flex-direction: column;
        }
        .nav-bar p {
            margin: 5px;
        }
        #prof {
            display: flex;
            cursor: pointer;
        }
        .slide {
            overflow-y: scroll;
        }
        .display {
            overflow-y: scroll;
        }
    </style>
</head>
<body>
    <div class="nav-bar">
        <p>
            <a id="logo" href="index.jsp">
                <img src="images/logo2-1.png" alt="logo" width="250px">
            </a>
            <div class="dropdown">
                <div id="prof" onmouseover="noarrow()" onmouseout="arrow()">
                    <span id="arrow" style="font-size:40px; height:fit-content; margin-top:-5px; width:25px;">&#8964;</span>
                    <img src="images/img.jpg" height="50px" style="margin-top:5px; margin-left:8px; border-radius:25px;">
                </div>
                <p id="drop">
                    <span><a href="profile_details.jsp">Profile</a></span><br>
                    <span><a href="LogOut" style="cursor: pointer;">Log Out</a></span>
                </p>
            </div>
        </p>
    </div>
    <div id="page">
        <div id="nav">
            <div id="onward-trans" class="tab" onclick="onw()">Onward transit</div>
            <div id="return-trans" class="tab" onclick="ret()">Return transit</div>
            <div id="accomodation" class="tab" onclick="acc()">Accommodation</div>
            <div id="iten" class="tab" onclick="itin()">Itinerary</div>
            <div id="view_iten" class="tab" onclick="new_page()">View trip summary</div>
            <div id="save" class="tab" onclick="save()">Save</div>
        </div>
        
        <%-- Slide sections --%>
        <div class="slide" id="slide-onw">
            <%-- Filter options for onward transit --%>
            <div class="filter-options">
                <h3>FILTERS</h3>
                <form id="onw-filters">
                    <div>
                        <input type="radio" name="st-city" id="st-city" value="st-city">
                        <label for="st-city">Filter by start city</label>
                    </div><br>
                    <div>
                        <input type="radio" name="dest-city" id="dest-city" value="dest-city">
                        <label for="dest-city">Filter by dest city</label>
                    </div><br>
                    <div>
                        <label for="trans">Filter by transit type:</label><br>
                        <input type="radio" name="trans" id="Flight" value="Flight">Flight<br>
                        <input type="radio" name="trans" id="Train" value="Train">Train
                    </div><br>
                    <div>
                        <label for="cost">Sort by cost:</label><br>
                        <input type="radio" name="cost" id="inc" value="inc">
                        <label for="inc">Increasing</label><br>
                        <input type="radio" name="cost" id="dec" value="dec">
                        <label for="dec">Decreasing</label>
                    </div><br>
                    <button type="button" onclick="onw_filter(0,'choose_onw')">Apply filters</button>
                </form>
                <div>
                    <p id="choice1"></p>
                </div>
            </div>
            <div class="display"></div>
        </div>

        <%-- Remaining slides for return transit, accommodation, and itinerary can follow the same pattern --%>

    </div>

    <script>
        function sessionValidater(){
            fetch('GetSession')
                .then(response => response.text())
                .then(data => {
                    if (!data.split(",")[0]) {
                        window.location.replace("login.jsp");
                    }
                });
        }

        setInterval(sessionValidater, 2000);

        function onw() {
            document.getElementById("onward-trans").style.backgroundColor = "grey";
            document.getElementById("return-trans").style.backgroundColor = "";
            document.getElementById("accomodation").style.backgroundColor = "";
            document.getElementById("iten").style.backgroundColor = "";

            document.getElementById("slide-onw").style.display = "flex";
            document.getElementById("slide-ret").style.display = "none";
            document.getElementById("slide-accom").style.display = "none";
            document.getElementById("slide-iten").style.display = "none";

            clear_display();
            get_all_options(0, "choose_onw");
        }

        <%-- Add JavaScript functions for ret(), acc(), itin(), and others --%>
    </script>
</body>
</html>
