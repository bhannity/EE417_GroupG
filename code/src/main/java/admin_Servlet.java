

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class admin_Servlet
 */
@WebServlet("/admin_Servlet")
public class admin_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public admin_Servlet() {
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
		response.setContentType("text/html"); 
		Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
        int maxID = 0;
        String JDBCUrl = "jdbc:mysql://localhost:3306/library"; //define the URL for your database connection. 
        String username = "root"; //local database usernanme
        String password = ""; //local database password, use "" for project upload

	    PrintWriter out = response.getWriter();
	    try {
            System.out.println("\nConnecting to the SSD Database......");
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(JDBCUrl, username, password);
        }
        catch (Exception e) {
            System.out.println("\nAn error has occurred during the connection phase!  This is most likely due to your CLASSPATH being set wrong and the"
                    + "  classes unable to be found.  Otherwise the database itself may be down.  Try telneting to port 3306 and see if it is up!");
            e.printStackTrace();
            System.exit(0);
        }
   
        String user = request.getParameter("uname");
        String email = request.getParameter("email");
        String pass = request.getParameter("psw");     
        
        try {
			  System.out.println("\nCP1");
			  PreparedStatement pstmt = con.prepareStatement("INSERT INTO library.admin(username,email,password) VALUES (?,?,?)");
			  pstmt.clearParameters();       // Clears any previous parameters
			  //pstmt.setInt(1, ++maxID);    //increment the max ID based on largest value there. 
			  pstmt.setString(1, user);
			  pstmt.setString(2, email);
			  pstmt.setString(3, pass);
			  pstmt.executeUpdate();
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
		         out.print("<br><H2 style='color:red;font-style:bold;text-align:center'>Your Registration has been unsuccessfull!,</br> Please try again </H2>");
				 request.getRequestDispatcher("/admin.jsp").include(request, response); //request dispatcher
				 out.close();
	            }
	        }  
        request.getRequestDispatcher("/admin.jsp").include(request, response); //request dispatcher
	    out.print("<br><H2 style='color:blue;font-style:bold;text-align:center'>New Admin Registration has been successfull!</H2>");
		out.close();
	}

}
