package shopping;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class SignInDisplay
 */
@WebServlet("/SignInDisplay")
public class SignInDisplay extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession(false);
		PrintWriter out = response.getWriter();
		System.out.println(session.getAttribute("isLoggedin"));
		if(session.getAttribute("isLoggedin")!= null)
			out.println("yes");
		else
			out.println("no");
			
	}



}
