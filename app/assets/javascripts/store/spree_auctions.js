//= require store/spree_frontend

$('#add-to-cart-button').live('click', function(){
	var min_bid = $('#bd_pz').text().trim().slice(2)
	var user_bid = $('#bid_price').val().trim()
	if((parseFloat(user_bid) <= parseFloat(min_bid)) || user_bid == ""){
		$("#dialog").dialog({autoclose: false});
		return false;
	}
})
