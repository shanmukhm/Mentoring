package controller;

import java.util.List;

import javax.sql.DataSource;

import org.json.JSONException;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import businesslogic.UserValidation;
import model.Product;
import model.ProductJdbcTemplate;
import model.ProductMapper;
import model.User;

@RestController
public class LoginController {
	 @RequestMapping(value = "/user.do", method = RequestMethod.GET)
	   public ModelAndView user() {
	      return new ModelAndView("login", "command", new User());
	   }
	 @RequestMapping(value = "/login.do", method = RequestMethod.POST)
	   public String addUser(@ModelAttribute("user")User user, 
	   ModelMap model) {
		 String view = null;
		 System.out.println(user.getPassword());
		 if(UserValidation.validate(user)){
		      view = "redirect:html/Shoppingkart.jsp";
		 }
		 else{
			 model.addAttribute("error","Login details are incorrect");
			 view = "login";
		 }
	      return view;
	   }
	 @RequestMapping(value = "/fetchproduct.do", method = RequestMethod.GET)
	 	public List<Product> getProduct(@RequestParam String category ) throws JSONException {
		 	ProductJdbcTemplate productTemplate = new ProductJdbcTemplate();
		 	DataSource dataSource = (DataSource) UserValidation.context.getBean("dataSource");
			productTemplate.setDataSource(dataSource);
			productTemplate.setProductMapper(new ProductMapper());
		 	System.out.println(category);
		 	List <Product> products = productTemplate.listProducts(category);
		 	return products;
	 }
}

