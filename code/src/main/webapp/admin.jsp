<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>

<!DOCTYPE html>
<html lang="en">
  
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="css/Admin.css">
    <link rel="stylesheet" href="css/Home.css">
    <link href="css/login.css" rel="stylesheet">
    <script src="scripts/Home.js"></script>
    <style>
		table, th, td {
		  border: 1px solid black;
		  border-collapse: collapse;
		}
</style>
    <title>Admin Page</title>
</head>
  
<body>
    <div id="mySidebar" class="sidebar">
        <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">×</a>
        <a href="register.html">Register</a>
        <a href="Admin.html">Admin</a>
	<a href="Logout">Logout</a>
    </div>
    
    <div class="navbar">
        <a href="./Home.html">Home</a>
        <div class="subnav">
            <button class="subnavbtn">Library Essentials <i class="fa fa-caret-down"></i></button>
            <div class="subnav-content">
                <a href="./Borrow.jsp">Borrow/Return a Book</a>
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
      <sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
         url = "${sessionScope.dbUrl}"
         user = "${sessionScope.dbUser}"  password = "${sessionScope.dbPassword}"/>
 
      <sql:query dataSource = "${snapshot}" var = "result">
		SELECT id, username, email, password FROM library.admin</sql:query>
      
      <div style="text-align:center">
      	  <div style="text-align:center"><br><br>
	      	  <h3 style="font-size:50px; font-family: 'Brush Script MT', cursive;">Admin Records</h3>
				<table class = "center" id = "customers">
  
				  <tr>
				    <th>Admin ID</th>
				    <th>USERNAME</th>
				    <th>EMAIL</th>
				    <th>PASSWORD</th>
				  </tr>
				  <c:forEach var = "row" items = "${result.rows}">
			            <tr>
			               <td><c:out value = "${row.id}"/></td>
			               <td><c:out value = "${row.username}"/></td>
			               <td><c:out value = "${row.email}"/></td>
			               <td><c:out value = "${row.password}"/></td>
			            </tr>
			         </c:forEach>
				</table>
	      	  </div>
	      <div>
	      <hr>
	      <h3 style="font-size:50px; font-family: 'Brush Script MT', cursive;">Add new Administrator</h3>
	      <form action="admin_Servlet" method="post">
	
		  <div>
		    <label for="uname"><h style="font-size:20px">Username</h></label><br>
		    <input type="text" placeholder="Enter Username" name="uname" required><br>
					
			<label for="email"><h style="font-size:20px">Email Address</h></label><br>
		    <input type="email" placeholder="Enter Email" name="email" required><br>
		
		    <label for="psw"><h style="font-size:20px">Password</h></label><br>
		    <input type="password" placeholder="Enter Password" name="psw" required><br>
		        
		    <button type="submit">Submit</button>
	
	  		</div>
	  		</form>
	      </div>
	   </div>
	   <sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
         url = "${sessionScope.dbUrl}"
         user = "${sessionScope.dbUser}"  password = "${sessionScope.dbPassword}"/>
 
      <sql:query dataSource = "${snapshot}" var = "result">
		SELECT user_id, username, fname, email,password FROM library.user</sql:query>
		<hr>
	   <div style="text-align:center">
      	  <div style="text-align:center"><br><br>
	      	  <h3 style="font-size:50px; font-family: 'Brush Script MT', cursive;">Users Records</h3>
				<table class = "center" id = "customers">
				  <tr>
				    <th>User ID</th>
				    <th>USERNAME</th>
				    <th>FULLNAME</th>
				    <th>EMAIL</th>
				    <th>PASSWORD</th>
				  </tr>
				  <c:forEach var = "row" items = "${result.rows}">
			            <tr>
			               <td><c:out value = "${row.user_id}"/></td>
			               <td><c:out value = "${row.username}"/></td>
			               <td><c:out value = "${row.fname}"/></td>
			               <td><c:out value = "${row.email}"/></td>
			               <td><c:out value = "${row.password}"/></td>
			            </tr>
			         </c:forEach>
				</table>
		  <br><br><br><br><br>
	      	</div>
	   </div>
</body>
  
</html>
