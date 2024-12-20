<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Signup | Voyager</title>
    <link rel="stylesheet" href="./assets/css/style.css">
    <style>
        .sign-page {
            opacity: 1;
            max-width: 500px;
            margin: 50px auto;
            background-color: #333;
            padding: 20px;
            border-radius: 10px;
            color: white;
        }

        .line {
            margin: 10px 0;
        }

        label {
            display: block;
            margin: 5px 0;
        }

        input, select {
            width: 100%;
            padding: 10px;
            background-color: transparent;
            color: white;
            border: 1px solid grey;
            border-radius: 5px;
        }

        button {
            width: 100%;
            padding: 10px;
            background-color: black;
            color: white;
            border: none;
            cursor: pointer;
            border-radius: 5px;
            font-size: 16px;
        }

        button:hover {
            background-color: orangered;
        }
    </style>
</head>

<body>
    <div class="sign-page">
        <form action="SignupServlet" method="post">
            <p class="error"></p> 
            <div class="line">
                <label for="type">Your Role</label>
                <select name="type" id="type">
                    <option value="Traveler" style="background-color:black;">Traveler</option>
                    <option value="Guide" style="background:black;">Guide</option>
                </select>
            </div>
            <div class="line">
                <label for="uname">User Name</label>
                <input type="text" id="uname" name="uname" onkeypress="if(event.keyCode==13){document.getElementById('pwd').focus();}">
            </div>
            <div class="line">
                <label for="pwd">Password</label>
                <input type="password" id="pwd" name="pwd" onkeypress="if(event.keyCode==13){document.getElementById('cnfrm-password').focus();}">
            </div>
            <div class="line">
                <label for="cnfrm-password">Confirm Password</label>
                <input type="password" id="cnfrm-password" name="cnfrm-password" onkeypress="if(event.keyCode==13){document.getElementsByTagName('button')[0].click();}">
            </div>
            <div class="line">
                <button type="submit">Signup</button>
            </div>
        </form>
    </div>

    <script>
        function val_signup() {
            var uname = document.getElementById('uname').value;
            var pwd = document.getElementById('pwd').value;
            var cnfrmPwd = document.getElementById('cnfrm-password').value;

            // Perform client-side validation
            if (uname === "" || pwd === "" || cnfrmPwd === "") {
                document.querySelector('.error').innerText = "All fields are required.";
                return false;
            }

            if (pwd !== cnfrmPwd) {
                document.querySelector('.error').innerText = "Passwords do not match.";
                return false;
            }

            return true;
        }
    </script>
</body>

</html>
