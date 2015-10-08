<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <title>Clothing</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
    <!-- Optional theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.5.5/slick.min.css">
    <!-- Add the new slick-theme.css if you want the default styling -->
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.5.5/slick-theme.min.css">
    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Open+Sans">
    <link rel="stylesheet" type="text/css" href="../css/shopping-kart.css">
</head>
<body>
    <div class="header">
        <div class="container topbar">
            <a href="Shoppingkart.jsp"><img src="../images/e-shop.png" height="80px"></a>
            <span id="site-title">Shopping Bee</span>
              <div id="cart">
              	  <span id="welcome"><a>Hello ${username}</a></span>
                  <span id = "signin"><a href="login.jsp">Sign In</a></span>
                  <span><a href="cart.jsp">MyCart</a></span>
                  <span id="logout"><a href="../logout">LogOut</a></span>
              </div>
        </div>
        <div class = "container-fluid">
            <ul class="main-navbar nav nav-pills nav-justified" id="pills-first">
              <li role="presentation"><a href="Shoppingkart.jsp">Home</a></li>
              <li role="presentation"><a href="electronics.jsp">Electronics</a></li>
              <li role="presentation"><a href="books.jsp">Books</a></li>
              <li role="presentation"  class="active"><a href="clothing.jsp">Clothing</a></li>
              <li role="presentation"><a href="footware.jsp">Footware</a></li>
            </ul>
        </div>
    </div>
    <div class="container" style="width:100%">
        <div class="row sb-content">
            <!-- Filter list-->
            <div class="col-xs-2 filters">
                <ul class="list-group filter-gender">
                  <li class="list-group-item"><h4>Gender</h4></li>
                  <li class="list-group-item"><input type='checkbox' name="gender" value='men'> Men</li>
                  <li class="list-group-item"><input type='checkbox' name="gender" value='women'> Women</li>
                  <li class="list-group-item"><input type='checkbox' name="gender" value='kids'> Kids</li>
                </ul>
                <ul class="list-group filter-price">
                  <li class="list-group-item"><h4>Price</h4></li>
                  <li class="list-group-item"><input type='checkbox' name="price" value='0-499'> 0-499</li>
                  <li class="list-group-item"><input type='checkbox' name="price" value='500-999'> 500-999</li>
                  <li class="list-group-item"><input type='checkbox' name="price" value='1000-2999'> 1000-2999</li>
                  <li class="list-group-item"><input type='checkbox' name="price" value='>3000'> Over 3000</li>
                </ul>
            </div>
            <div class="col-xs-8 sb-main-content">
      
              <div class="row clothing-catalog">

              </div>
          </div>
        </div>
    </div>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.5.5/slick.min.js"></script>
    <script type="text/javascript" src="../js/shopping-bee.js"></script>
    <script type="text/javascript">
       //Adding filters to the pages
        
        $(".filters li > input").change(function(){
          var cat_list_gender = [];
          $('.filter-gender input:checked').each(function(){
            cat_list_gender.push($(this).val());
          });
          var cat_list_price = [];
          $('.filter-price input:checked').each(function(){
            cat_list_price.push($(this).val());
          });
          if(cat_list_gender.length == 0){
            $('.filter-gender input').each(function(){
              cat_list_gender.push($(this).val());
            });
          }
          if(cat_list_price.length == 0){
            $('.filter-price input').each(function(){
              cat_list_price.push($(this).val());
            });
          }
          $('.catalog-item').each(function(){
            var categories = $(this).attr('data-filters').split(':');
            var gender_match = $.grep(cat_list_gender,function(val){
              return $.inArray(val, categories) > -1;
            });
            var price_match = $.grep(cat_list_price,function(val){
              return $.inArray(val, categories) > -1;
            });
            if(gender_match.length!==0 && price_match.length!==0){
              $(this).show();
                }
            else{
              $(this).hide();
            }
          });
        });
    </script>
</body>
</html>