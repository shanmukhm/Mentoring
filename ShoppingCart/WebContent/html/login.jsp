<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
<link rel="stylesheet" type="text/css" href="css/shopping-kart.css">
</head>
<body>
<%
	if(session.getAttribute("username") != null){
		response.sendRedirect("Shoppingkart.jsp");
	}
	model.User command = new model.User();
%>
<div class="header">
  	<div class="container topbar">
  		<a href="/ShoppingCart/html/Shoppingkart.jsp"><img src="images/e-shop.png" height="80px"></a>
  		<span id="site-title">Shopping Bee</span>
         
  	</div>
  	 <div class = "container-fluid categories">
        <ul class="main-navbar nav nav-pills nav-justified" id="pills-first">
              <li role="presentation"><a href="/ShoppingCart/html/Shoppingkart.jsp">Home</a></li>
              <li role="presentation"><a href="/ShoppingCart/html/electronics.jsp">Electronics</a></li>
              <li role="presentation"><a href="/ShoppingCart/html/books.jsp">Books</a></li>
              <li role="presentation"><a href="/ShoppingCart/html/clothing.jsp">Clothing</a></li>
              <li role="presentation"><a href="/ShoppingCart/html/footware.jsp">Footware</a></li>
            </ul>
    </div>
  </div>
<div class="container login-container">
<div class="row">
	<div class="col-sm-6">
	    <div><p class="text-primary imp-text">Login</p></div>
		<form:form method="POST" action="/ShoppingCart/login.do">
	  		<div class="form-group">
	    	<form:input path="username" class="form-control login-input" id="name" name="name" placeholder="Username" required="required"/>
	  	</div>
	  		<div class="form-group">
	    	<form:input path="password" type="password" class="form-control login-input" id="pwd" name="password" placeholder="Password" required="required"/>
	  	</div>
	  		<div class="checkbox">
	    	<label><input type="checkbox"> Remember me</label>
	  	</div>
	  <div><p class="text-danger">${error}</p></div>
	  <button type="submit" class="btn btn-default">Login</button>
	</form:form>
	</div>
	<div class="col-sm-6" id="register">
		 <div><p class="text-primary imp-text">Register</p></div>
		 <form:form method="POST" action="/ShoppingCart/register.do">
		 	<div class="form-group">
	    	<form:input path="username" class="form-control login-input" id="name" name="name" placeholder="Username" required="required"/>
	    	<span class="error" id="error-name">This field can not be empty</span>
	  		</div>
	  		<div class="form-group">
	    	<form:input path="mobile" type="number" class="form-control login-input" id="mobile" name="mobile" placeholder="Mobile number" required="required"/>
	  		<span class="error" id="error-mobile">This field can not be empty</span>
	  		<span class="error" id="error2-mobile">Should be 10 numbers</span>
	  		</div>
	  		<div class="form-group">
	  		<br>
	  		<label for="male">Male</label>
	    	<form:radiobutton path="gender" id="male" name="gender" value="male" required="required"/>
	    	<label for="female">Female</label>
	    	<form:radiobutton path="gender" id="female" name="gender" value="female" required="required"/>
	  		</div>
	  		<div class="form-group">
	    	<form:input path="password" type="password" class="form-control login-input" id="pwd" name="password" placeholder="Password" required="required"/>
	  		<span class="error" id="error-pwd">This field can not be empty</span>
	  		</div>
	  		<div class="checkbox">
	    	<label><input type="checkbox"> I accept the terms & conditions.</label>
	  		</div>
	  		<div class="form-group">
	  		<button type="submit" class="btn btn-default" id="submit">Register</button>
	  		</div>
		 </form:form>
	</div>
	</div>
</div>
<script type="text/javascript" src="/ShoppingCart/js//login.js"></script>
</body>
</html>