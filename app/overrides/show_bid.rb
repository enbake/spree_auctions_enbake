Deface::Override.new(:virtual_path  => "spree/products/_cart_form", :replace => "div#product-price", :text  => '<div id="product-price">
          <h6><%= Spree.t(:minimum_bid) %></h6>
          <div>
            <h2 class="price selling" id="bd_pz" itemprop="price">
              <%= display_price(@product.master) %>
            </h2>
            <span itemprop="priceCurrency" content="<%= @product.currency %>"></span>
          </div>

          <% if @product.master.in_stock? %>
            <link itemprop="availability" href="http://schema.org/InStock" />
          <% end %> 
        </div>', :name => "show_bid")
