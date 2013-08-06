Deface::Override.new(
    :virtual_path  => "spree/checkout/registration",
    :replace => "div#guest_checkout",
    :text  => '<div id="guest_checkout" data-hook class="columns omega eight"></div>',
    :name => "remove_guest_checkout")
