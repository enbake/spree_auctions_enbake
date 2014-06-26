//= require store/spree_frontend

$('#add-to-cart-button').live('click', function(){
	min_bid = $("#price_field").val().trim()
    user_bid = $('#bid_price').val().trim()
	if((parseFloat(user_bid) < parseFloat(min_bid)) || user_bid == ""){
		$("#dialog").dialog({autoclose: false});
		return false;
	}
});

$(document).ready(function() {
	$(".is-company").click( function(){
		if ($(".is-company").is(":checked")){
			$(".company_fields").removeClass("hidden");
			$(".company_name").prop("disabled", false);
			$(".nip").prop("disabled", false);
		}
		else{
			$(".company_fields").addClass("hidden");
			$(".company_name").prop("disabled", true);
			$(".nip").prop("disabled", true);
		}
	});
});
