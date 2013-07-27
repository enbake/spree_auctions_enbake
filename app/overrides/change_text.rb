Deface::Override.new(
    :virtual_path  => "spree/checkout/_confirm",
    :replace => "[data-hook='buttons']", 
    :text  => "<%= submit_tag Spree.t(:place_bid), :class => 'continue button primary' %>
  <script>Spree.disableSaveOnClick();</script>", 
    :name => "change_text")
