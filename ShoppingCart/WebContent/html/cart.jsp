<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>My Cart</title>
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
    <div class="header">
    <div class="container topbar">
        <a href="Shoppingkart.jsp"><img src="../images/e-shop.png" height="80px"></a>
        <span id="site-title">Shopping Bee</span>
          <div id="cart">
              <span id="welcome"><a>Hello ${username}</a></span>
              <span id="signin"><a href="login.jsp">Sign In</a></span>
              <span><a href="cart.jsp">MyCart</a></span>
              <span id="logout"><a href="../logout">LogOut</a></span>
          </div>
    </div>
    <div class = "container-fluid">
        <ul class="main-navbar nav nav-pills nav-justified" id="pills-first">
              <li role="presentation"><a href="Shoppingkart.jsp">Home</a></li>
              <li role="presentation"><a href="electronics.jsp">Electronics</a></li>
              <li role="presentation"><a href="books.jsp">Books</a></li>
              <li role="presentation"><a href="clothing.jsp">Clothing</a></li>
              <li role="presentation"><a href="footware.jsp">Footware</a></li>
            </ul>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-2">
    </div>
    <div class="col-xs-8 container">
      <div class = "cart">
        <table class="table cart-table">
          <thead>
            <tr>
              <th></th>
              <th>ITEM</th>
              <th>QTY</th>
              <th>PRICE</th>
              <th>DELIVERY DETAILS</th>
              <th>SUBTOTAL</th>
              <th></th>
            </tr>
          </thead>
          <tbody>
           <c:forEach items="${products}" var="product">
            <tr id='${product.get("productId")}'><td class="product-thumb"><img src='${product.get("imgsrc")}' alt="product"></td>
                <td>${product.get("name")}</td><td>1</td><td>Rs.${product.get("selling_price")}</td>
                <td>${product.get("delivery")}</td><td>Total</td><td>
                <button class="btn btn-primary remove-button">Remove</button></td></tr>
                </c:forEach>
          </tbody>
        </table>
      </div>
    </div>
    <div class="col-xs-2">
    </div>
  </div>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/1.2.1/jquery-migrate.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.5.5/slick.min.js"></script>
</body>

</html>