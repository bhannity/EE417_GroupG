<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<!DOCTYPE html>
<html>

<head>
  <title>Library</title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="css/viewitems.css">
  <script src="scripts/viewitems.js"></script>
  
  


  <div id="mySidebar" class="sidebar">
    <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">×</a>
    <a href="register.html">Register</a>
    <a href="login.html ">Login</a>
    <a href="Admin.html"> Admin </a>
</div>

<div class="navbar">
    <a href="./Home.html">Home</a>
    <div class="subnav">
        <button class="subnavbtn">Library Essentials <i class="fa fa-caret-down"></i></button>
        <div class="subnav-content">
            <a href="./Borrow.jsp">Borrow a Book</a>
            <a href="./Return.html">Return a Book </a>
        </div>
    </div>
    <div class="subnav">
        <button class="subnavbtn">Services<i class="fa fa-caret-down"></i></button>
        <div class="subnav-content">
            <a href="./BookRoom.html">Book a Room </a>
           

        </div>
    </div>
    <div class="subnav">
        <button class="subnavbtn"> Catalogue  <i class="fa fa-caret-down"></i></button>

        <div class="subnav-content">
            <a href="./Viewitems.html">View Items </a>
           
        </div>

    </div>

   

  </div>
  <sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
         url = "jdbc:mysql://localhost:3306/library"
         user = "root"  password = ""/>
 
      <sql:query dataSource = "${snapshot}" var = "result">
      
		SELECT ID, TITLE, AUTHOR, ISBN, DESCRIP, GENRE, STKLVL FROM library.BOOKS</sql:query>
  
  <h2>Catalogue</h2>
  <input type="text" id="myInput" onkeyup="myFunction()" placeholder="Search for the book's name.." title="Type in a name">

  <table id="myTable">
    <tr class="header">
      <th style="width:20%;">Book</th>
      <th style="width:20%;">Author</th>
      <th style="width:20%;">ISBN</th>
      <th style="width:20%;">GENRE</th>
      <th style="width:20%;">AVAILABILITY</th>
    </tr>
    <c:forEach var = "row" items = "${result.rows}">
            <tr>
               <td><c:out value = "${row.TITLE}"/></td>
               <td><c:out value = "${row.AUTHOR}"/></td>
               <td><c:out value = "${row.ISBN}"/></td>
               <td><c:out value = "${row.GENRE}"/></td>
               <td><c:out value = "${row.STKLVL}"/></td>
            </tr>
    </c:forEach>
  </table>

  </body>

</html>