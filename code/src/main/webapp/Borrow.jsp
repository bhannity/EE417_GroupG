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
  <link rel="stylesheet" href="css/Borrow.css">
 
  
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
            <a href="./Borrow.html">Borrow a Book</a>
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
            <a href="./Viewitems.jsp">View Items </a>
           
        </div>

    </div>
  </div>
</head>
<body>
 <%
 boolean Lolita = false;
 boolean CaP = false;
 %>
<sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
         url = "jdbc:mysql://localhost:3306/library"
         user = "root"  password = ""/>
 
      <sql:query dataSource = "${snapshot}" var = "result">
      
		SELECT TITLE, STKLVL FROM library.BOOKS</sql:query>

<h2 style="text-align:center">Books</h2>
<c:forEach var = "row" items = "${result.rows}">
        <c:if test = "${row.TITLE =='Ulysses'}">
        	<c:if test = "${row.STKLVL > 0}">
        	<c:set var = "Ulysses" scope = "session" value = "${true}"/>
     		<%-- <p>Ulysses availability is <c:out value = "${Ulysses}"/></p>--%>
        	</c:if>
        	<c:if test = "${row.STKLVL < 1}">
        	<c:set var = "Ulysses" scope = "session" value = "${false}"/>
     		<%-- <p>Ulysses availability is <c:out value = "${Ulysses}"/></p>--%>
        	</c:if>
        </c:if>
        <c:if test = "${row.TITLE =='In Search of Lost Time'}">
        	<c:if test = "${row.STKLVL > 0}">
        	<c:set var = "ISoLT" scope = "session" value = "${true}"/>
     		<%--<p>In Search of time availability is <c:out value = "${ISoLT}"/></p>--%>
       	    </c:if>
       	    <c:if test = "${row.STKLVL < 1}">
        	<c:set var = "ISoLT" scope = "session" value = "${false}"/>
     		<%--<p>In Search of time availability is <c:out value = "${ISoLT}"/></p>--%>
        	</c:if>
        </c:if>
        <c:if test = "${row.TITLE =='The Odyssey'}">
        	<c:if test = "${row.STKLVL > 0}">
        	<c:set var = "Odyssey" scope = "session" value = "${true}"/>
     		<%--<p>The Odyessy availability is <c:out value = "${Odyssey}"/></p>--%>
           </c:if>
           <c:if test = "${row.STKLVL < 1}">
           <c:set var = "ISoLT" scope = "session" value = "${false}"/>
     	   <%--<p>The Odyessy availability is <c:out value = "${Odyssey}"/></p>--%>
           </c:if>
        </c:if>
        <c:if test = "${row.TITLE =='Don Quixote'}">
        	<c:if test = "${row.STKLVL > 0}">
        	<c:set var = "Quixote" scope = "session" value = "${true}"/>
     		<%--<p>Don Quixote availability is <c:out value = "${Quixote}"/></p>--%>
           </c:if>
           <c:if test = "${row.STKLVL < 1}">
           <c:set var = "Quixote" scope = "session" value = "${false}"/>
     	   <%--<p>Don Quixote availability is <c:out value = "${Quixote}"/></p>--%>
           </c:if>
        </c:if>
        <c:if test = "${row.TITLE =='One Hundred Years of Solitude'}">
        	<c:if test = "${row.STKLVL > 0}">
        	<c:set var = "OHYoS" scope = "session" value = "${true}"/>
     		<%--<p>One Hundred Years of Solitude availability is <c:out value = "${OHYoS}"/></p>--%>
           </c:if>
           <c:if test = "${row.STKLVL < 1}">
           <c:set var = "OHYoS" scope = "session" value = "${false}"/>
     	   <%--<p>One Hundred Years of Solitude availability is <c:out value = "${OHYoS}"/></p>--%>
           </c:if>
        </c:if>
        <c:if test = "${row.TITLE =='The Great Gatsby'}">
        	<c:if test = "${row.STKLVL > 0}">
        	<c:set var = "Gatsby" scope = "session" value = "${true}"/>
     		<%--<p>The Great Gatsby availability is <c:out value = "${Gatsby}"/></p>--%>
           </c:if>
           <c:if test = "${row.STKLVL < 1}">
           <c:set var = "Gatsby" scope = "session" value = "${false}"/>
     	   <%--<p>The Great Gatsby availability is <c:out value = "${Gatsby}"/></p>--%>
           </c:if>
        </c:if>
         <c:if test = "${row.TITLE =='Lolita'}">
        	<c:if test = "${row.STKLVL > 0}">
        	<c:set var = "Lolita" scope = "session" value = "${true}"/>
     		<%--<p>Lolita availability is <c:out value = "${Lolita}"/></p>--%>
           </c:if>
           <c:if test = "${row.STKLVL < 1}">
           <c:set var = "Lolita" scope = "session" value = "${false}"/>
     	   <%--<p>Lolita availability is <c:out value = "${Lolita}"/></p>--%>
           </c:if>
        </c:if>
        <c:if test = "${row.TITLE =='Crime and Punishment'}">
        	<c:if test = "${row.STKLVL > 0}">
        	<c:set var = "CaP" scope = "session" value = "${true}"/>
     		<%--<p>Crime and Punishment availability is <c:out value = "${CaP}"/></p>--%>
           </c:if>
           <c:if test = "${row.STKLVL < 1}">
           <c:set var = "CaP" scope = "session" value = "${false}"/>
     	   <%--<p>Crime and Punishment availability is <c:out value = "${CaP}"/></p>--%>
           </c:if>
        </c:if>  
    </c:forEach>
