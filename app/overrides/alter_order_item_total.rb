Deface::Override.new(
    :virtual_path  => "spree/shared/_order_details",
    :replace => "[data-hook='order_item_total']", 
    :text  => "<td data-hook='order_item_total' class='total'><span><%= Spree::Money.new((item.bid_price*item.quantity), {currency: 'PLN'}) %></span></td>", 
    :name => "alter_order_item_total")
