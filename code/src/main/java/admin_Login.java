

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class admin_Login
 */
@WebServlet("/admin_Login")
public class admin_Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public admin_Login() {
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
		String username = request.getParameter("adminname");
		String pass = request.getParameter("password");
		HttpSession session = request.getSession();
		
		// get response writer
	    response.setContentType("text/html"); 
	    //object to print out  dynamic html contents. 
	    PrintWriter writer = response.getWriter();
		 
	    adminDao dao = new adminDao();
		
		if(dao.check(username, pass)){
			
			session.setAttribute("username", username);
			response.sendRedirect("admin.jsp");
			
		} else {
						 
			request.getRequestDispatcher("/Admin.html").include(request, response);
			writer.print("<H2 style='color:red;font-style:bold;text-align:center'>Sorry, admin username or password error!, please try again.<br>Or contact an administrator if problems persist</H2>");
			//rd.include(request, response);
			
		}
		writer.close();
		
	}

}