<div class="card">
  <img src="images/U.jpg"  style="width:100%">
  <h1>'Ulysses' James Joyce</h1>
  <p> Ulysses chronicles the appointments and encounters of the itinerant Leopold Bloom in Dublin in the course of an ordinary day, 16 June 1904  </p>
  <c:choose>
	  <c:when test="${Ulysses=='true'}">
	        <form method="POST" action="borr_Servlet"><p><button>Borrow</button></p>
			<input type="text" name="name" value="Ulysses" hidden="true">
			</form>
	    </c:when>
	    <c:otherwise>
	        <p style="color:red;font-weight:bold">Ulysses is currently unavailable</p><br>
	    </c:otherwise> 
  </c:choose>
 
  <img src="images/in.jpg"  style="width:100%">
  <h1>'In Search of Lost Time' Marcel Proust</h1>
  <p> In Search of Lost Time follows the narrator's recollections of childhood and experiences into adulthood in the late 19th-century and early 20th-century high-society France, while reflecting on the loss of time and lack of meaning in the world.  </p>
  <c:choose>
	  <c:when test="${ISoLT=='true'}">
	        <form method="POST" action="borr_Servlet"><p><button>Borrow</button></p>
			<input type="text" name="name" value="In Search of Lost Time" hidden="true">
			</form>
	    </c:when>
	    <c:otherwise>
	        <p style="color:red;font-weight:bold">In Search of Time is currently unavailable</p><br>
	    </c:otherwise> 
  </c:choose>
  
  <img src="images/O.jpg"  style="width:100%">
  <h1>'The Odyssey' Homer</h1>
  <p>The Odyssey is one of two major ancient Greek epic poems attributed to Homer. It is one of the oldest extant works of literature still widely read by modern audiences. As with the Iliad, the poem is divided into 24 books. It follows the Greek hero Odysseus, king of Ithaca, and his journey home after the Trojan War </p>
  <c:choose>
	  <c:when test="${ISoLT=='true'}">
	        <form method="POST" action="borr_Servlet"><p><button>Borrow</button></p>
			<input type="text" name="name" value="The Odyssey" hidden="true">
			</form>
	    </c:when>
	    <c:otherwise>
	        <p style="color:red;font-weight:bold">The Odyssey is currently unavailable</p><br>
	    </c:otherwise> 
  </c:choose>
  
</div>

</body>
</html>