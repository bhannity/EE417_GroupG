//package form.login;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Login")
public class Login extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("uname");
		String pass = request.getParameter("psw");
		HttpSession session = request.getSession();
		
		// get response writer
	    response.setContentType("text/html"); 
	    //object to print out  dynamic html contents. 
	    PrintWriter writer = response.getWriter();
		 
		 LoginDao dao = new LoginDao();
		
		if(dao.check(username, pass)){
			
         session.setAttribute("dbUrl", Common.getDatabaseUrlAndName());
         session.setAttribute("dbUser", Common.getDatabaseUser());
         session.setAttribute("dbPassword", Common.getDatabasePassword());
			session.setAttribute("username", username);
			session.setAttribute("password", pass);
			response.sendRedirect("Home.html");
			
		} else {
						
			request.setAttribute("error","Invalid Username or Password");
			//RequestDispatcher rd=request.getRequestDispatcher("/login.html");  
			request.getRequestDispatcher("/login.html").include(request, response);
			writer.print("<H2 style='color:blue;font-style:bold;text-align:center'>Sorry, username or password error!, please try again.<br>Or <a href=\"signUp.html\" class=\"ml-2\" style=\"color:red\"><u><b>Sign Up</b></u></a> if you  don't already have an account</H2>");
			//rd.include(request, response);
			
		}
		writer.close();
		
	}

}
