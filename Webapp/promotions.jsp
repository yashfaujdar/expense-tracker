<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Admin - Promotions | Voyager</title>
    <link rel="stylesheet" href="./assets/css/reset.css">
    <link href="https://fonts.googleapis.com/css?family=Muli:300,400,700,900" rel="stylesheet">
    <link rel="stylesheet" href="./assets/css/style.css">
    <link rel="stylesheet" href="promotions_style.css">
</head>

<body>
    <div id="scam" style="opacity:0;">
        <div id="row1">
            <div id="transpromo" style="margin-right:auto;">
                Access Transit
            </div>
            <div id="accpromo" style="margin-left:auto;">
                Access Accommodations
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
            <div id="arr-div" style="margin-top:5px; margin-left:auto; border-radius:25px;display:flex;cursor:pointer;">
                <span id="arrow" style="font-size:40px; height:fit-content; margin-top:-5px; width:25px;">&#8964;</span>
                <img src="images/img.jpg" width="52px" style="border-radius:25px; margin-left:8px;">
            </div>
            <div id="drop">
                <span class="drop-list"><a href="LogOut" style="cursor:pointer;">LogOut</a></span>
            </div>
        </div>
    </div>

    <div id="heading">
        <h1 style="margin-left: 90px; margin-top: 50px;">
            <span>Promotions</span>
        </h1>
    </div>

    <script src="./assets/js/main.js"></script>
    <script>
        window.onload = load;

        function load() {
            setTimeout(function () { fadein(); }, 500);

            document.getElementById("transpromo").addEventListener("click", function () {
                window.location.href = 'transit_promo.jsp';
            });
            document.getElementById("accpromo").addEventListener("click", function () {
                window.location.href = 'acc_promo.jsp';
            });
        }

        function fadein() {
            var ele = document.getElementById("scam");
            ele.style.display = "flex";
            ele.style.opacity = parseFloat(ele.style.opacity) + 0.05;
            if (ele.style.opacity < 1) {
                setTimeout(function () { fadein(); }, 50);
            }
        }
    </script>

</body>

</html>
