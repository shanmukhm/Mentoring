/** Login form validation
 * 
 */
$(document).ready(function(){
	$(".error").hide();
	$('#submit').prop('disabled', true);
	$("#register input").focusout(function(){
		var id = $(this).attr('id');
		var isValidated1 = false;
		if(id == "mobile"){
			if($(this).val().length == 0){
				$("#error-"+id).show();
				$("#error2-"+id).hide();
			}
			else if($(this).val().length != 10){
				$("#error-"+id).hide();
				$("#error2-"+id).show();
			}
			else {
				$("#error-"+id).hide();
				$("#error2-"+id).hide();
				isValidated1 = true;
			}
		}
		else {
			if($(this).val().length == 0)
				$("#error-"+id).show();
			else{
				$("#error-"+id).hide();
				isValidated1 = true;
			}
		}
		if(isValidated1)
			$('#submit').prop('disabled', false);
		else
			$('#submit').prop('disabled', true);
	});
	$("#name,#mobile").focusout(function(){
		var name = $('#name').val();
		var mobile = $('#mobile').val();
		var id = $(this).attr('id');
		$.ajax({
			url:"/ShoppingCart/checkUsers.do",
			type: "get",
			data: {"username":name,"mobile":mobile},
			success: function(response){
				if(response.trim() == "name"){
					$("#error-"+id).hide();
					$("#error3-mobile").hide();
					$("#error3-"+id).show();
				}
				else if(response.trim() == "mobile"){
					$("#error-"+id).hide();
					$("#error2-"+id).hide();
					$("#error3-name").hide();
					$("#error3-"+id).show();
				}
				else if(response.trim() == "both"){
					$("#error3-name").show();
					$("#error3-mobile").show();
				}
				else {
					$("#error3-name").hide();
					$("#error3-mobile").hide();
				}
			}
		});
	});
	$("#pwd2").keyup(function(){
		if($(this).val() != $("#pwd").val())
			$("#error2-pwd2").show();
		else
			$("#error2-pwd2").hide();
	});
});