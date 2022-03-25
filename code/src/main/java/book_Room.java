

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class book_Room
 */
@WebServlet("/book_Room")
public class book_Room extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public book_Room() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("\nRoom Booking Servlet booked");
		String formVal = request.getParameter("room_action");
		System.out.println("\nID is   = "+ formVal);
		HttpSession session = request.getSession();   //get the session ID
		PrintWriter writer = response.getWriter();
		Connection con = null;  //connection object
		PreparedStatement stmt =null;
        ResultSet rs = null;   //result set object for receiving data 
        String JDBCUrl = Common.getDatabaseUrlAndName();
        String username = Common.getDatabaseUser();
        String password = Common.getDatabasePassword();
        response.setContentType("text/html");
        
        String sessID = (String)session.getAttribute("username");  // save the session ID as a a String
        System.out.println("\nSession ID is "+ sessID);
        
        try {
            System.out.println("\nConnecting to the SSD Database......");
            Class.forName("com.mysql.jdbc.Driver"); //load the database driver
            con = DriverManager.getConnection(JDBCUrl, username, password); //create the connection
        }
        catch (Exception e) {
            System.out.println("\nAn error has occurred during the connection phase!  This is most likely due to your CLASSPATH being set wrong and the"
                    + "  classes unable to be found.  Otherwise the database itself may be down.  Try telneting to port 3306 and see if it is up!");
            e.printStackTrace();
            System.exit(0);
        }
        if (formVal.equals("booking")) {
	        try {
	    	 String fullname = request.getParameter("fname");
	         System.out.println("\nFullname is "+ fullname);
	         String email = request.getParameter("email");
	         System.out.println("\nEmail is "+ email);
	         String bDate = request.getParameter("SelectedDate");
	         System.out.println("\nBooking Data is "+ bDate);
	         String room = request.getParameter("room");
	         System.out.println("\nRoom is "+ room);
	         String time = request.getParameter("time");
	         System.out.println("\nTimeslot is "+ time);
	   	     System.out.println("\nConnection Successful..... creating statement....");
	  	     stmt = con.prepareStatement("UPDATE library.room SET username = ?,fullname = ?,email=?,BookDate=?, TIMESLOT=? WHERE room_no = ?");
	   	     stmt.clearParameters();       // Clears any previous parameters
	   	     stmt.setString(1, sessID);
	   	     stmt.setString(2, fullname);
			 stmt.setString(3, email);
			 stmt.setString(4, bDate);
			 stmt.setString(5, time);
			 stmt.setString(6, room);
			 stmt.executeUpdate();
			 request.getRequestDispatcher("/bookingForm.html").include(request, response);
		     writer.print("<H2 style='color:blue;font-style:bold;text-align:center'>Success, Your rooom is booked..</H2>");
	
	        }
	        catch (SQLException e) {
	      	     System.out.println("\nAn error has occurred during the Statement/ResultSet phase.  Please check the syntax and study the Exception details!");
	                  while (e != null) {
	      	         System.out.println(e.getMessage());
	                      e = e.getNextException();
	      	     }
	                  request.getRequestDispatcher("/bookingForm.html").include(request, response);
	      			  writer.print("<H2 style='color:red;font-style:bold;text-align:center'>Sorry, Error Booking the room!, Database access.</H2>");
	
	              }
	
	        finally {
	      	     try {    
	      	         if (rs != null) rs.close();
		      		 if (stmt != null) stmt.close();
		      		 if (con != null) con.close();
	      	     }
	      	     catch (Exception ex) {
	      	         System.out.println("An error occurred while closing down connection/statement"); 
	                  }
	              
	              }
				}
        else {
        	try {
	        	 System.out.println("\nCancel button was clicked, ROOM # is "+ formVal);
	        	 
	        	 stmt = con.prepareStatement("UPDATE library.room SET username = NULL,fullname = NULL,email=NULL,BookDate=NULL, TIMESLOT=NULL WHERE room_no = ?");
		   	     stmt.clearParameters();       // Clears any previous parameters
		   	     stmt.setString(1, formVal);    
				 stmt.executeUpdate();
				 writer.print("<H2 style='color:blue;font-style:bold;text-align:center'>Your room has been successfully cancelled.</H2>");
				 request.getRequestDispatcher("/viewAccount.jsp").include(request, response);
        	}
        	 catch (SQLException e) {
	      	     System.out.println("\nAn error has occurred during the Statement/ResultSet phase.  Please check the syntax and study the Exception details!");
	                  while (e != null) {
	      	         System.out.println(e.getMessage());
	                      e = e.getNextException();
	      	     }
	                  request.getRequestDispatcher("/viewAccount.jsp").include(request, response);
	      			  writer.print("<H2 style='color:red;font-style:bold;text-align:center'>Sorry, Error Cancelling the room!, Database access.</H2>");
	
	              }
        	 finally {
	      	     try {    
	      	         if (rs != null) rs.close();
		      		 if (stmt != null) stmt.close();
		      		 if (con != null) con.close();
	      	     }
	      	     catch (Exception ex) {
	      	         System.out.println("An error occurred while closing down connection/statement"); 
	                  }
	              
	              }
				}
        	
          
    	}
}			
	


