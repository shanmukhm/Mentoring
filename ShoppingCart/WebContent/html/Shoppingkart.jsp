<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Shopping Bee</title>
    <link rel="stylesheet" href="/ShoppingCart/js/bootstrap.min.css">
    <!-- Optional theme -->
    <link rel="stylesheet" href="/ShoppingCart/js/bootstrap-theme.min.css">
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.5.5/slick.min.css">
    <!-- Add the new slick-theme.css if you want the default styling -->
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.5.5/slick-theme.min.css">
    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Open+Sans">
    <link rel="stylesheet" type="text/css" href="/ShoppingCart/css/shopping-kart.css">
</head>
<body>
<div class="header">
  	<div class="container topbar">
  		<a href="Shoppingkart.jsp"><img src="/ShoppingCart/images/e-shop.png" height="80px"></a>
  		<span id="site-title">Shopping Bee</span>
          <div id="cart">
          	  <span id="welcome"><a>Hello ${username}</a></span>
              <span id="signin"><a href="/ShoppingCart/user.do">Sign In</a></span>
              <span><a href="cart.jsp">MyCart</a></span>
              <span id="logout"><a href="/ShoppingCart/logout.do">LogOut</a></span>
          </div>
  	</div>
    <div class = "container navmenu">
        <ul class="main-navbar nav nav-pills nav-justified" id="pills-first">
              <li role="presentation" class="active"><a href="Shoppingkart.jsp">Home</a></li>
              <li role="presentation"><a href="electronics.jsp">Electronics</a></li>
              <li role="presentation"><a href="books.jsp">Books</a></li>
              <li role="presentation"><a href="clothing.jsp">Clothing</a></li>
              <li role="presentation"><a href="footware.jsp">Footware</a></li>
            </ul>
    </div>
  </div>
    <div class="container" style="width:100%">
        <div class="row sb-content">
            <!-- Filter list-->
            <div class="col-xs-2">
                
            </div>
            <div class="col-xs-8 sb-main-content">
                  <div class="deal content-tab">
                      <h2>Deal of the day</h2>
                      <div class="deal-carousel">
                      </div>
                  </div>
                  <div class="electronics content-tab">
                      <h2>Electronics</h2>
                      <div class="electronics-carousel">
                      </div>
                  </div>
                  <div class="clothing content-tab">
                      <h2>Clothing</h2>
                      <div class="clothing-carousel">
                      </div>
                  </div>
                  <div class="books content-tab">
                      <h2>Books</h2>
                      <div class="books-carousel">
                      </div>
                  </div>
                  <div class="footware content-tab">
                      <h2>Footware</h2>
                      <div class="footware-carousel">
                      </div>
                  </div>
            </div>
        </div>
    </div>
    <script src="/ShoppingCart/js/jquery.min.js"></script>
    <script src="/ShoppingCart/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.5.5/slick.min.js"></script>
    <script type="text/javascript" src="/ShoppingCart/js/shopping-bee.js"></script>
</body>
</html>