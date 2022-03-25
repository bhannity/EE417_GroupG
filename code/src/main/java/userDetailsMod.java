

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
//import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
/**
 * Servlet implementation class userDetailsMod
 */
@WebServlet("/userDetailsMod")
public class userDetailsMod extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public userDetailsMod() {
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
		
		String formVal = request.getParameter("formName");
		String session1 = request.getParameter("sessionID");
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		String url = Common.getDatabaseUrlAndName();
	    String username = Common.getDatabaseUser();
	    String password = Common.getDatabasePassword();
		switch(formVal){
		  case "upDateEmail":
			  System.out.println("\nUpdate Password was called");
			  String newEmail = request.getParameter("nemail");
			  String conformMail = request.getParameter("cemail");
			  
			  if(newEmail.equals(conformMail)) {
				   String sql = "UPDATE user SET email=? where username=?";
				   			   
				   try {
				        Class.forName("com.mysql.cj.jdbc.Driver");
					    Connection con = DriverManager.getConnection(url, username, password);
				    	PreparedStatement st = con.prepareStatement(sql);

				    	st.setString(1,  conformMail);
				    	st.setString(2, session1);
				    	st.executeUpdate();
					
				} catch(Exception e) {
					e.printStackTrace();
				}
				   request.getRequestDispatcher("/viewAccount.jsp").include(request, response);
				  out.print("<H3 style='color:blue;font-style:bold;text-align:center'>Email Address was succesfully updated</h3>");  
				  
			  }
			  else {
				  request.getRequestDispatcher("/viewAccount.jsp").include(request, response);
				  out.print("<H3 style='color:red;font-style:bold;text-align:center'>Emails do not match</h3>");
			  }
		    break;
		  case "upDatePassword":
			  System.out.println("\nUpdate Password was called");
			  String newPaSS = request.getParameter("npwd");
			  String conformpASS = request.getParameter("cpsw");
			  
			  if(newPaSS.equals(conformpASS)) {
				   String sql = "UPDATE user SET PASSWORD=? where username=?";
				   session.setAttribute("password", newPaSS);
				   			   
				   try {
				        Class.forName("com.mysql.cj.jdbc.Driver");
					    Connection con = DriverManager.getConnection(url, username, password);
				    	PreparedStatement st = con.prepareStatement(sql);

				    	st.setString(1,  newPaSS);
				    	st.setString(2, session1);
				    	st.executeUpdate();
			
					
				} catch(Exception e) {
					e.printStackTrace();
				}
				   request.getRequestDispatcher("/viewAccount.jsp").include(request, response);
				  out.print("<H3 style='color:blue;font-style:bold;text-align:center'>Password was succesfully updated</h3>");  
				  
			  }
			  else {
				  request.getRequestDispatcher("/viewAccount.jsp").include(request, response);
				  out.print("<H3 style='color:red;font-style:bold;text-align:center'>Passwords do not match</h3>");
			  }
		    break;
		}
		//String pass = request.getParameter("pwd");
		System.out.println("\nsession1  is   = "+ session1);
		
	}

}
