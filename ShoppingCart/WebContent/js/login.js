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
});