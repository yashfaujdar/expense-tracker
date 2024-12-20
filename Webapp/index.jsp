<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="index-style.css">
    <link rel="stylesheet" href="slideshow.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Sofia">
    <title>Voyager</title>
</head>
<body>

<div class="nav-bar">
    <p style="margin:5px;">
        <a id="logo" href="index.jsp">
            <img src="images/logo2-1.png" alt="logo" width="250px">
        </a>
        <div class="tab">
            <a class="head" href="index.jsp#about">About Us</a>
        </div>
        <div class="tab">
            <a class="head" href="index.jsp#review">Reviews</a>
        </div>
        <div class="tab">
            <a class="head" href="index.jsp#contact">Contact Us</a>
        </div>
        <div class="tab">
            <a class="head" href="login.jsp" target="_blank">Sign In / Sign Up</a>
        </div>
    </p>
</div>

<div class="bgimg-1">
    <div class="caption" style="display:flex; flex-direction:column; width:70vw; margin-left:15vw; margin-top:-10vh;">
        <span class="border" style="font-size:60px;">PLAN YOUR TRIPS</span>
        <span class="border" style="font-size:large;">IN A FEW CLICKS!</span>
    </div>
</div>

<div style="color: #777; background-color:white; text-align:center; padding:50px 80px; text-align: justify;" id="about">
    <h3 style="text-align:center;">About</h3>
    <p>Where do you want to go? That's the first question we ask our clients when they contact us, and we are always curious about the answer. No matter what travel destination you choose, our team will get you there. Offering the best rates in the market, we will take care of accommodation, transportation, travel insurance, and all the extras, so you can focus on having fun. Have you started your packing list yet?</p>
</div>

<div class="bgimg-2">
    <div style="width: 98.9vw; height: 100vh; background-color:rgba(0,0,0,0.55);">
        <div class="caption">
            <span class="border" style="background-color:transparent; font-size:20px; letter-spacing:2px"><b>TAKE YOUR NEXT TRIP WITH VOYAGER</b></span><br>
            <span class="border" style="background-color:transparent; font-size:55px; letter-spacing:-2px"><b>your dream vacation awaits!</b></span>
        </div>
    </div>
</div>

<div style="position:relative; font-size:17px; background-color:#282E34; padding:20px; padding-bottom:0px; display:flex;" id="review">
    <div style="margin-left:30px; width:40px; font-size:45px; writing-mode: vertical-rl; text-orientation: upright; letter-spacing:-7px; font-family:PoiretOne-Regular;">
        REVIEWS
    </div>
    <div style="margin-left:60px;">
        <div class="slideshow-container">
            <div class="mySlides fade">
                <div class="numbertext">1 / 3</div>
                <div style="display:flex;">
                    <img src="images/82110e97218accc0de55d980631fcce7.jpg">
                    <div class="mySlidesdiv">Wonderfully managed, very useful to plan family trips!</div>
                </div>
            </div>

            <div class="mySlides fade">
                <div class="numbertext">2 / 3</div>
                <div style="display:flex;">
                    <img src="images/city-1682309641450-6752.jpg">
                    <div class="mySlidesdiv">Impressed with the use and convenience of the website.</div>
                </div>
            </div>

            <div class="mySlides fade">
                <div class="numbertext">3 / 3</div>
                <div style="display:flex;">
                    <img src="images/GoremeNationalPark_EN-US4875441908_1920x1080.jpg">
                    <div class="mySlidesdiv">Great interface!</div>
                </div>
            </div>
        </div>

        <div style="text-align:center; margin-top:40px; padding:20px;">
            <span class="dot"></span> 
            <span class="dot"></span> 
            <span class="dot"></span> 
        </div>
    </div>
    <div style="margin-left:250px;">
        <div class="slideshow-container">
            <div class="mySlides fade">
                <div class="numbertext">1 / 3</div>
                <div style="display:flex;">
                    <img src="images/GoremeNationalPark_EN-US4875441908_1920x1080.jpg">
                    <div class="mySlidesdiv">Intuitive and easy to use</div>
                </div>
            </div>

            <div class="mySlides fade">
                <div class="numbertext">2 / 3</div>
                <div style="display:flex;">
                    <img src="images/82110e97218accc0de55d980631fcce7.jpg">
                    <div class="mySlidesdiv">Great collection of available transits and accommodation</div>
                </div>
            </div>

            <div class="mySlides fade">
                <div class="numbertext">3 / 3</div>
                <div style="display:flex;">
                    <img src="images/city-1682309641450-6752.jpg">
                    <div class="mySlidesdiv">Satisfied with the whole experience</div>
                </div>
            </div>
        </div>

        <div style="text-align:center; margin-top:40px; padding:20px;">
            <span class="dot"></span> 
            <span class="dot"></span> 
            <span class="dot"></span> 
        </div>
    </div>
</div>

<div class="bgimg-3" style="display:flex;">
    <div><img src="images/image (1).png" width="1500px" height="400px" style="opacity: 60%;"></div>
    <div class="caption" style="margin-left:auto;">
        <a class="border" style="padding:10px;background-color:rgba(0,0,0, 0.8); border-width:10px; border-color:white; border-radius:10px; font-size:25px; color:#f7f7f7; text-decoration:none;" href="/login.jsp">GET STARTED!</a>
    </div>  
</div>

<div style="position:relative;">
    <div style="color:#ddd;background-color:#282E34; height:25px;"></div>
</div>

<div class="bgimg-4" id="contact">
    <div style="background-color:rgba(0,0,0,0.65); height:500px; margin:0px; color:#ffffff; font-family:PoiretOne-Regular;">
        <div style="display:flex; justify-content:center; align-items:center;width:95vw; height:500px;">
            <div style="margin:auto;">
                <h1 style="margin:auto;">Contact Us</h1>
                VOYAGER<br><br>
                SSNCE, Rajiv Gandhi Salai OMR<br>
                Kalavkkam, Chennai - 603110<br>
                Tel 987-6543-210<br><br>
                Email sss@mysite.com<br>
            </div>
            <div class="contact-links" style="margin:auto;">
                <h2 style="margin:auto;">Stay Connected</h2><br>
                <img src="images/fb-logo.png" width="30px">Facebook<br>
                <img src="images/ig-logo.png" width="30px">Instagram<br>
                <img src="images/yt-logo.png" width="30px">Youtube<br>
            </div>
        </div>
    </div>
</div>

<footer>
    ©Copyright Voyager pvt. ltd. All Rights Reserved<br>
</footer>

<script>
    let slideIndex = 0;
    showSlides();

    function showSlides() {
        let i;
        let slides = document.getElementsByClassName("mySlides");
        let dots = document.getElementsByClassName("dot");
        for (i = 0; i < slides.length; i++) {
            slides[i].style.display = "none";  
        }
        slideIndex++;
        if (slideIndex > slides.length/2) { slideIndex = 1 }    
        for (i = 0; i < dots.length; i++) {
            dots[i].className = dots[i].className.replace(" active", "");
        }
        slides[slides.length/2 + slideIndex - 1].style.display = "block";  
        slides[slideIndex - 1].style.display = "block";  
        dots[slides.length/2 + slideIndex - 1].className += " active";
        dots[slideIndex - 1].className += " active";
        setTimeout(showSlides, 2000); // Change image every 2 seconds
    }
</script>

</body>
</html>
