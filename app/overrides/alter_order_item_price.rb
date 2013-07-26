Deface::Override.new(
    :virtual_path  => "spree/shared/_order_details",
    :replace => "[data-hook='order_item_price']", 
    :text  => "<td data-hook='order_item_price' class='price'><span><%= Spree::Money.new(item.bid_price, {currency: 'PLN'}) %></span></td>", 
    :name => "alter_order_item_price")
