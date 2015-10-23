 $(document).ready(function(){
//    var itemsInCart = JSON.parse(localStorage.getItem("cart_item"));
	 $.ajax({
			url: "/ShoppingCart/isLoggedin.do", 
			async:false, 
			success: function(isLoggedin){
				console.log(isLoggedin.trim());
				if(isLoggedin.trim() === "yes"){
					
				}
				else{
					location.href="/ShoppingCart/user.do";
				}
			}
		});
	 $.ajax({
			url: "/ShoppingCart/SignInDisplay.do", 
			async:true, 
			success: function(isLoggedin){
				console.log(isLoggedin.trim());
				if(isLoggedin.trim() === "yes"){
					$("#signin").hide();
					$("#logout,#welcome").show();
				}
				else{
					$("#signin").show();
					$("#logout,#welcome").hide();
				}
			}
		});
	 $.ajax({
			url: "/ShoppingCart/getcart.do",
			success: function(itemsInCart){
						 if(itemsInCart.length == 0) {
					                    $(".cart-table").remove();
					                    $(".cart").append('<p class="text-center text-danger no-items">No Items in your cart.</p>');
					                }
						 console.log(itemsInCart);
						 var total = 0;
				        for(var i=0;i<itemsInCart.length;i++) {
				            var table = $('.cart-table')[0];
				            // var row = table.rows[1];
				            var subtotal = (itemsInCart[i]["delivery"] == 0.0 ? itemsInCart[i]["sellingPrice"]:itemsInCart[i]["sellingPrice"]+itemsInCart[i]["delivery"]) * itemsInCart[i]["quantity"];
				            var delivery = (itemsInCart[i]["delivery"] == 0.0 ? "Free": 'Rs.'+itemsInCart[i]["delivery"]);
				            total += subtotal;
				            $(table).append('<tr id="'+itemsInCart[i]["productId"]+'"><td class="product-thumb"><img src="'+itemsInCart[i]["imgsrc"]+'"></td>\
				                <td>'+itemsInCart[i]["name"]+'</td><td><input class="quantity-box" type="number" name="quantity" min = "0" value='+itemsInCart[i]["quantity"]+'></td><td>Rs.'+itemsInCart[i]["sellingPrice"]+'</td>\
				                <td>'+delivery+'</td><td>Rs.'+subtotal+'</td><td>\
				                <button class="btn btn-primary remove-button">Remove</button></td></tr>');
				        }
				        $(table).append('<tr><td></td><td></td><td></td><td></td><td><p class = "imp-text text-primary">Total </p></td><td>Rs.'+ total +'</td><td><button class="btn btn-primary">Buy</button></td></tr>');
				        
				        $('.remove-button').click(function(){
				            var id = $(this).parent().parent().attr('id');
				            console.log(id);
				 			$.ajax({
				 				url : "/ShoppingCart/deleteItem.do",
				 				data: {"id" : id},
				 				type : "POST",
				 				success: function(){
				 					console.log("success");
				 					location.reload();
				 				}
				 			});
				        });
				        $(".quantity-box").focusout(function(){
				        	var id = $(this).parent().parent().attr('id');
				        	var quantity = $(this).val();
				        	console.log(id + quantity);
				        	$.ajax({
				        		url:"/ShoppingCart/updateQuantity.do",
				        		type:"post",
				        		data:{"productId":id,"quantity":quantity},
				        		success: function(){
				        			location.reload();
				        		}
				        	});
				        });
			}
	 });
 });
 