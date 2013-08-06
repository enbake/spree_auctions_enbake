Deface::Override.new(
    :virtual_path  => "spree/checkout/edit",
    :replace => "div#checkout",
    :text  => '<div id="checkout">
  <h1>Checkout</h1>
  <%#= checkout_progress %>
  <br clear="left" />
  <%= render "spree/shared/error_messages", :target => @order %>
  <%#= hook :checkout_summary_box do %>
    <div id="checkout-summary">
      <%= render "spree/checkout/summary", :order => @order %>
    </div>
  <%# end %>

  <% if(@order.state == "Approved") %>
        <%= render("spree/checkout/paypal_checkout") if @order.payable_via_paypal?  %>
  <% else %>
      <%= form_for @order, :url => update_checkout_path(@order.state), :html => { :id => "checkout_form_#{@order.state}" } do |form| %>
        <%= render @order.state, :form => form %>
        <input id="post-final" type="submit" style="display:none"/>
      <% end %>
  <% end %>
</div>
',
    :name => "add_checkout_edit")
