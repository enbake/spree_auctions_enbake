//= require store/spree_frontend

$(document).ready(function(){
	$('#add-to-cart-button').attr('disabled', true)
})

$(document).on('blur', '#bid_price', function(){
	var min_bid = $('#bd_pz').text().slice(2)
	var user_bid = $(this).val().trim()
	if((parseFloat(user_bid) > parseFloat(min_bid)) && user_bid != ""){
		$('#add-to-cart-button').attr('disabled', false);
	}else{
		$( "#dialog" ).dialog();
		$('#add-to-cart-button').attr('disabled', true);
	}
})

$(document).on('click', '.ui-button', function(){
	$('#add-to-cart-button').attr('disabled', true);
})

$(document).on('click', '#add-to-cart-button', function(){
	if($('#bid_price').val()==""){
		$('#add-to-cart-button').attr('disabled', true);
	}
})