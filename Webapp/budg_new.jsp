<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>Budget | Voyager</title>
    <link rel="stylesheet" href="trav_hmpg-style.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Aladin&display=swap" rel="stylesheet">
    <style>
        #page {
            margin-top: 60px;
            height: fit-content;
            display: flex;
            flex-direction: column;
            color: white;
        }

        .budget {
            background-color: black;
        }

        .btn {
            width: fit-content;
            display: flex;
            justify-content: center;
            background-color: black;
            padding: 10px;
            cursor: pointer;
            border: 1px solid white;
            margin: auto;
        }

        .btn:hover {
            background-color: grey;
        }

        td {
            text-align: center;
        }

    </style>
</head>

<body>
    <div class="nav-bar">
        <p style="margin:5px;">
            <a id="logo" href="start_page.jsp">
                <img src="images/logo2-1.png" alt="logo" width="250px;">
            </a>
            <div class="dropdown">
                <div id="prof" style="display: flex; cursor:pointer;" onmouseover="noarrow()" onmouseout="arrow()">
                    <span id="arrow" style="font-size:40px; height:fit-content; margin-top:px; width:25px;">&#8964;</span>
                    <img src="images/img.jpg" height="50px" style="margin-top:5px; margin-left:8px; border-radius:25px;">
                </div>
                <p id="drop">
                    <span><a href="profile_details.jsp" style="cursor:pointer;">Profile</a></span><br>
                    <span><a href="logout.jsp" style="cursor:pointer;">Log Out</a></span>
                </p>
            </div>
        </p>
    </div>

    <div id="page">
        <div id="content" style="display:flex; flex-direction:column;margin:auto;">
            <div>
                <h1 style="text-align:left;">Add Budget</h1>
                <form method="post" action="InsertBudg">
                    <table style="margin:auto;">
                        <tr>
                            <td><input name="bname" id="bname" placeholder="Budget name" required></td>
                            <td><input name="bamt" id="bamt" placeholder="Budget amt" required></td>
                        </tr>
                    </table>
                    <div class="btn" id="add-budg-btn" onclick="add_budg()">Add new budget</div>
                </form>
            </div>
        </div>
    </div>

    <footer>
        ©Copyright Voyager pvt. ltd. All Rights Reserved<br>
    </footer>

    <script>
        document.getElementById("drop").addEventListener("mouseover", function(){noarrow();});
        document.getElementById("drop").addEventListener("mouseout", function(){arrow();});

        var url_string = window.location.href;
        var url = new URL(url_string);
        var paramValue = url.searchParams.get("tid");

        get_all();
        setInterval(sessionValidater, 2000);

        function sessionValidater() {
            var xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function() {
                if (this.readyState == 4 && this.status == 200) {
                    if (this.responseText.split(",")[0]) {
                    } else {
                        window.location.replace("login.jsp");
                    }
                }
            };
            xhttp.open("GET", "GetSession", true);
            xhttp.send();
        }

        function get_all() {
            var xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function() {
                if (this.readyState == 4 && this.status == 200) {
                    var ender = "<div><h1 style='text-align:left;'>Add Budget</h1><table style='margin:auto;'><tr><td><input name='bname' id='bname' placeholder='Budget name'></td><td><input name='bamt' id='bamt' placeholder='Budget amt'></td></tr></table><div class='btn' id='add-budg-btn' onclick='add_budg()'>Add new budget</div></div>"
                    document.getElementById("content").innerHTML = this.responseText + ender;
                    display_stat();
                }
            };
            xhttp.open("GET", "BudgExpDetails?tid=" + paramValue, true);
            xhttp.send();
        }

        function display_stat() {
            var ele1 = document.getElementsByTagName("h3");
            var ele2 = document.getElementsByClassName("tot");
            for (var i = 0; i < ele1.length; i++) {
                if (parseFloat(ele1[i].innerHTML.split("\t")[1]) <= parseFloat(ele2[i].innerHTML.split("=")[1])) {
                    ele2[i].style.border = "1px solid red";
                }
            }
        }

        function add_budg() {
            if (document.getElementById("bname").value == "" || document.getElementById("bamt").value == "") {
                window.alert("Enter correct values!");
                return;
            } else {
                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function() {
                    if (this.readyState == 4 && this.status == 200) {
                        this.responseText;
                        get_all();
                    }
                };
                xhttp.open("GET", "InsertBudg?trip_id=" + paramValue + "&group_name=" + document.getElementById("bname").value + "&amt=" + document.getElementById("bamt").value, true);
                xhttp.send();
            }
        }

        function add_exp(bid) {
            if (document.getElementsByClassName("ename")[parseInt(bid) - 1].value == "" || document.getElementsByClassName("eamt")[parseInt(bid) - 1].value == "") {
                window.alert("Enter correct values!");
                return;
            } else {
                var url1 = "InsertExp?trip_id=" + paramValue + "&budget_id=" + bid + "&exp_dets=" + document.getElementsByClassName("ename")[parseInt(bid) - 1].value + "&amt_spent=" + document.getElementsByClassName("eamt")[parseInt(bid) - 1].value;
                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function() {
                    if (this.readyState == 4 && this.status == 200) {
                        this.responseText;
                        get_all();
                    }
                };
                xhttp.open("GET", url1, true);
                xhttp.send();
            }
        }

        function noarrow() {
            document.getElementById("arrow").innerHTML = "";
        }

        function arrow() {
            document.getElementById("arrow").innerHTML = "&#8964;";
        }

        function logout() {
            window.location.replace("LogOut");
        }

    </script>
</body>

</html>
