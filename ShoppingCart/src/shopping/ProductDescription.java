package shopping;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import java.sql.*;
import java.util.*;

/**
 * Servlet implementation class ProductDescription
 */
@WebServlet("/ProductDescription")
public class ProductDescription extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 String tableName = request.getParameter("table");
		 String productId = request.getParameter("id");
		 System.out.println(tableName);
		 try{
			 Class.forName("com.mysql.jdbc.Driver");
			 Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/products","root","11me10050");
			 String query = "select * from " + tableName + " where productId = '"+productId+"'" ;
			 Statement state = connection.createStatement();
			 ResultSet rs = state.executeQuery(query);
			 rs.next();
			 ResultSetMetaData rsmd = rs.getMetaData();
			 Integer colNum = rsmd.getColumnCount();
			 JSONObject productData = new JSONObject(); 
			 for(int i=1;i <= colNum;i++){
				 String column_name = rsmd.getColumnName(i);
				 if(rsmd.getColumnType(i)==java.sql.Types.DOUBLE){
					 productData.put(column_name, rs.getDouble(column_name)); 
			           }
				 else if(rsmd.getColumnType(i)==java.sql.Types.VARCHAR){
					 productData.put(column_name, rs.getString(column_name));
			           }
			 }
			 if(tableName == "books"){
				 productData.put("gender", "All");
			 }
			 HttpSession session = request.getSession();
			 System.out.println(productData.get("mrp"));
			 session.setAttribute("product", productData);
			 response.sendRedirect("html/product-description.jsp");
		 }
		 catch(Exception ex){
			 ex.printStackTrace();
		 }
	}


}
