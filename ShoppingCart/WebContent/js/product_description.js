$(document).ready(function() {
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
        $('#addtocart').click(function(){
        	$.ajax({
        		url: "/ShoppingCart/addtocart.do", 
        		async:true,
        		type:"POST",
        		success: function(){
        			console.log("new");
        			window.location.href = "cart.jsp";
        		}
        	});
            
        });        
});
