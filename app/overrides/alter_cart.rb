Deface::Override.new(:virtual_path  => "spree/orders/_line_item",:replace => "[data-hook='cart_item_price']", :text  => "<td class='cart-item-price' data-hook= 'c_i_p'>
    <%= content_tag :span, Spree::Money.new(line_item.bid_price, {currency: 'PLN'}), :style => 'font-weight:bold;font-size:21px;color:#00ADEE;' %>
  </td>", :name => "alter_cart")
