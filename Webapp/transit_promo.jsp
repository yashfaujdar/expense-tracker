<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Admin - Transit Promotions | Voyager</title>
    <link rel="stylesheet" href="./assets/css/reset.css">
    <link href="https://fonts.googleapis.com/css?family=Muli:300,400,700,900" rel="stylesheet">
    <link rel="stylesheet" href="./assets/css/style.css">
    <link rel="stylesheet" href="promo_style.css">

    <style>
        .view-page {
            margin: auto;
            display: flex;
            background-color: rgba(0, 0, 0, 0.7);
            color: white;
            width: 400px;
            height: 0px;
        }

        #submit_btn:hover {
            background-color: black;
            opacity: 50%;
            color: white;
        }

        #editpromopri {
            margin: auto;
            margin-top: 70px;
            width: 450px;
            height: 160px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
            color: white;
            text-shadow: black 2px 2px 2px;
            font-size: 20px;
            opacity: 70%;
            background-color: black;
            box-shadow: 3px 3px 5px 2px rgb(255, 255, 255), 0 0 20px black;
        }

        .boxshadow {
            margin: auto;
            margin-top: 25px;
            width: 260px;
            height: 100px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
            color: white;
            text-shadow: black 2px 2px 2px;
            font-size: 30px;
            opacity: 70%;
            background-color: black;
            box-shadow: 3px 3px 5px 2px rgb(255, 255, 255), 0 0 20px black;
        }
    </style>

</head>

<body>
    <div id="scam" style="opacity:0;">
        <div id="row1">
            <form class="boxshadow" method="get">
                <label for="transit_id">Transit ID: </label>
                <br>
                <input style="width: 200px; height: 30px;" type="text" id="transit_id" name="transit_id" required placeholder="Enter Transit ID">
            </form>
        </div>
        <div id="row2">
            <div id="view" style="margin-right:auto;" onclick="view()">View Details</div>
            <div id="edit" style="margin-left:auto;" onclick="edit()">Edit Promotions</div>
        </div>
        <div id="row3">
            <div id="moveup-page" style="height:0vh;">
                <form method="get" id="editpromopri">
                    <label for="prom_pri" style="font-size: 28px; text-shadow: 2px 2px 2px orangered;">Promotion Priority: </label><br>
                    <br>
                    <input style="width: 200px; height: 30px;" type="text" name="prom_pri" id="prom_pri" required placeholder="Enter New Promotion Priority">
                    <br>
                    <input type="submit" id="submit_btn" value="Edit Promotion" style="width: 150px;height:30px;margin:auto;margin-top:20px;font-size:20px;background-color:white;opacity:70%;border-radius:5px;box-shadow:0px 0px 2px 2px white;text-shadow:2px 2px 2px white;" onclick="updatepri()">
                </form>
                <div id="updateOutput" class="view-page" style="display:none"></div>
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
                <span class="drop-list"><a href="LogOut">Log Out</a></span>
            </div>
        </div>
    </div>

    <div id="heading">
        <h1 style="margin-left: 90px; margin-top: 50px;">
            <span>Transit Promotions</span>
        </h1>
    </div>

    <script src="./assets/js/main.js"></script>

    <script>
        window.onload = load();

        function load() {
            setTimeout(function() {
                fadein();
            }, 500);
        }

        function loaddoc(n) {
            var url_string = window.location.href;
            var url = new URL(url_string);
            var transit_id = document.getElementById('transit_id').value;
            var prom_pri = document.getElementById('prom_pri').value;
            var xhttp = new XMLHttpRequest();

            xhttp.onreadystatechange = function() {
                if (this.readyState == 4 && this.status == 200) {
                    document.getElementById("moveup-page").innerHTML = "";
                    document.getElementById("moveup-page").innerHTML = this.responseText;
                    if (document.getElementsByClassName("sign-page").length != 0) {
                        document.getElementsByClassName("sign-page")[0].style.opacity = 100;
                    }
                    if (document.getElementsByClassName("view-page").length != 0) {
                        document.getElementsByClassName("view-page")[0].style.opacity = 100;
                    }
                }
                setTimeout(function() {
                    fadein(n);
                }, 300);
            };

            if (n == 1) {
                xhttp.open("GET", "TransPromoDetails?transit_id=" + transit_id, true);
                xhttp.send();
            }
            if (n == 2) {
                //xhttp.open("GET", "trans_promo_edit.html", true);
                //xhttp.open("GET", "TransPromoEditDetails?transit_id="+transit_id+"&prom_pri="+prom_pri, true);
                //xhttp.send();
            }
            xhttp.send();
        }

        function fadein() {
            var ele = document.getElementById("scam");
            ele.style.display = "flex";
            ele.style.opacity = parseFloat(ele.style.opacity) + 0.05;
            if (ele.style.opacity < 1) {
                setTimeout(function() {
                    fadein();
                }, 50);
            }
        }

        function view() {
            document.getElementById("view").style.backgroundColor = "rgba(30,30,30,0.8)";
            document.getElementById("edit").style.backgroundColor = "";
            var h = document.getElementById("moveup-page").style.height;
            h = parseInt(h);
            moveup(h);
            fadeout(2);

            setTimeout(function() {
                loaddoc(1);
            }, 220);
        }

        function edit() {
            document.getElementById("view").style.backgroundColor = "";
            document.getElementById("edit").style.backgroundColor = "rgba(30,30,30,0.8)";
            var h = document.getElementById("moveup-page").style.height;
            h = parseInt(h);
            moveup(h);
            fadeout(1);
            document.getElementById("editpromopri").style.display = "block";
        }

        function updatepri() {
            var url_string = window.location.href;
            var transit_id = document.getElementById("transit_id").value;
            var prom_pri = document.getElementById("prom_pri").value;
            var url = "TransPromoEditDetails?transit_id=" + transit_id + "&prom_pri=" + prom_pri;

            var xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function() {
                if (this.readyState == 4 && this.status == 200) {
                    var val = xhttp.responseText;
                    document.getElementById("scam").remove();
                    document.getElementById("updateOutput").style.display = "block";
                    document.getElementById("updateOutput").innerHTML = val;
                }
            }
            xhttp.open("GET", url, true);
            xhttp.send();
        }

        function moveup(h) {
            if (h == 75) {
                return;
            }
            document.getElementById("moveup-page").style.height = h + "vh";
            h = h + 1;
            setTimeout("moveup(" + h + ")", 10);
            document.getElementById("heading").remove();
        }

        function fadeout(n) {
            if (document.getElementsByClassName("sign-page").length == 0 && document.getElementsByClassName("log-page").length == 0) {
                return;
            }
            if (n == 2 && document.getElementsByClassName("sign-page").length != 0) {
                var ele = document.getElementsByClassName("sign-page")[0];
                if (ele.style.opacity == 0) {
                    return;
                }
                ele.style.opacity -= 0.05;
            }
            if (n == 1 && document.getElementsByClassName("view-page").length != 0) {
                var ele = document.getElementsByClassName("view-page")[0];
                if (ele.style.opacity == 0) {
                    return;
                }
                ele.style.opacity -= 0.05;
            }
            setTimeout("fadeout(" + n + ")", 10);
        }

    </script>

</body>

</html>
