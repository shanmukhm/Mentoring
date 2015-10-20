package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import model.Product;
import model.ProductJdbcTemplate;
import model.User;

@Controller
public class ProductsController {
	@Autowired
	private ProductJdbcTemplate productTemplate;
	 @ResponseBody
	 @RequestMapping(value = "/fetchproduct.do", method = RequestMethod.GET)
	 	public List<Product> getProductList(@RequestParam String category ){
		 	List <Product> products = productTemplate.listProducts(category);
		 	return products;
	 }
	 @RequestMapping(value = "/ProductDescription.do")
	 	public void getProduct(@RequestParam String category,@RequestParam String id,HttpServletRequest request,HttpServletResponse response) throws IOException {
		 	Product product = productTemplate.getProduct(category, id);
		 	if(category.equals("books")||category.equals("electronics"))
		 		product.setGender("All");
		 	JSONObject jsonProduct = new JSONObject(product);
		 	HttpSession session = request.getSession();
		 	session.setAttribute("productId", product.getProductId());
		 	session.setAttribute("category", product.getCategory());
		 	session.setAttribute("product", jsonProduct);
		 	response.sendRedirect("html/product-description.jsp");
	 }
	 @RequestMapping(value = "/addtocart.do", method = RequestMethod.POST)
	 public void addtocart(HttpServletRequest request,HttpServletResponse response) throws IOException{
		 HttpSession session = request.getSession();
		 Integer userid = (Integer) session.getAttribute("userid");
		 String productId = (String) session.getAttribute("productId");
		 String category = (String) session.getAttribute("category");
		 productTemplate.addProduct(productId, category, userid);
		 response.sendRedirect("html/cart.jsp");
	 }
	 @ResponseBody
	 @RequestMapping(value = "/getcart.do")
	 public List<Product> getCart(HttpServletRequest request,HttpServletResponse response) throws IOException {
		 HttpSession session = request.getSession();
		 User user = (User) session.getAttribute("user");
		 List<Product> cart = productTemplate.getCart(user.getUserid());
		 session.setAttribute("products",cart);
		 return cart;
//		 response.sendRedirect("html/cart.jsp");
	 }
	 @RequestMapping(value = "/deleteItem.do", method = RequestMethod.POST)
	 public void deleteItem(@RequestParam String id,HttpServletRequest request,HttpServletResponse response) throws IOException {
		 HttpSession session = request.getSession();
		 User user = (User) session.getAttribute("user");
		 productTemplate.removeItem(user.getUserid(), id);
		 response.sendRedirect("html/cart.jsp");
	 }
}
