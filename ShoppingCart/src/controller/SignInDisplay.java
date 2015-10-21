package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Servlet implementation class SignInDisplay
 */
//@WebServlet("/SignInDisplay")
@Controller
public class SignInDisplay {
    @RequestMapping(value = "/SignInDisplay.do")   
	public void signin(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession(false);
		PrintWriter out = response.getWriter();
		System.out.println(session.getAttribute("isLoggedin"));
		if(session.getAttribute("isLoggedin")!= null)
			out.println("yes");
		else
			out.println("no");
			
	}
    @RequestMapping(value = "/isLoggedin.do")
    public void isLoggedin(HttpServletRequest request, HttpServletResponse response) throws IOException {
    	this.signin(request, response);
    }


}
