<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Borrow</title>
    <link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="css/borrow_style.css">

</head>

<body>
	<sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
         url = "${sessionScope.dbUrl}"
         user = "${sessionScope.dbUser}"  password = "${sessionScope.dbPassword}"/>
 
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
           <c:set var = "Odyssey" scope = "session" value = "${false}"/>
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

    <div class="navbar">
        <a href="./Home.html">Home</a>
        <div class="subnav">
            <button class="subnavbtn">Library Essentials <i class="fa fa-caret-down"></i></button>
            <div class="subnav-content">
                <a href="./Borrow.jsp">Borrow a Book</a>
                <a href="./Return.html">Return a Book </a>
                <a href="./viewAccount.jsp">View Account </a>
            </div>
        </div>
        <div class="subnav">
            <button class="subnavbtn">Services<i class="fa fa-caret-down"></i></button>
            <div class="subnav-content">
                <a href="./BookRoom.html">Book a Room </a>


            </div>
        </div>
        <div class="subnav">
            <button class="subnavbtn"> Catalogue <i class="fa fa-caret-down"></i></button>

            <div class="subnav-content">
                <a href="./Viewitems.jsp">View Items </a>

            </div>

        </div>
    </div>

    <!-- collection section starts  -->

    <section class="collection" id="collection">

        <h1 class="heading"> <span>Library Selection</span> </h1>

        <div class="swiper collection-slider">

            <div class="swiper-wrapper">

                <div class="swiper-slide box">
                    <div class="image">
                        <img src="images/od.jpg" alt="">
                    </div>
                    <div class="content">
                        <h3>The Odyssey</h3>
                        <div class="author">Homer</div>
                        <c:choose>
						  <c:when test="${Odyssey=='true'}">
						        <form method="POST" action="borr_Servlet"><p><button class="btn">Borrow</button></p>
								<input type="text" name="name" value="The Odyssey" hidden="true">
								</form>
						    </c:when>
						    <c:otherwise>
						    	<form method="POST" action="ret_Servlet"><p><button class="btn2">Return</button></p>
								<input type="text" name="name" value="The Odyssey" hidden="true">
								</form>
						        <p style="color:red;font-weight:bold">The Odyssey is currently unavailable</p><br>
						    </c:otherwise> 
					  </c:choose>
                    </div>
                </div>

                <div class="swiper-slide box">
                    <div class="image">
                        <img src="images/ulysses.png" alt="">
                    </div>
                    <div class="content">
                        <h3>Ulysses</h3>
                        <div class="author">James Joyce</div>
                        <c:choose>
						  <c:when test="${Ulysses=='true'}">
						        <form method="POST" action="borr_Servlet"><p><button class="btn">Borrow</button></p>
								<input type="text" name="name" value="Ulysses" hidden="true">
								</form>
						    </c:when>
						    <c:otherwise>
						    	<form method="POST" action="ret_Servlet"><p><button class="btn2">Return</button></p>
								<input type="text" name="name" value="Ulysses" hidden="true">
								</form>
						        <p style="color:red;font-weight:bold">Ulysses is currently unavailable</p><br>
						    </c:otherwise> 
					  </c:choose>
                    </div>
                </div>

                <div class="swiper-slide box">
                    <div class="image">
                        <img src="images/crime.jpg" alt="">
                    </div>
                    <div class="content">
                        <h3>Crime & Punishment</h3>
                        <div class="author">Fyodor Dostoyetsky</div>
                        <c:choose>
						  <c:when test="${CaP=='true'}">
						        <form method="POST" action="borr_Servlet"><p><button class="btn">Borrow</button></p>
								<input type="text" name="name" value="Crime and Punishment" hidden="true">
								</form>
						    </c:when>
						    <c:otherwise>
						    	<form method="POST" action="ret_Servlet"><p><button class="btn2">Return</button></p>
								<input type="text" name="name" value="Crime and Punishment" hidden="true">
								</form>
						        <p style="color:red;font-weight:bold">Crime and Punishment is currently unavailable</p><br>
						    </c:otherwise> 
					  </c:choose>
                    </div>
                </div>

                <div class="swiper-slide box">
                    <div class="image">
                        <img src="images/lostTime.jpg" alt="">
                    </div>
                    <div class="content">
                        <h3>In Search of Lost Time</h3>
                        <div class="author">Marcel Proust</div>
                        <c:choose>
						  <c:when test="${ISoLT=='true'}">
						        <form method="POST" action="borr_Servlet"><p><button class="btn">Borrow</button></p>
								<input type="text" name="name" value="In Search of Lost Time" hidden="true">
								</form>
						    </c:when>
						    <c:otherwise>
						    	<form method="POST" action="ret_Servlet"><p><button class="btn2">Return</button></p>
								<input type="text" name="name" value="In Search of Lost Time" hidden="true">
								</form>
						        <p style="color:red;font-weight:bold">In Search of Lost Time is currently unavailable</p><br>
						    </c:otherwise> 
					  </c:choose>
                    </div>
                </div>

                <div class="swiper-slide box">
                    <div class="image">
                        <img src="images/don.jpg" alt="">
                    </div>
                    <div class="content">
                        <h3>Don Quixote</h3>
                        <div class="author">Miguel de Cervantes</div>
                        <c:choose>
						  <c:when test="${Quixote=='true'}">
						        <form method="POST" action="borr_Servlet"><p><button class="btn">Borrow</button></p>
								<input type="text" name="name" value="Don Quixote" hidden="true">
								</form>
						    </c:when>
						    <c:otherwise>
						    	<form method="POST" action="ret_Servlet"><p><button class="btn2">Return</button></p>
								<input type="text" name="name" value="Don Quixote" hidden="true">
								</form>
						        <p style="color:red;font-weight:bold">Don Quixote is currently unavailable</p><br>
						    </c:otherwise> 
					  </c:choose>
                    </div>
                </div>

                <div class="swiper-slide box">
                    <div class="image">
                        <img src="images/hundredYears.webp" alt="">
                    </div>
                    <div class="content">
                        <h3>100 Years of Solitude</h3>
                        <div class="author">Gabriel Garcia Marquez</div>
                        <c:choose>
						  <c:when test="${OHYoS=='true'}">
						        <form method="POST" action="borr_Servlet"><p><button class="btn">Borrow</button></p>
								<input type="text" name="name" value="One hundred Years of Solitude" hidden="true">
								</form>
						    </c:when>
						    <c:otherwise>
						    	<form method="POST" action="ret_Servlet"><p><button class="btn2">Return</button></p>
								<input type="text" name="name" value="One hundred Years of Solitude" hidden="true">
								</form>
						        <p style="color:red;font-weight:bold">100 Years of Solitude is currently unavailable</p><br>
						    </c:otherwise> 
					  </c:choose>
                    </div>
                </div>

                <div class="swiper-slide box">
                    <div class="image">
                        <img src="images/gatsby.png" alt="">
                    </div>
                    <div class="content">
                        <h3>The Great Gatsby</h3>
                        <div class="author">F. Scott Fitzgerald</div>
                        <c:choose>
						  <c:when test="${Gatsby=='true'}">
						        <form method="POST" action="borr_Servlet"><p><button class="btn">Borrow</button></p>
								<input type="text" name="name" value="The Great Gatsby" hidden="true">
								</form>
						    </c:when>
						    <c:otherwise>
						    	<form method="POST" action="ret_Servlet"><p><button class="btn2">Return</button></p>
								<input type="text" name="name" value="The Great Gatsby" hidden="true">
								</form>
						        <p style="color:red;font-weight:bold">The Great Gatsby is currently unavailable</p><br>
						    </c:otherwise> 
					  </c:choose>
                    </div>
                </div>

                <div class="swiper-slide box">
                    <div class="image">
                        <img src="images/lolita.jpg" alt="">
                    </div>
                    <div class="content">
                        <h3>Lolita</h3>
                        <div class="author">Vladimir Nabokov</div>
                        <c:choose>
						  <c:when test="${Lolita=='true'}">
						        <form method="POST" action="borr_Servlet"><p><button class="btn">Borrow</button></p>
								<input type="text" name="name" value="Lolita" hidden="true">
								</form>
						    </c:when>
						    <c:otherwise>
						    	<form method="POST" action="ret_Servlet"><p><button class="btn2">Return</button></p>
								<input type="text" name="name" value="Lolita" hidden="true">
								</form>
						        <p style="color:red;font-weight:bold">Lolita is currently unavailable</p><br>
						    </c:otherwise> 
					  </c:choose>
                    </div>
                </div>
            </div>

            <div class="swiper-button-next"></div>
            <div class="swiper-button-prev"></div>

        </div>

    </section>

    <!-- collection section ends -->



    <!-- footer section starts  -->

    <section class="footer">

        <div class="box-container">

            <div class="box">
                <h3>Contact Info</h3>
                <p href="#"> <i class="fas fa-phone"></i> +353861234567 </p>
                <p href="#"> <i class="fas fa-phone"></i> +0460987654 </p>
                <p href="#"> <i class="fas fa-envelope"></i> someone@mail.dcu.ie </p>
            </div>

        </div>

        <div class="credit"> Created By <span>Group G</span> | All Rights Reserved! </div>

    </section>

    <!-- footer end -->

    <script src="https://unpkg.com/swiper@7/swiper-bundle.min.js"></script>
    <script src="scripts/borrow_script.js"></script>

</body>

</html>
