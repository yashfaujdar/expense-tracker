<!DOCTYPE html>
<html>
    <head>
        <title>Your details | Voyager</title>
        <style>
            /* Styles remain unchanged */
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
            /* Remaining styles omitted for brevity */
        </style>
    </head>
    <body style="width:100vw; height:100vh; display:flex; flex-direction:column;">
        <div class="nav-bar">
            <p style="margin:5px;">
                <a id="logo" href="start_page.jsp">
                    <img src="images/logo2-1.png" alt="logo" width="250px;">
                </a>
                <div class="dropdown">
                    <div id="prof" style="display: flex; cursor:pointer;">
                        <span id="arrow" style="font-size:40px; height:fit-content; margin-top:-5px; width:25px;">&#8964;</span>
                        <img src="images/img.jpg" height="50px" style="margin-top:5px; margin-left:8px; border-radius:25px;">
                    </div>
                    <p id="drop">
                        <span><a href="homepage.jsp" style="cursor:pointer;">HomePage</a></span><br>
                        <span><a href="logout.jsp" style="cursor:pointer;">LogOut</a></span>
                    </p>
                </div>
            </p>
        </div>
        <div id="page">
            <div id="nav">
                <div id="role-tab" style="padding:20%; font-size:30px; text-align:center;">
                    Hi <%= session.getAttribute("role") != null ? session.getAttribute("role") : "Traveler" %>!
                </div>
                <div id="deet-tab" class="tab" onclick="deet()">Details</div>
                <div id="pass-tab" class="tab" onclick="pass()">Change Password</div>
            </div>
            <div id="deet">
                <form>
                    <input id="role" type="hidden" value="<%= session.getAttribute("role") %>">
                    <input id="uid" type="hidden" value="<%= session.getAttribute("uid") %>">
                    <div>
                        Your Name<br><input type="text" id="name" value="<%= request.getAttribute("name") %>">
                    </div><br>
                    <div class="trav">
                        Age<br><input type="text" id="age" value="<%= request.getAttribute("age") %>">
                    </div><br>
                    <div class="trav">
                        Address<br><input type="text" id="address" value="<%= request.getAttribute("address") %>">
                    </div><br>
                    <div class="trav">
                        Sex<br>
                        <select name="type" id="sex">
                            <option value="Female" <%= "Female".equals(request.getAttribute("sex")) ? "selected" : "" %>>Female</option>
                            <option value="Male" <%= "Male".equals(request.getAttribute("sex")) ? "selected" : "" %>>Male</option>
                            <option value="Others" <%= "Others".equals(request.getAttribute("sex")) ? "selected" : "" %>>Others</option>
                        </select>
                    </div><br>
                    <div>
                        <p id="phnoerror" style="color:red;display: none;"></p>
                        Phone no<br><input type="tel" id="phno" value="<%= request.getAttribute("phone") %>" onchange="checkphemail()">
                    </div><br>
                    <div>
                        <p id="emailerror" style="color:red;display: none;"></p>
                        Email ID<br><input type="email" id="email" value="<%= request.getAttribute("email") %>" onchange="checkphemail()">
                    </div><br>
                    <div class="guide">
                        Proof<br><input type="text" id="proof" value="<%= request.getAttribute("proof") %>">
                    </div><br>
                    <button type="button" onclick="update_deets()">Update</button>
                </form>
            </div>

            <div id="pass">
                <form>
                    <input id="uid" type="hidden" value="<%= session.getAttribute("uid") %>">
                    <p id="error" style="color:red;"></p>
                    Password<input type="password" id="pwd1"><br>
                    Confirm password <input type="password" id="pwd2"><br>
                    <button type="button" onclick="update_pass()">Update</button>
                </form>
            </div>
        </div>
        <script>
            // JavaScript remains largely the same, handling dynamic actions on the client side
        </script>
    </body>
</html>
