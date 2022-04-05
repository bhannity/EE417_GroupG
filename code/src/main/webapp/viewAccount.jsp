<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>

<!DOCTYPE html>
<html>

<head>
  <title>MyAccount</title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="css/Borrow.css">
  <link rel="stylesheet" href="css/Admin.css">
  <link rel="stylesheet" href="css/Home.css">
  <link href="css/login.css" rel="stylesheet">
  <script src="scripts/Home.js"></script>
	
  <div id="mySidebar" class="sidebar">
    <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">×</a>
    <a href="register.html">Register</a>
    <a href="Admin.html"> Admin </a>
    <a href="Logout"> Logout </a>
</div>

<div class="navbar">
    <a href="./Home.html">Home</a>
    <div class="subnav">
        <button class="subnavbtn">Library Essentials <i class="fa fa-caret-down"></i></button>
        <div class="subnav-content">
            <a href="./Borrow.jsp">Borrow/Return a Book</a>
            <a href="./viewAccount.jsp">View Account </a>
        </div>
    </div>
    <div class="subnav">
        <button class="subnavbtn">Services<i class="fa fa-caret-down"></i></button>
        <div class="subnav-content">
            <a href="./bookingForm.html">Book a Room </a>
           

        </div>
    </div>
    <div class="subnav">
        <button class="subnavbtn"> Catalogue  <i class="fa fa-caret-down"></i></button>

        <div class="subnav-content">
            <a href="./Viewitems.jsp">View Items </a>
           
        </div>

    </div>
	<div class="subnav">
            <button class="subnavbtn" onclick="openNav()">☰</button>

        </div>
  </div>
  <style>
		table, th, td {
		  border: 1px solid black;
		  border-collapse: collapse;
		}
</style>
</head>
<body>
<%--<%String userSess = (String) session.getAttribute("username"); --%>
<sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
         url = "${sessionScope.dbUrl}"
         user = "${sessionScope.dbUser}"  password = "${sessionScope.dbPassword}"/>
      <c:set var="useSession" value="@userSess" scope="page" />
      <sql:query dataSource = "${snapshot}" var = "result">
		SELECT TITLE, DUE_DATE FROM library.books where borrowed_By="<%= session.getAttribute("username")%>"</sql:query>
<div>

<div style="text-align:center">
      	  <div style="text-align:center"><br><br>
	      	  <h3 style="font-size:50px; font-family: 'Brush Script MT', cursive;">Books on Loan</h3>
	      	  <c:choose>
		        <c:when test="${result.rowCount == 0}">
		            <h4>Currently no books on Loan</h4>
		        </c:when>
		        <c:otherwise>
		            <table class = "center" id = "customers">
				  <tr>
				    <th>#</th>
				    <th>TITLE</th>
				    <th>RETURN DUE DATE</th>
				  </tr>
				  <c:set var="count" value="1" scope="page" />
				  <c:forEach var = "row" items = "${result.rows}">
			            <tr>
			               <td><c:out value = "${count}"/></td>
			               <td><c:out value = "${row.TITLE}"/></td>
			               <td><c:out value = "${row.DUE_DATE}"/></td>
			            </tr>
			         <c:set var="count" value="${count + 1}" scope="page"/>
			         </c:forEach>
				</table>
       		   </c:otherwise>
   			 </c:choose>
				
	      	  </div>
	      	  
	      <sql:query dataSource = "${snapshot}" var = "result">
		SELECT room_no, BookDate, TIMESLOT FROM library.room where username="<%= session.getAttribute("username")%>"</sql:query>
<div>

