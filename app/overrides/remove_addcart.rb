Deface::Override.new(
    :virtual_path  => "spree/home/_slider",
    :replace => "div.product-order-form",
    :text  => '<div class="product-order-form">
              <%= form_for :order, :url => populate_orders_path do |f| %>
                <span class="product-price">
                  <%= product.display_price %>
                </span>
              <% end %>
            </div>',
    :name => "remove_addcart")
