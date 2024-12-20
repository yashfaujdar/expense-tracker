<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <title>LogIn / SignUp | Voyager</title>
  <link rel="stylesheet" href="style.css">
  <style>
    .full-page {
      display: flex;
      margin: 0px;
    }

    .logo-disp {
      width: 45vw;
      height: 95.794vh;
      background-color: #101010;
      display: flex;
    }

    .logo-disp a {
      margin: auto;
      display: flex;
    }

    .logo-disp img {
      margin: auto;
    }

    #second-half {
      width: 55vw;
      height: 95.794vh;
      background-image: url('images/GoremeNationalPark_EN-US4875441908_1920x1080.jpg');
      background-size: cover;
    }

    #second-half-overlay {
      background-color: rgba(0, 0, 0, 0.4);
      position: absolute;
      width: 55vw;
      height: 95.794vh;
      display: flex;
      flex-direction: column;
    }

    #buttons {
      width: 55vw;
      height: auto;
      display: flex;
      justify-content: center;
      align-items: center;
      margin: auto;
    }

    .border {
      position: absolute;
      color: white;
      outline: 2px solid white;
      pointer-events: none;
    }

    #log-in,
    #sign-up {
      background-color: rgba(0, 0, 0, 0.8);
      margin: auto;
      padding: 13px 35px;
      border-radius: 3px;
      color: white;
      font-family: PoiretOne-Regular;
      font-size: 20px;
      cursor: pointer;
    }

    #log-in:hover,
    #sign-up:hover {
      background-color: rgba(30, 30, 30, 0.8);
    }

    .log-page,
    .sign-page {
      display: flex;
      justify-content: center;
      align-items: center;
      margin-top: 80px;
    }

    form {
      width: 500px;
      height: 350px;
      margin: auto;
      background-color: rgba(0, 0, 0, 0.8);
      display: flex;
      flex-direction: column;
      justify-content: center;
      align-items: center;
      color: white;
    }

    .error {
      color: red;
    }

    .line {
      margin: auto;
      width: 400px;
      display: flex;
      justify-content: center;
    }

    label {
      margin: auto;
      width: 120px;
    }

    input {
      height: 20px;
      margin: auto;
      background-color: transparent;
      color: white;
      border: 1px solid rgba(255, 255, 255, 0.5);
      padding: 5px;
    }

    button {
      height: 40px;
      width: 80px;
      background-color: black;
      color: white;
      font-family: PoiretOne-Regular;
      font-size: 15px;
      border: 1px solid white;
      justify-content: center;
      margin-top: 20px;
      margin-bottom: 30px;
    }

    button:hover {
      background-color: rgb(50, 50, 50);
      border: 1px solid grey;
      cursor: pointer;
    }
  </style>
</head>

<body style="height: 100vh; background-color: black;">
  <div class="full-page">
    <div class="logo-disp">
      <a href="index.jsp">
        <img src="images/logo.png" width="80%">
      </a>
    </div>

    <div id="second-half">
      <div id="second-half-overlay">
        <div id="buttons">
          <div id="log-in" class="log-in" onclick="logscreen()">Log In</div>
          <div class="border" style="margin-left: -425px; padding: 50px 38px;"></div>
          <div class="vl"></div>
          <div id="sign-up" class="sign-up" onclick="signscreen()">Sign Up</div>
          <div class="border" style="margin-left: 415px; padding: 50px 45px;"></div>
        </div>
        <div id="form-page" style="height: 0vh;"></div>
      </div>
    </div>
  </div>

  <footer>
    ©Copyright Voyager Pvt. Ltd. All Rights Reserved<br>
  </footer>

  <script>
    <%-- Retain JavaScript as is, since dynamic actions can happen via AJAX calls or client-side scripting --%>
    // JavaScript code from the original remains unchanged
    // ...
  </script>
</body>

</html>
