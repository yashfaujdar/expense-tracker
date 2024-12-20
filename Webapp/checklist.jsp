<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="checklist_style.css"> 
    <title>Checklist | Voyager</title>
  </head>
 
  <body>
    <div class="nav-bar">
      <div id="logo-def">
        <a id="logo-img" href="index.jsp">
          <img src="images/logo2-1.png" alt="logo" width="270px">
        </a>
      </div>
      <div id="prof">
        <div style="margin-top:5px; margin-left:auto; border-radius:25px; display:flex;">
          <span id="arrow" style="font-size:40px; height:fit-content; margin-top:-5px; width:25px;">&#8964;</span>
          <img src="images/img.jpg" width="52px" height="50px" style="border-radius:25px; margin-left:8px;">
        </div>
        <div id="drop">
          <span><a href="profile_details.jsp">Profile</a></span><br>
          <span><a href="LogOut.jsp">Log Out</a></span>
        </div>
      </div>
    </div>

    <div style="display:flex; height:101.5vh; width:100vw; padding-top:62px; margin-left:16px; margin-bottom:-16px;">
      <div id="checklist-list"></div>

      <div style="display: flex; height:90vh; width:73vw; flex-direction:column; margin-left:auto; margin-top:10px; background-color:rgba(0, 0, 0, 0.6);">
        <div id="use-directions" style="margin:auto; color:white; font-size:30px; font-family:PoiretOne-Regular;">Click on a checklist to view</div>
        <div id="get-cname" style="margin:auto; color:white; font-size:30px; font-family:PoiretOne-Regular; display:none;">
          <input id="cname" type="text" placeholder="Enter a checklist name" style="width:100%; height:60px;">
          <span id="" class="addBtn" onclick="appendchecklist()" style="width:100%; height:60px; padding-top:auto; align-items:center;">Add</span>
        </div>

        <section id="checklist-section" style="display: none; padding:5px;">
          <div id="myDIV" class="header" style="margin:auto;">
            <input type="text" id="myInput" placeholder="Enter item here" onkeypress="if(event.keyCode==13){add();}">
            <span id="" class="addBtn" onclick="add()">Add</span>
          </div>

          <div id="ul-wrap" style="margin:auto; height:80vh; width: 65vw; background-color:rgba(0, 0, 0, 0.7);">
            <ul id="myUL" style="height:72vh; overflow-y:auto;"></ul>
          </div>
        </section>
      </div>

    </div>

    <script>
      setInterval(sessionValidater, 2000);

      function sessionValidater() {
        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function() {
          if (this.readyState == 4 && this.status == 200) {
            if (this.responseText.split(",")[0]) {
              // session is valid
            } else {
              window.location.replace("login.jsp");
            }
          }
        }
        xhttp.open("GET", "GetSession", true);
        xhttp.send();
      }

      var url_string = window.location.href;
      var url = new URL(url_string);
      var paramValue = url.searchParams.get("tid");
      myfn("");

      function myfn(id) {
        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function() {
          if (this.readyState == 4 && this.status == 200) {
            load_checklists(this.responseText);
            if (id != "") {
              click_check(id);
            }
          }
        }
        xhttp.open("GET", "GetTripChecklists?tid=" + paramValue, true);
        xhttp.send();
      }

      function add() {
        newElement(document.getElementsByClassName("addBtn")[1].id);
      }

      function load_checklists(names) {
        names = names.split("\n");
        var cnt = "";

        var checks = document.getElementById("checklist-list");
        for (var i = 0; i < names.length - 1; i++) {
          var id_name = names[i].split(",")[0];
          var cl_name = names[i].split(",")[1];
          var fns = "display_checklist();this.style.background='rgba(70,70,70,0.8)';get_contents('" + paramValue + "','" + id_name + "');";
          
          const newdiv = "<div id='" + id_name + "' class='checklist' onclick=" + fns + ">" + cl_name + "</div>";
          cnt = newdiv + cnt;
        }

        checks.innerHTML = "<div class='checklist' onclick='newlist()'>+ </div>" + cnt;
      }

      function display_checklist() {
        document.getElementById("get-cname").style.display = "none";
        document.getElementById("use-directions").style.display = "none";
        document.getElementById("checklist-section").style.display = "block";
        var ele = document.getElementsByClassName("checklist");
        for (var i = 0; i < ele.length; i++) {
          ele[i].style.background = "";
        }
      }

      function get_contents(tid, cid) {
        document.getElementsByClassName("addBtn")[1].id = cid;
        var xhttp1 = new XMLHttpRequest();
        xhttp1.onreadystatechange = function() {
          if (this.readyState == 4 && this.status == 200) {
            document.getElementById("ul-wrap").innerHTML = "<ul id='myUL' style='height:72vh; overflow-y:auto;'></ul>";
            var txt;
            var items = this.responseText.split("\n");
            for (var i = 0; i < items.length - 1; i++) {
              var item_name = items[i].split(",")[0];
              var stat = items[i].split(",")[1];
              var id = items[i].split(",")[2];
              var li;
              if (stat) {
                li = "<li id='" + id + "' class='" + stat + "'>" + item_name + "</li>";
              } else {
                li = "<li id='" + id + "'>" + item_name + "</li>";
              }
              txt += li;
            }
            document.getElementById("myUL").innerHTML = txt;
            fn1(cid);
          }
        }
        xhttp1.open("GET", "GetChecklistDetails?cid=" + cid, true);
        xhttp1.send();
      }

      function newlist() {
        document.getElementById("use-directions").style.display = "none";
        document.getElementById("checklist-section").style.display = "none";
        document.getElementById("get-cname").style.display = "block";

        var ele = document.getElementsByClassName("checklist");
        for (var i = 0; i < ele.length; i++) {
          ele[i].style.background = "";
        }
        ele[0].style.background = "rgba(70,70,70,0.8)";
      }

      function appendchecklist() {
        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function() {
          if (this.readyState == 4 && this.status == 200) {
            document.getElementById("cname").value = "";
            var id = this.responseText;
            myfn(id);
          }
        }
        xhttp.open("GET", "InsertChecklist?tid=" + paramValue + "&cname=" + document.getElementById("cname").value, true);
        xhttp.send();
      }

      function click_check(id) {
        document.getElementById(id).click();
      }
    </script>
    <script src="checklist_script.js"></script>
  </body>
</html>
