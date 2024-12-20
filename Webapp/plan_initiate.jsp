<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <title> Plan New Trip | Voyager </title>
    <script src="https://www.amcharts.com/lib/4/core.js"></script>
    <script src="https://www.amcharts.com/lib/4/maps.js"></script>
    <script src="https://www.amcharts.com/lib/4/geodata/worldLow.js"></script>
    <script src="https://www.amcharts.com/lib/4/themes/animated.js"></script>
    
    <style>
        body {
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol";
            display: flex; 
            background-image:url('<%= request.getContextPath() %>/images/wallpaperflare.com_wallpaper (1).jpg');
            font-family: PoiretOne-Regular;
        }

        #chartdiv {
            width: 40vw;
            height: 100vh;
            max-width: 100%;
            background-color: transparent;
            margin: -8px;
            position: relative;
            margin-left: auto;
        }
        
        .chart-overlay {
            width: 100vw;
            height: 100vh;
            max-width: 100%;
            margin: -8px;
            position: absolute;
            background-color: transparent;
            display: flex;
        }

        .form-content {
            width: 60%;
            height: 78%;
            margin: auto;
            margin-left: 5vw;
            background-color: rgba(0,0,0,0.7);
            display: flex;
            flex-direction: column;
            color: white;
            font-family: PoiretOne-Regular;
            justify-content: center;
            align-items: center;
        }

        #city-choices-dest {
            width: 90%;
            height: 35%;
            background-color: black;
            display: flex;
        }

        #city-choices-dest .img {
            width: 18%;
            height: 100%;
            margin: 10px;
            display: flex;
            border-radius: 20px;
        }

        #city-choices-dest .img img {
            width: 140px;
            height: 160px;
            margin: 5px;
            border-radius: 20px;
            pointer-events: none;
        }

        #city-choices-dest .img .head {
            position: absolute;
            width: 140px;
            height: 160px;
            margin: 5px;
            border-radius: 20px;
            background-color: rgba(0,0,0,0.6);
            display: flex;
            justify-content: center;
            align-items: center;
            pointer-events: none;
        }  

        #city-choices-dest .img:hover > .head {
            background-color: rgba(0,0,0,0.8);
        }

        .form-content button {
            position: absolute;
            align-self: last baseline;
            margin-right: 3%;
            margin-top: 25%;
            width: 100px;
            height: 50px;
            background-color: rgba(255,255, 255, 0.8);
            color: black;
            outline: none;
        }
    </style>
</head>
<body>
    <script src="<%= request.getContextPath() %>/globe_animate.js"></script>
    <div id="chartdiv"></div>
    <div class="chart-overlay">
        <div class="form-content">
            <h1>Choose your destination</h1>
            <div id="city-choices-dest">
                <%-- Dynamically populated via JavaScript --%>
            </div>
            <button type="button" onclick="dispnext(0)">Next</button>
        </div>

        <div class="form-content" style="display: none;">
            <h1>Choose your start city</h1>
            <select name="src-city" id="src-city" style="background-color: rgba(0,0,0,0.8); outline: none; border: none; color: white; height: 50px; font-size: large;">
                <option value="" disabled selected>Select</option>
                <%-- Option values dynamically populated via JavaScript --%>
            </select>
            <button type="button" onclick="if(invalid()){}else if(document.getElementById('src-city').value!=''){dispnext(1);} else {window.alert('Please select city!');}">Next</button>
        </div>

        <div class="form-content" style="display: none;">
            <h1>Choose dates for travel</h1>
            Trip start: <input type="date" id="start_date" name="start_date" style="background-color: rgba(0,0,0,0.8); outline: none; border: none; height: 50px; font-size: large; color-scheme: dark;"><br>
            Return: <input type="date" id="end_date" name="end_date" style="background-color: rgba(0,0,0,0.8); outline: none; border: none; height: 50px; font-size: large; color-scheme: dark;">
            <button type="button" onclick="if(check_dates()){}else{start_plan();}">Start planning</button>
        </div>
    </div>

    <script>
        setInterval(sessionValidater, 2000);

        function sessionValidater() {
            var xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function() {
                if (this.readyState == 4 && this.status == 200) {
                    if (!this.responseText.split(",")[0]) {
                        window.location.replace("<%= request.getContextPath() %>/login.jsp");
                    }
                }
            }
            xhttp.open("GET", "GetSession", true);
            xhttp.send();
        }

        var dest = "";

        var xhttp1 = new XMLHttpRequest();
        xhttp1.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                display_cities(this.responseText);
            }
        }
        xhttp1.open("GET", "GetCities", true);
        xhttp1.send();

        function invalid() {
            if (document.getElementById("src-city").value == dest) {
                window.alert("Your source and destination cannot be the same!");
                return 1;
            }
            return 0;
        }

        function check_dates() {
            if (document.getElementById('start_date').value == '' || document.getElementById('end_date').value == '') {
                window.alert('Please choose both dates!');
            } else if (document.getElementById('start_date').value > document.getElementById('end_date').value) {
                window.alert('Start date cannot be lesser than end date!');
            } else {
                return 0;
            }
            return 1;
        }

        function display_cities(txt) {
            var l = txt.split("\n");
            var txt1 = "";
            var txt2 = "";
            for (var i = 0; i < l.length - 1; i++) {
                txt1 += "<div class='img' onclick='select_city(" + i + ")' style='margin-left:0px;'><img src='<%= request.getContextPath() %>/images/kace-rodriguez-p3OzJuT_Dks-unsplash.jpg'><div class='head' id='" + l[i].split(',')[1] + "'>" + l[i].split(',')[0] + "</div></div>";
                txt2 += "<option value='" + l[i].split(',')[1] + "'>" + l[i].split(',')[0] + "</option>";
            }
            document.getElementById("city-choices-dest").innerHTML += txt1;
            document.getElementById("src-city").innerHTML += txt2;
        }

        function select_city(n) {
            var cities = document.getElementsByClassName("head");
            for (var i = 0; i < cities.length; i++) {
                cities[i].style.border = "";
                cities[i].style.background = "rgba(0,0,0,0.2)";
            }
            
            cities[n].style.border = "0.5px solid white";
            cities[n].style.background = "rgba(0,0,0,0.8)";
            dest = cities[n].id;
        }

        function dispnext(n) {
            if (dest == "") {
                window.alert("Please choose a city!");
                return;
            }
            var forms = document.getElementsByClassName("form-content");
            forms[n].style.display = "none";
            forms[n + 1].style.display = "flex";
        }

        function start_plan() {
            var url_param = "?st_place=" + document.getElementById('src-city').value + "&dest=" + dest + "&st_date=" + document.getElementById('start_date').value + "&end_date=" + document.getElementById('end_date').value;
            var xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function() {
                if (this.readyState == 4 && this.status == 200) {
                    window.open("GetTrip?tid=" + this.responseText.split("\n")[0], "_blank");
                    window.open("<%= request.getContextPath() %>/trav_hmpg.jsp", "_self");
                }
            }
            xhttp.open("GET", "InsertTrip" + url_param, true);
            xhttp.send();
        }
    </script>
</body>
</html>
