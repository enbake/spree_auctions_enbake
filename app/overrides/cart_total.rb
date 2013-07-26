Deface::Override.new(:virtual_path  => "spree/orders/_line_item",:replace => "[data-hook='cart_item_total']", :text  => "<td class='cart-item-price' data-hook= 'c_i_t'>
    <%= content_tag :span, Spree::Money.new(line_item.quantity * line_item.bid_price, {currency: 'PLN'}), :style => 'font-weight:bold;font-size:21px;color:#00ADEE;' %>
  </td>", :name => "cart_total")
