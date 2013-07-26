Deface::Override.new(
    :virtual_path  => "spree/orders/edit",
    :replace => "div#subtotal h5 span", 
    :text  => "<%= content_tag :span, Spree::Money.new(@order.display_total_bid_price, {currency: 'PLN'}) %>", 
    :name => "alter_cart")
