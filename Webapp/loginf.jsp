<div class="log-page" style="opacity:1;"> 
    <form method="POST" action="LogIn">
        <p class="error">
            <%-- Error message can be dynamically displayed from the server using JSP scripting --%>
            <%= request.getAttribute("errorMessage") != null ? request.getAttribute("errorMessage") : "" %>
        </p>
        <div class="line">
            <label for="uname">User Name</label>
            <input type="text" id="uname" name="uname" 
                   onkeypress="if(event.keyCode==13){document.getElementById('pwd').focus();}">
        </div> 
        <div class="line">
            <label for="pwd">Password</label>
            <input type="password" id="pwd" name="pwd" 
                   onkeypress="if(event.keyCode==13){document.getElementsByTagName('button')[0].click();}">
        </div> 
        <div class="line">
            <button type="submit">Login</button>
        </div>
    </form>
</div>
