package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import businesslogic.UserValidation;
import model.Product;
import model.ProductJdbcTemplate;
import model.ProductMapper;
import model.User;

@Controller
public class LoginController {
	@Autowired
	private UserValidation userValidation;
	@Autowired
	private ProductJdbcTemplate productTemplate;
	
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
			 response.sendRedirect("html/Shoppingkart.jsp");
		 }
		 else{
			 model.addAttribute("command", new User());
			 model.addAttribute("error","Login details are incorrect");
			 view = "login";
		 }
	      return view;
	   }
	 @ResponseBody
	 @RequestMapping(value = "/fetchproduct.do", method = RequestMethod.GET)
	 	public List<Product> getProductList(@RequestParam String category ) throws JSONException {
		 	List <Product> products = productTemplate.listProducts(category);
		 	return products;
	 }
	 @RequestMapping(value = "/ProductDescription.do")
	 	public void getProduct(@RequestParam String category,@RequestParam String id,HttpServletRequest request,HttpServletResponse response) throws IOException {
		 	Product product = productTemplate.getProduct(category, id);
		 	JSONObject jsonProduct = new JSONObject(product);
		 	HttpSession session = request.getSession();
		 	session.setAttribute("product", jsonProduct);
		 	response.sendRedirect("html/product-description.jsp");
	 }
}

