Deface::Override.new(
    :virtual_path  => "spree/shared/_order_details",
    :replace => "tr#subtotal-row", 
    :text  => "<td colspan='4'><b><%= Spree.t(:subtotal) %>:</b></td>
      <td class='total'><span><%= Spree::Money.new(@order.display_total_bid_price, {currency: 'PLN'}) %></span></td>", 
    :name => "alter_subtotal_row")
