

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public LoginServlet() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    //System.out.println("Hello from Login Servlet");
	    String username = request.getParameter("uname");
	    String password = request.getParameter("psw");
	    
	    // get response writer
	    response.setContentType("text/html"); 
	    //object to print out  dynamic html contents. 
	    PrintWriter writer = response.getWriter();
	    if((username.equals("admin")) && (password.equals("admin123")))
	      {
		writer.print("<H4 style='font-size:12px'>");
		writer.print("Hello, "+username);
		writer.print("</H4>");
	        request.getRequestDispatcher("/index.jsp").include(request, response);//request dispacher
	      }
	    else if((username.equals("user")) && (password.equals("user123")))
	      {
	         writer.print("<H4 style='font-size:12px'>");
		 writer.print("Hello, "+username);
		 writer.print("</H4>");
	         request.getRequestDispatcher("/index.jsp").include(request, response);//request dispacher
	      }
	    else {
	    	writer.print("<H2 style='color:red;font-style:bold;text-align:center'>Sorry, username or password error!, please try again</H2>");
		request.getRequestDispatcher("/login.html").include(request, response); //request dispacher
	    }
	    writer.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