<div style="text-align:center">
      	  <div style="text-align:center"><br><br>
	      	  <h3 style="font-size:50px; font-family: 'Brush Script MT', cursive;">Rooms Booked</h3>
	      	  <c:choose>
		        <c:when test="${result.rowCount == 0}">
		            <h4>Currently no Rooms Booked</h4>
		        </c:when>
		        <c:otherwise>
		            <table class = "center" id = "customers">
				  <tr>
				    <th>#</th>
				    <th>Room</th>
				    <th>Date Booked</th>
				    <th>Time Slot</th>
				    <th>Action</th>
				  </tr>
				  <c:set var="count" value="1" scope="page" />
				  <c:forEach var = "row" items = "${result.rows}">
			            <tr>
			               <td><c:out value = "${count}"/></td>
			               <td><c:out value = "${row.room_no}"/></td>
			               <td><c:out value = "${row.BookDate}"/></td>
			               <td><c:out value = "${row.TIMESLOT}"/></td>
			               <td><form method="POST" action="book_Room">
			               <input type="text" name="room_action" value="${row.room_no}" hidden="true">
			               <p><button class="btn2">Cancel Room</button></p>
					
								</form></td>
			            </tr>
			         <c:set var="count" value="${count + 1}" scope="page"/>
			         </c:forEach>
				</table>
       		   </c:otherwise>
   			 </c:choose>
				
	      	  </div>
	      <div>
	      
	      <div>
	      <hr>
	      <h3 style="font-size:50px; font-family: 'Brush Script MT', cursive;">Update Password</h3>
	      <form action="userDetailsMod" method="post" >
	
		  <div>
		    <input type="hidden" name="formName" value="upDatePassword" hidden="true">
		    <input type="hidden" name="sessionID" value="<%= session.getAttribute("username")%>" hidden="true">
		    <label for="pwd"><b style="font-size:20px">Current Password</b></label><br>
		    <input type="text" value="<%= session.getAttribute("password")%>" name="pwd" disabled><br>
					
			<label for="npwd"><b style="font-size:20px">New Password</b></label><br>
		    <input type="password" placeholder="Enter New Password" name="npwd" required><br>
		
		    <label for="cpsw"><b style="font-size:20px">Confirm Password</b></label><br>
		    <input type="password" placeholder="Confirm new Password" name="cpsw" required><br><br>
		        
		    <button type="submit">Submit</button>
	
	  		</div>
	  		</form>
	      </div>
	      <sql:query dataSource = "${snapshot}" var = "result">
			SELECT email from library.user where username="<%= session.getAttribute("username")%>"</sql:query>
			
		   <c:choose>
		        <c:when test="${result.rowCount == 0}">
		            No Email found
		        </c:when>
		        <c:otherwise>
		            <c:forEach var = "row" items = "${result.rows}">
						<%-- <c:out value = "${row.email}"/>--%>
						<c:set var = "userEmail" scope = "session" value = "${row.email}"/>
					</c:forEach>
		        </c:otherwise>
		    </c:choose>
	      <hr>
	      <h3 style="font-size:50px; font-family: 'Brush Script MT', cursive;">Update Email address</h3>
	      <form action="userDetailsMod" method="post">
	      <input type="hidden" name="formName" value="upDateEmail" hidden="true">
	      <input type="hidden" name="sessionID" value="<%= session.getAttribute("username")%>" hidden="true">
	
		  <div>
		    <label for="email"><b style="font-size:20px">Current Email</b></label>
		    <input type="email" value="${userEmail}" name="email" disabled><br>
					
			<label for="nemail"><b style="font-size:20px">New Email Address</b></label>
		    <input type="email" placeholder="Enter New Email" id ="nemail" name="nemail" required><br>
		
		    <label for="cemail"><b style="font-size:20px">Confirm new Email</b></label>
		    <input type="email" placeholder="Confirm New Email" id ="cemail" name="cemail" onmouseout="compare_input();"required><br><br>
		        
		    <button type="submit">Submit</button>
	
	  		</div>
	  		</form>
	      </div>
  </div>
</div>
</div>

</body>
<script>
function compare_input(){
  var f_input=document.getElementById('nemail').value;
  var s_input=document.getElementById('cemail').value;
  if(f_input!=s_input){
     alert('Emails do not match');
  }
}
</script>
</html>
