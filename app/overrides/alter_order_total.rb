Deface::Override.new(
    :virtual_path  => "spree/checkout/_summary",
    :replace => "[data-hook='order_total']", 
    :text  => "<tr data-hook= 'ordertotal'>
      <td><strong><%= Spree.t(:order_total) %>:</strong></td>
      <td><strong><span id='summary-order-total'><%= Spree::Money.new(@order.display_total_bid_price, {currency: 'PLN'}) %></span></strong></td>
    </tr>", 
    :name => "alter_order_total")
