<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Add Budget | Voyager</title>
        <meta charset="utf-8">
        <style>
            .submit_btn:hover {
                background-color: black;
                opacity: 50%;
                color: white;
            }

            form {
                margin: auto;
                margin-top: 30px;
                width: 450px;
                height: 500px;
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

            .options {
                display: flex;
            }

            .options input {
                margin: auto;
            }
        </style>
    </head>
    <body style="background-image:url('images/painting-1682416389136-9172.jpg'); background-repeat:no-repeat; background-size:cover; opacity:1;">
        <div class="view-page">
            <form method="get" action="InsertBudg.jsp">
                <!-- Hidden input to hold the trip_id value from the URL -->
                <input style="display:none" id="trip_id" name="trip_id" value="<%= request.getParameter("tid") != null ? request.getParameter("tid") : "" %>">
                
                <br>
                <!-- Budget Group Name -->
                <label for="group_name" style="font-size: 28px; text-shadow: 2px 2px 2px orangered;">Budget Group Name: </label>
                <br>
                <input style="width: 200px; height: 30px;" type="text" name="group_name" id="group_name" required placeholder="Enter Category Name">
                <br>

                <!-- Budget Amount -->
                <label for="amt" style="font-size: 28px; text-shadow: 2px 2px 2px orangered;">Budget Amount: </label>
                <br>
                <input style="width: 200px; height: 30px;" type="text" name="amt" id="amt" required placeholder="Enter New Budget Amount">
                
                <!-- Submit Button -->
                <input id="submit_btn" type="submit" value="Add Budget" style="width: 150px;height:30px;margin:auto;margin-top:20px;font-size:20px;background-color:white;opacity:70%;border-radius:5px;box-shadow:0px 0px 2px 2px white;text-shadow:2px 2px 2px white;">
            </form>
        </div>

        <script>
            window.onload = load;

            var tid;

            function load() {
                setTimeout(function() { fadein(); }, 500);

                // Retrieve URL parameters
                var url_string = window.location.href;
                var url = new URL(url_string);
                tid = url.searchParams.get("tid");  // Get 'tid' from URL
                document.getElementById("trip_id").value = tid;  // Set 'trip_id' input value to 'tid'
            }
        </script>
    </body>
</html>
