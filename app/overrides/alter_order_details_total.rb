Deface::Override.new(
    :virtual_path  => "spree/shared/_order_details",
    :replace => "[data-hook='order_details_total']", 
    :text  => "<tfoot id='order-total' data-hook='order_details_total'>
    <tr class='total'>
      <td colspan='4'><b><%= Spree.t(:order_total) %>:</b></td>
      <td class='total'><span id='order_total'><%= Spree::Money.new(@order.display_total_bid_price, {currency: 'PLN'}) %></span></td>
    </tr>", 
    :name => "alter_order_details_total")
