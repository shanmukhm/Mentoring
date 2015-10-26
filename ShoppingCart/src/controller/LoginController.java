package controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import businesslogic.UserValidation;
import dao.UserJdbcTemplate;
import model.User;

@Controller
public class LoginController {
	@Autowired
	private UserValidation userValidation;
	@Autowired
	private UserJdbcTemplate userTemplate;
	
	 @RequestMapping(value = "/user.do", method = RequestMethod.GET)
	   public ModelAndView user() {
	      return new ModelAndView("login", "command", new User());
	   }
	 @RequestMapping(value = "/login.do", method = RequestMethod.POST)
	   public String addUser(@ModelAttribute("user")User user, 
	   ModelMap model,HttpServletResponse response,HttpServletRequest request) throws IOException {
		 String view = null;
		 if(userValidation.validate(user)){
			 HttpSession session = request.getSession();
			 User userObject = userTemplate.getUser(user.getUsername());
			 session.setAttribute("username", userObject.getUsername());
			 session.setAttribute("userid", userObject.getUserid());
			 session.setAttribute("isLoggedin", "true");
			 session.setAttribute("error", "");
			 session.setAttribute("command", user);
			 session.setAttribute("user", userObject);
			 response.sendRedirect("html/Shoppingkart.jsp");
		 }
		 else{
			 model.addAttribute("command", new User());
			 model.addAttribute("error","Login details are incorrect");
			 view = "login";
		 }
	      return view;
	   }
	 @RequestMapping(value="/register.do", method = RequestMethod.POST)
	 public void register(@ModelAttribute("user")User user,HttpServletResponse response) throws IOException{
		 System.out.println(user.getGender());
		 userTemplate.addUser(user);
		 response.sendRedirect("/ShoppingCart/html/success.html");
	 }
	 @RequestMapping(value="/logout.do")
	 	public void logout(HttpServletRequest request,HttpServletResponse response) throws IOException {
		 	HttpSession session = request.getSession();
			session.invalidate();
			response.sendRedirect("html/Logout.html");
	 }
}

