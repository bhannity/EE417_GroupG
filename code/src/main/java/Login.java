//package form.login;

import java.io.IOException;
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
		 
		 LoginDao dao = new LoginDao();
		
		if(dao.check(username, pass)){
			
			session.setAttribute("username", username);
			response.sendRedirect("Home.html");
			
		} else {
			
			request.setAttribute("error","Invalid Username or Password");
			RequestDispatcher rd=request.getRequestDispatcher("login.html");            
			rd.include(request, response);
			
		}
		
		
	}

}
