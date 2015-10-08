<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login here</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="../css/shopping-kart.css">
</head>
<body>
<%
	if(session.getAttribute("username") != null){
		response.sendRedirect("Shoppingkart.jsp");
	}
%>
<div class="header">
  	<div class="container topbar">
  		<a href="Shoppingkart.jsp"><img src="../images/e-shop.png" height="80px"></a>
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
<div class="container">
    <div><p class="text-primary imp-text">Enter your login details.</p></div>
	<form role="form" action="../login" method="post">
  <div class="form-group">
    <label for="name">User Name:</label>
    <input type="name" class="form-control login-input" id="name" name="name">
  </div>
  <div class="form-group">
    <label for="password">Password:</label>
    <input type="password" class="form-control login-input" id="pwd" name="password">
  </div>
  <div class="checkbox">
    <label><input type="checkbox"> Remember me</label>
  </div>
  <div><p class="text-danger">${error}</p></div>
  <button type="submit" class="btn btn-default">Submit</button>
</form>
</div>
</body>
</html>