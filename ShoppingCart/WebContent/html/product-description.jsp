<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Product Description</title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
    <!-- Optional theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.5.5/slick.min.css">
    <!-- Add the new slick-theme.css if you want the default styling -->
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.5.5/slick-theme.min.css">
    <link rel="stylesheet" type="text/css" href="../css/product_desc.css">
    <link rel="stylesheet" type="text/css" href="../css/shopping-kart.css">
</head>

<body>
<%
 //String tableName = request.getParameter("table");
 //String productId = request.getParameter("id");
 //Class.forName("com.mysql.jdbc.Driver");
	//Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/products","root","11me10050");
	//String query = "select * from " + tableName + " where productId = '"+productId+"'" ;
	//Statement state = connection.createStatement();
	//ResultSet rs = state.executeQuery(query);
	//rs.next();
	//String gender = null;
	//try{ gender= rs.getString("gender");}
	//catch(SQLException ex){
	 // gender = "All";
	//}
%>
    <div class="header">
    <div class="container topbar">
        <img src="../images/e-shop.png" height="80px">
        <span id="site-title">Shopping Bee</span>
          <div id="cart">
              <span id="signin"><a href="login.jsp">Sign In</a></span>
              <span><a href="cart.jsp">MyCart</a></span>
              <span id="logout"><a href="../logout">LogOut</a></span>
          </div>
    </div>
    <div class = "container-fluid categories">
        <ul class="main-navbar nav nav-pills nav-justified" id="pills-first">
              <li role="presentation"><a href="Shoppingkart.jsp">Home</a></li>
              <li role="presentation"><a href="electronics.jsp">Electronics</a></li>
              <li role="presentation"><a href="books.jsp">Books</a></li>
              <li role="presentation"><a href="clothing.jsp">Clothing</a></li>
              <li role="presentation"><a href="footware.jsp">Footware</a></li>
            </ul>
    </div>
  </div>
    <div class="container product-description-container">
        <div class="product-description_carousel col-sm-8">
           <img src = "${product.get("imgsrc")}" alt = "product"/>
        </div>
        <div class="product_details_sidebar col-sm-4">
            <h4 id="product-title">${product.get("name")}</h4>
            <div class="options col-sm-10 no-padding">
                <div class="review">
                    <div class="product_rating col-xs-12">
                        <img src="../images/blue-star.png">
                        <img src="../images/blue-star.png">
                        <img src="../images/blue-star.png">
                        <img src="../images/blue-star.png">
                        <img src="../images/blue-star.png">
                        <span class="no_of_reviews">25 Reviews</span>
                        <span style="border-left: 1px solid blue;padding: 0px 2px;"></span>
                        <a href="#"> Write a review </a>
                    </div>
                </div>
                <div class="stock_delivery">
                    <div class="product_availability col-xs-12">
                        <span class="availability">Availability: <span class="instock">In stock</span></span>
                        <span class="delevierydays">Deleiverd in 10-15 days</span>
                    </div>
                </div>
                <div class="price">
                    <div class="col-xs-12">
                            <h3 class="text-primary">Price</h3>
                            <p>MRP: <del style="color:red">Rs.${product.get("mrp")}</del></p>
                            <p>Selling Price: <span style="color:green;font-size:25px">Rs.${product.get("sellingPrice")}</span></p>
                        </div>
                </div>
                <div class="pincode">
                    <div class="pin col-xs-10">
                        <div class="input-group">
                            <input type="text" class="form-control" placeholder="Pincode&hellip;">
                            <span class="input-group-btn">
                                <button type="button" class="btn btn-default">COD</button>
                            </span>
                        </div>
                    </div>
                </div>
                <button class="btn btn-primary btn-lg" id="addtocart">Add to Cart</button>
            </div>
        </div>
    </div>

   <div class="container">
        <div class="col-sm-12">
            <h3>Product Description:</h3>
            <table class="table table-bordered">
                <tbody>
                  <tr>
                    <td>Brand</td>
                    <td id="product-brand">${product.get("brand")}</td>
                  </tr>
                  <tr>
                    <td >Ideal For</td>
                    <td id="product-gender">${product.get("gender")}</td>
                  </tr>
                  <tr>
                    <td>Fabric</td>
                    <td>100% Cotton</td>
                  </tr>
                </tbody>
          </table>
        </div>
   </div>
   <!-- Latest compiled and minified JavaScript -->
    <script src="../js/jquery.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../js/product_description.js"></script>
</body>

</html>
