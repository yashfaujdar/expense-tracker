<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Trip Summary details | Voyager</title>
        <style>
            html {
                height: 100%;
                overflow-x: hidden;
                margin: 0;
                font-family: PoiretOne-Regular;
                scroll-behavior: smooth; 
            }
            
            body{
                height: 100%;
                overflow-x: hidden;
                margin: 0;
                display: flex; 
                flex-direction:column; 
                background-image:url('images/painting-1682416389136-9172.jpg'); 
                background-size:100vw 100vh; 
                position:absolute; 
            }
            .nav-bar {
                color:white;
                display:flex; 
                flex-direction:row; 
                justify-content:flex-start;
                align-content: center; 
                background-color:rgba(0,0,0,0.8); 
                position: fixed; 
                width: 100vw;
                height: 60px;
                z-index: 4;
            }
            
            .dropdown{
                height: 60px; 
                width:100px;
                text-align: center;
                padding-left: 50px;
                margin-left:auto;
                align-items: center;
            }
            
            .dropdown a{
                color: rgb(200,200,200);
                text-decoration:none;
                text-align: center;
            }
            
            .dropdown p{
                margin-top: 5px;
                display: none;
            }
            
            .dropdown:hover>p{
                display: block;
                background-color: rgba(0,0,0,0.8);
            }
            
            .dropdown p span{
                padding: 5px;
                display: block;
                cursor: pointer;
            }
            
            .dropdown p span:hover{
                background-color: rgba(50, 50, 50, 0.8);
            }
            
            .nav-bar #logo{
                width: 70px;
                height: 30px;
            }

        
            #page{
                margin:auto auto; 
                height:91%; 
                width:105%; 
                background-color:rgba(0,0,0,0.5); 
                color:white; 
                display:flex; 
                margin-top:60px;
            }

            #nav{
                height:100%; 
                width:25%;
                background-color:black; 
                display:flex; 
                flex-direction:column;
                padding-left:40px;
            }

            #slide{ 
                height:100%; 
                width:65%;
                background-color:rgba(0,0,0,0.3); 
                color:white; 
                display:flex;
                overflow-y: auto;
            }

            table{
                margin:auto;
                text-align: center;
                font-size:20px;

            }

            tr{
                outline: 0.2px solid rgba(255,255,255,0.2);
                background-color: black;
            }

            th{
                padding:5px;
                background-color: rgba(30,30,30,1);
            }

            td{
                padding:5px;
            }


            button{
                width:fit-content;
                padding:20px;
                background-color: black;
                border: 1px solid white;
                cursor: pointer;
                color:white;
                margin-bottom:10px;
            }
            button:hover{
                background-color: grey;
            }

            .del{
                background-color: rgb(167, 0, 0);
                cursor: pointer;
            }

            .del:hover{
                background-color: rgb(232, 1, 1);
            }
        </style>
    </head>
    <body style="width:100vw; height:100vh; display:flex; flex-direction:column;">
        <div class="nav-bar">
            <p style="margin:5px;">
                <a id="logo" href="index.jsp">
                    <img src="images/logo2-1.png" alt="logo" width="250px;">
                </a>
                <div class="dropdown">
                    <div id="prof" style="display: flex;cursor: pointer;" onmouseover="noarrow()" onmouseout="arrow()">
                        <span id="arrow" style="font-size:40px; height:fit-content; margin-top:-5px; width:25px;">&#8964;</span>
                        <img src="images/img.jpg" height="50px" style="margin-top:5px; margin-left:8px; border-radius:25px;">
                    </div>
                    <p id="drop">
                        <span><a href="profile_details.jsp">Profile</a></span><br>
                        <span><a href="LogOut.jsp" style="cursor: pointer;">Log Out</a></span>
                    </p>
                </div>
            </p>
        </div>
        <div id="page">
            <div id="nav">
                <h2 style="text-align:center;">Trip Summary</h2>
                <h3>Onward transit:</h3>
                <div id="onw_trans" style="margin-left: 40px; margin-right:20px;"></div>
                <h3>Return transit:</h3>
                <div id="ret_trans" style="margin-left: 40px;margin-right:20px;"></div>
                <h3>Accommodation details:</h3>
                <div id="accom" style="margin-left: 40px; margin-right:20px;"></div>
            </div>
            
            <div id="slide">
            </div>
            
        </div>
    </body>
    <script>
        setInterval(sessionValidater,2000);
        function sessionValidater(){
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

        var url_string = window.location.href;
        var url = new URL(url_string);
        var paramValue = url.searchParams.get("trip_id");
        fn1();
        fn2();

        function fn1(){
            var xhttp1 = new XMLHttpRequest();
            xhttp1.onreadystatechange = function() {
                if (this.readyState == 4 && this.status == 200) {
                    document.getElementById("slide").innerHTML=this.responseText;
                }
            }
            xhttp1.open("GET", "ItinViewDB?trip_id=" + paramValue, true);
            xhttp1.send();
        }

        function fn2(){    
            var xhttp1 = new XMLHttpRequest();
            xhttp1.onreadystatechange = function() {
                if (this.readyState == 4 && this.status == 200) {
                    document.getElementById("onw_trans").innerHTML=this.responseText.split("\n")[0];
                    document.getElementById("ret_trans").innerHTML=this.responseText.split("\n")[1];
                    document.getElementById("accom").innerHTML=this.responseText.split("\n")[2];
                }
            }
            xhttp1.open("GET", "GetItineraryDetails?tid=" + paramValue, true);
            xhttp1.send();
        }

        function del(txt){
            var xhttp1 = new XMLHttpRequest();
            xhttp1.onreadystatechange = function() {
                if (this.readyState == 4 && this.status == 200) {
                    fn1();
                    fn2();
                }
            }
            xhttp1.open("GET", "DelItin?tid=" + paramValue + "&it_id=" + txt, true);
            xhttp1.send();
        }
    </script>
</html>
