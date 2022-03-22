import java.sql.*;

import java.io.IOException;
//import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.util.Calendar;
import java.util.Date; 
import java.text.SimpleDateFormat; 

/**
 * Servlet implementation class borr_Servlet
 */
@WebServlet("/borr_Servlet")
public class borr_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public borr_Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String formVal = request.getParameter("name");
		System.out.println("\nID is   = "+ formVal);
		HttpSession session = request.getSession();   //get the session ID
		Connection con = null;  //connection object
		PreparedStatement stmt =null;
        ResultSet rs = null;   //result set object for receiving data 
        String JDBCUrl = Common.getDatabaseUrlAndName();
        String username = Common.getDatabaseUser();
        String password = Common.getDatabasePassword();
       
        String sessID = (String)session.getAttribute("username");  // save the session ID as a a String
        response.setContentType("text/html");
        Calendar cal = Calendar.getInstance();   //create a calender object
        cal.add(Calendar.DATE, +21);   //add 3 weeks to the current data
        Date date = cal.getTime();     //save it as a Data object
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd"); //format the date for mySQL
           
        String dueDate = formatter.format(date); //save as a String to populate the Database
        System.out.println(dueDate);
        
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
        try {
   	     System.out.println("\nConnection Successful..... creating statement....");
  	     stmt = con.prepareStatement("UPDATE library.BOOKS SET STKLVL = 0,borrowed_By = ?,DUE_DATE=? WHERE TITLE = ?");
   	     stmt.clearParameters();       // Clears any previous parameters
   	     stmt.setString(1, sessID);
   	     stmt.setString(2, dueDate);
		 stmt.setString(3, formVal);
		 stmt.executeUpdate();
		 request.getRequestDispatcher("/Borrow.jsp").include(request, response);
        }
   	     
         catch (SQLException e) {
   	     System.out.println("\nAn error has occurred during the Statement/ResultSet phase.  Please check the syntax and study the Exception details!");
               while (e != null) {
   	         System.out.println(e.getMessage());
                   e = e.getNextException();
   	     }
               System.exit(0);
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

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
