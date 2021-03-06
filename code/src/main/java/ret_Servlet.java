

import java.io.IOException;
//import java.io.PrintWriter;
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
//import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ret_Servlet
 */
@WebServlet("/ret_Servlet")
public class ret_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ret_Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String formVal = request.getParameter("name");
		System.out.println("\nID is   = "+ formVal);
		//HttpSession session = request.getSession();
		//String sessID = (String)session.getAttribute("username");
		Connection con = null;  //connection object
		PreparedStatement stmt =null;
        ResultSet rs = null;   //result set object for receiving data 
        String JDBCUrl = Common.getDatabaseUrlAndName();
        String username = Common.getDatabaseUser();
        String password = Common.getDatabasePassword();
        //PrintWriter out = response.getWriter();
        response.setContentType("text/html");
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
   	     stmt = con.prepareStatement("UPDATE library.books SET STKLVL = 1,borrowed_By = NULL, DUE_DATE=NULL WHERE TITLE = ?");
   	     stmt.clearParameters();       // Clears any previous parameters
		 stmt.setString(1, formVal);
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
