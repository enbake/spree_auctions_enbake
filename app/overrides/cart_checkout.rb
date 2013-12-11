Deface::Override.new(
    :virtual_path  => "spree/orders/edit",
    :replace => "div.container",
    :text  => "<div class='container'>
       <% @body_id = 'cart' %>
  
        <h1><%= Spree.t(:shopping_cart) %></h1>
  
        <% if @order.line_items.empty? %>
  
    <div data-hook='empty_cart'>
      <p><%= Spree.t(:your_cart_is_empty) %></p>
      <p><%= link_to Spree.t(:continue_shopping), products_path, :class => 'button continue' %></p>
    </div>
  <% else %>
    <div data-hook='outside_cart_form'>
      <%= form_for @order, :url => update_cart_path, :html => {:id => 'update-cart'} do |order_form| %>
        <div data-hook='inside_cart_form'>
      
          <div data-hook='cart_items'>
            <%= render :partial => 'form', :locals => { :order_form => order_form } %>
          </div>
     
  

  
          
            <%= button_tag :class => 'button checkout primary', :id => 'checkout-link', :name => 'checkout' do %>
              <%= Spree.t(:checkout) %>
            <% end %>
        </div>
      <% end %>
    </div>
  
   
  
  <% end %>
</div>",
    :name => "cart_checkout")

