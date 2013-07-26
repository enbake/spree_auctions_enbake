Deface::Override.new(:virtual_path  => "spree/products/_cart_form", :replace => "div#product-price", :text  => '<div id="product_price">
          <h6 class="product_section_title"><%= Spree.t(:Minimum_Bid) %></h6>
          <div>
            <span class="price_selling" itemprop="price">
              <%= content_tag :span, "#{@product.variants.first.blank?}" == "true" ?  nil : (Spree::Money.new(@product.variants.first.bid_price, {currency: "PLN"})), :style => "font-weight:bold;font-size:25px;color:#00ADEE;", :id => "bd_pz"  %>
            </span>
            <span itemprop="priceCurrency" content="<%= @product.currency %>"></span>
          </div>
        </div>', :name => "show_bid")
