Deface::Override.new(
    :virtual_path  => "spree/checkout/_summary",
    :replace => "[data-hook='item_total']", 
    :text  => "<tr data-hook= 'item_total'>
    <td><strong><%= Spree.t(:item_total) %>:</strong></td>
    <td><strong><%= Spree::Money.new(@order.display_total_bid_price, {currency: 'PLN'}) %></strong></td>
    </tr>", 
    :name => "alter_item_total")
