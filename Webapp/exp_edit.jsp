<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Add Expense | Voyager</title>
        <meta charset="utf-8">
        <style>
            .submit_btn:hover{
                background-color: black;
                opacity: 50%;
                color: white;
            }

            form{
                margin: auto;
                margin-top: 30px; 
                width:450px;
                height:500px; 
                display:flex;
                flex-direction:column; 
                justify-content:center; 
                align-items:center;
                text-align: center; 
                color: white; 
                text-shadow: black 2px 2px 2px;
                font-size: 20px;
                opacity: 70%;
                background-color: black; 
                box-shadow: 3px 3px 5px 2px rgb(255, 255, 255), 0 0 20px black;
            }
            .options{
                display: flex;
            }

            .options input{
                margin: auto;
            }

        </style> 
    </head>
    <body style="background-image:url('images/painting-1682416389136-9172.jpg'); background-repeat:no-repeat; background-size:cover; opacity:1;">
        <div class="view-page">
            <form method="get" action="InsertExp">
                <input style="display:none" id="trip_id" name="trip_id" value="${param.tid}">
                <br>
                <label for="budget_name" style="font-size: 28px; text-shadow: 2px 2px 2px orangered;">Budget Category: </label>
                <br>
                <input style="width: 200px; height: 30px;" type="text" name="budget_name" id="budget_name" required placeholder="Enter Budget Category">
                <br>
                <label for="exp_dets" style="font-size: 28px; text-shadow: 2px 2px 2px orangered;">Expense Details: </label>
                <br>
                <input style="width: 200px; height: 30px;" type="text" name="exp_dets" id="exp_dets" required placeholder="Enter Expense Details">
                <br>    
                <label for="amt_spent" style="font-size: 28px; text-shadow: 2px 2px 2px orangered;">Expense Amount: </label>
                <br>
                <input style="width: 200px; height: 30px;" type="text" name="amt_spent" id="amt_spent" required placeholder="Enter Expense Amount">
                
                <input id="submit_btn" type="submit" value="Add Budget" style="width: 150px;height:40px;margin:auto;margin-top:20px;font-size:20px;background-color:white;opacity:70%;border-radius:5px;box-shadow:0px 0px 2px 2px white;text-shadow:2px 2px 2px white;">
            </form> 
        </div> 

        <script>
            window.onload = load;
            var tid; 
            function load(){
                setTimeout(function(){ fadein(); }, 500);
                
                var url_string = window.location.href;
                var url = new URL(url_string);
                tid = url.searchParams.get("tid"); 
                document.getElementById("trip_id").value = tid;
                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function() {
                    if (this.readyState == 4 && this.status == 200) {
                        // Handle the response if needed
                    }
                };
            }
        </script>
    </body>      
</html>
