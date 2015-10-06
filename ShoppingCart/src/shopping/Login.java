package shopping;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 * Servlet implementation class Login
 */
@WebServlet("/login")
public class Login extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name= (String)request.getParameter("name");
		String pass= (String)request.getParameter("password");
		if(UserValidation.validate(name, pass) && name != null){
			HttpSession session = request.getSession();
			System.out.println(session.getId());
			session.setAttribute("username", name);
			session.setAttribute("password", pass);
			session.setAttribute("error", "");
			response.sendRedirect("./html/Shoppingkart.jsp");
//			RequestDispatcher rd = request.getRequestDispatcher("/html/Shoppingkart.jsp");
//			rd.forward(request, response);
//			writer.println("Welcome "+name+"\n");
		}
		else{
			HttpSession session = request.getSession();
			session.setAttribute("error", "Your login details are incorrect");
			response.sendRedirect("./html/login.jsp");
//			reqdis.include(request, response);
			
		}
	}
	public void destroy(){System.out.println("servlet is destroyed");
 
	}
}
