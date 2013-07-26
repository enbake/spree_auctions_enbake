//= require store/spree_frontend

$(document).ready(function(){
	$('#add-to-cart-button').attr('disabled', true)
	$(document).on('blur', '#bid_price', function(){
		if(parseInt($(this).val()) < parseInt($('#bd_pz').text().slice(2))){
			alert("your bid must be greater than the minimun bid");

		}
		else{
			$('#add-to-cart-button').attr('disabled', false);
		}
})
})
