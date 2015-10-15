package shopping;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.*;
import org.json.JSONException;
import org.json.JSONObject;

/**
 * Servlet implementation class AddToCart
 */
//@WebServlet("/AddToCart")
public class AddToCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession(false);
		if(session != null){
			JSONObject product = (JSONObject) session.getAttribute("product");
			List<JSONObject> products = (ArrayList<JSONObject>) session.getAttribute("products");
			List<JSONObject> list = null;
			if(products == null)
				list =  new ArrayList<JSONObject>();
			else
				list = products;
			try {
				if(product != null){
					System.out.println(product.get("name"));
					list.add(product);
					session.setAttribute("products", list);
					response.sendRedirect("html/cart.jsp");
				}
				else
					System.out.println("no product");
			} 
			catch (JSONException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}
