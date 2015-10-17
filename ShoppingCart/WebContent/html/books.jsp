<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <title>Books</title>
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
                  <span id="signin"><a href="login.jsp">Sign In</a></span>
                  <span><a href="cart.jsp">MyCart</a></span>
                  <span id="logout"><a href="../logout">LogOut</a></span>
              </div>
        </div>
        <div class = "container-fluid">
            <ul class="main-navbar nav nav-pills nav-justified" id="pills-first">
              <li role="presentation"><a href="Shoppingkart.jsp">Home</a></li>
              <li role="presentation"><a href="electronics.jsp">Electronics</a></li>
              <li role="presentation" class="active"><a href="books.jsp">Books</a></li>
              <li role="presentation"><a href="clothing.jsp">Clothing</a></li>
              <li role="presentation"><a href="footware.jsp">Footware</a></li>
            </ul>
        </div>
    </div>
    <div class="container" style="width:100%">
        <div class="row sb-content">
            <!-- Filter list-->
            <div class="col-xs-2 filters">
                <ul class="list-group filter-language">
                  <li class="list-group-item"><h4>Language</h4></li>
                  <li class="list-group-item"><input type='checkbox' name="language" value='english'> English</li>
                  <li class="list-group-item"><input type='checkbox' name="language" value='hindi'> Hindi</li>
                  <li class="list-group-item"><input type='checkbox' name="language" value='telugu'> Telugu</li>
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
             
              <div class="row books-catalog">

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
       var toAppend = '';
       $.ajax({
		url:'../fetchproduct.do',
		async : true,
		data : {"category" : "books"},
		success: function(books) {
			console.log(books);
						for(var i=0; i < books.length; i++) {
							toAppend += '<div class="col-xs-12 col-sm-4 col-md-4"><div class="catalog-item text-center" data-filters="'+books[i]["language"]+':'+books[i]["pricerange"]+'" id="'+books[i]["productId"]+'"><a href="../ProductDescription?category=books&id='+books[i]["productId"]+'"><figure><img src ="'+books[i]["imgsrc"]+'"/><figcaption><strong>'+books[i]["name"]+'</strong></figcaption><div class="product-price">\
	                        <p class="text-primary"><del style="color:red">Rs.'+books[i]["mrp"]+'</del> Rs.'+books[i]["sellingPrice"]+'</p></div></figure></a></div></div>';
		}
						$(".books-catalog").append(toAppend);    
			}
});
        
        $(".filters li > input").change(function(){
          var cat_list_language = [];
          $('.filter-language input:checked').each(function(){
            cat_list_language.push($(this).val());
          });
          var cat_list_price = [];
          $('.filter-price input:checked').each(function(){
            cat_list_price.push($(this).val());
          });
          if(cat_list_price.length == 0){
            $('.filter-price input').each(function(){
              cat_list_price.push($(this).val());
            });
          }
          if(cat_list_language.length == 0){
            $('.filter-language input').each(function(){
              cat_list_language.push($(this).val());
            });
          }
          $('.catalog-item').each(function(){
            var categories = $(this).attr('data-filters').split(':');
            var price_match = $.grep(cat_list_price,function(val){
              return $.inArray(val, categories) > -1;
            });
            var language_match = $.grep(cat_list_language,function(val){
              return $.inArray(val, categories) > -1;
            });
            if(price_match.length!==0 && language_match.length!==0){
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