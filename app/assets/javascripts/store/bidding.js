$('#add-to-cart-button').live('click', function(){
	var min_bid = $('#bd_pz').text().trim().slice(2).replace(',', "")
	var user_bid = $('#bid_price').val().trim()
	var next_bid = parseFloat($('#max-bid-price').attr('value'))
	var hike = parseFloat($('#min-bid-hike').attr('value'))
	if ($("#last_bid_present").attr("value") == "true"){
	  $("#biddialog p").html('Your bid must be greater than by '+hike+' from last bid')
	  }
	else{
	    $("#biddialog p").html('Your bid must be '+hike+' greater than the minimum bid ')
	  }
	if((parseFloat(user_bid) < parseFloat(min_bid)) || user_bid == ""){
		$("#dialog").dialog({autoclose: false}).prev(".ui-dialog-titlebar").css("background","rgb(232,77,28)");
		return false;
	}
	else if((parseFloat(user_bid) < next_bid+hike)){
        $("#biddialog").dialog({autoclose: false}).prev(".ui-dialog-titlebar").css("background","rgb(232,77,28)");
        return false;
    }
})
