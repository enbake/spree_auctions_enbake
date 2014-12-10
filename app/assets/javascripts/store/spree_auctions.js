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
