Deface::Override.new(
    :virtual_path  => "spree/products/_cart_form",
    :remove => "div#product-variants",
    :name => "cart_view")