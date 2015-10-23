<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <title>Electronics</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
    <!-- Optional theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
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
              <li role="presentation"><a href="Shoppingkart.jsp">Home</a></li>
              <li role="presentation" class="active"><a href="electronics.jsp">Electronics</a></li>
              <li role="presentation" ><a href="books.jsp">Books</a></li>
              <li role="presentation"><a href="clothing.jsp">Clothing</a></li>
              <li role="presentation"><a href="footware.jsp">Footware</a></li>
            </ul>
        </div>
    </div>
    <div class="container" style="width:100%">
        <div class="row sb-content">
            <!-- Filter list-->
            <div class="col-xs-2 filters">
                <ul class="list-group filter-type">
                  <li class="list-group-item"><h4>Type</h4></li>
                  <li class="list-group-item"><input type='checkbox' name="type" value='mobile'> Mobile</li>
                  <li class="list-group-item"><input type='checkbox' name="type" value='tablet'> Tablet</li>
                  <li class="list-group-item"><input type='checkbox' name="type" value='laptop'> Laptop</li>
                </ul>
                <ul class="list-group filter-price">
                  <li class="list-group-item"><h4>Price</h4></li>
                  <li class="list-group-item"><input type='checkbox' name="price" value='0-5000'> 0-5000</li>
                  <li class="list-group-item"><input type='checkbox' name="price" value='5000-10000'> 5000-10000</li>
                  <li class="list-group-item"><input type='checkbox' name="price" value='10000-20000'> 10000-20000</li>
                  <li class="list-group-item"><input type='checkbox' name="price" value='>20000'> Above 20000</li>
                </ul>
            </div>
            <div class="col-xs-8 sb-main-content">                         
              <div class="row electronics-catalog">

              </div>
          </div>
        </div>
    </div>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.5.5/slick.min.js"></script>
    <script type="text/javascript" src="/ShoppingCart/js/shopping-bee.js"></script>
    <script type="text/javascript">
       //Adding filters to the pages
       var toAppend = '';
       $.ajax({
		url:'/ShoppingCart/fetchproduct.do',
		async : true,
		data : {"category" : "electronics"},
		success: function(electronics) {
			console.log(electronics);
						for(var i=0; i < electronics.length; i++) {
							toAppend += '<div class="col-xs-12 col-sm-4 col-md-4"><div class="catalog-item text-center" data-filters="'+electronics[i]["type"]+':'+electronics[i]["pricerange"]+':'+electronics[i]["brand"]+'" id="'+electronics[i]["productId"]+'"><a href="../ProductDescription.do?category=electronics&id='+electronics[i]["productId"]+'"><figure><img src ="'+electronics[i]["imgsrc"]+'"/><figcaption><strong>'+electronics[i]["name"]+'</strong></figcaption><div class="product-price">\
					                        <p class="text-primary"><del style="color:red">Rs.'+electronics[i]["mrp"]+'</del> Rs.'+electronics[i]["sellingPrice"]+'</p></div></figure></a></div></div>';
					                        
						}
						$(".electronics-catalog").append(toAppend);    
			}
});
        
        $(".filters li > input").change(function(){
          var cat_list_type = [];
          $('.filter-type input:checked').each(function(){
            cat_list_type.push($(this).val());
          });
          var cat_list_price = [];
          $('.filter-price input:checked').each(function(){
            cat_list_price.push($(this).val());
          });
          if(cat_list_type.length == 0){
            $('.filter-type input').each(function(){
              cat_list_type.push($(this).val());
            });
          }
          if(cat_list_price.length == 0){
            $('.filter-price input').each(function(){
              cat_list_price.push($(this).val());
            });
          }
          $('.catalog-item').each(function(){
            var categories = $(this).attr('data-filters').split(':');
            var type_match = $.grep(cat_list_type,function(val){
              return $.inArray(val, categories) > -1;
            });
            var price_match = $.grep(cat_list_price,function(val){
              return $.inArray(val, categories) > -1;
            });
            if(type_match.length!==0 && price_match.length!==0){
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