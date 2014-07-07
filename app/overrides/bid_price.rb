Deface::Override.new(
    :virtual_path  => "spree/products/_cart_form",
    :replace => "div.add-to-cart", 
    :text  => '<div class="add-to-cart"><%#= number_field_tag (@product.variants_and_option_values.any? ? :quantity : "variants[#{@product.master.id}]"),
            1, :class => "title", :min => 1 %>
          <%= button_tag :class => "btn btn-primary",:disabled => false, :id => "add-to-cart-button", :type => :submit do %>
            <%= Spree.t(:place_bid) %>
          <% end %></div>
          <div id="dialog" title="Warning" style="display:none">
            <p>Your bid must be greater than the Minimun Bid</p>
         </div>
         <div id="biddialog" title="Warning" style="display:none">
            <p>Your bid must be greater than the Last Bid</p>
         </div>', 
    :name => "bid_price")
