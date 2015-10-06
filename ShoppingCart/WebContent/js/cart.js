 $(document).ready(function(){
    var itemsInCart = JSON.parse(localStorage.getItem("cart_item"));
    if(itemsInCart.length == 0) {
                    $(".cart-table").remove();
                    $(".cart").append('<p class="text-center text-danger no-items">No Items in your cart.</p>');
                }
        console.log(itemsInCart);
        for(var i=0;i<itemsInCart.length;i++) {
            var table = $('.cart-table')[0];
            // var row = table.rows[1];
            var subtotal = (itemsInCart[i]["delivery"] == "Free" ? itemsInCart[i]["selling_price"]:itemsInCart[i]["selling_price"]+itemsInCart[i]["delivery"]);
            var delivery = (itemsInCart[i]["delivery"] == "Free" ? "Free": 'Rs.'+itemsInCart[i]["delivery"]);
            $(table).append('<tr id="'+i+'"><td class="product-thumb"><img src="'+itemsInCart[i]["imgsrc"]+'"></td>\
                <td>'+itemsInCart[i]["name"]+'</td><td>1</td><td>Rs.'+itemsInCart[i]["selling_price"]+'</td>\
                <td>'+delivery+'</td><td>Rs.'+subtotal+'</td><td>\
                <button class="btn btn-primary remove-button">Remove</button></td></tr>');
        }
        $('.remove-button').click(function(){
             var temp = $(this).parent().parent().attr('id');
             for(var i=0;i<itemsInCart.length;i++) {
                if(temp == i) {
                    itemsInCart.splice(i,1);

                }
             }
             localStorage.setItem("cart_item",JSON.stringify(itemsInCart));
             location.reload();
        });
 });
 