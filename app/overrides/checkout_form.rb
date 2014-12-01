Deface::Override.new(
   :virtual_path  => "spree/orders/_form",
   :replace => "table#cart-detail",
   :text => "<table>
  <tbody>
    <tr>
      <th class='checkout-image'>Image</th>
      <th class='checkout-description' style='padding-right: 0px;padding-left: 20px;'>Description</th>
      <th class='checkout-price'>Total Price</th>
    </tr>
 
    <%= render :partial => 'line_item', :locals => { :variant => @order.line_items.first.variant, :line_item => @order.line_items.first, :item_form => @order.line_items.first } %>
  </tbody>
  <%= render 'spree/orders/adjustments' unless @order.adjustments.eligible.blank? %> </table>",
  :name => "checkout_form")

