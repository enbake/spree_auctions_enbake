Deface::Override.new(
   :virtual_path  => "spree/products/show",
   :replace => "div#blog_post",
   :text => "
  <div id='blog_post'>
    <div class='container' data-hook='product_show' itemscope itemtype='http://schema.org/Product'>
      <% @body_id = 'product-details' %>

      <div class='row'>

        <div class='span2'>
          
          <%= link_to 'Do Katalogu', spree.root_path ,:class =>'btn btn-primary btn-block'%>
          <hr>
          <div class='sidebar' style='float: none;'>
            <div class='sidebar_header'><h4>Kategorie</h4></div>
            <ul class='sidebar_menu'>
              <% Spree::Category.all.each do |category| %>
                <li><%= link_to category.name, view_category_path(category) %></li>
              <% end %>
            </ul>
          </div>

        </div>


        <div class='span7' data-hook='product_left_part'>
          <div class='section_header'>
            <h3><%= accurate_title %></h3>
          </div>
          <div data-hook='product_left_part_wrap'>
            <div id='product-images' data-hook='product_images'>
              <div id='main-image' data-hook >
                <% unless @product.images.empty? %>
                  <%= render :partial => 'image' %>
                <% end %>
              </div>
              <div id='thumbnails' data-hook>
                <%= render :partial => 'thumbnails' %>
              </div>
            </div>
            <div id='product-description' data-hook='product_description'>
              <div itemprop='description' data-hook='description'>
                <p><%= product_description(@product) rescue Spree.t(:product_has_no_description) %></p>
              </div>
            </div>
              <div>
                <%= render :partial => 'fields' %>
              </div>
              <div>
                <%= render :partial => 'auction_history' %>
              </div>
          </div>
        </div>


        <div class='span3'>
          <div class='sidebar'>
            <div class='box'>
              <div id='cart-form' data-hook='cart_form'>
                <%= render :partial => 'cart_form' %>
              </div>
            </div>
            <div class='sidebar_header'><h4>FAQ</h4></div>
            <ul class='sidebar_menu'> 
              <% StaticPage.all.each_with_index do |sp, count|%>
                <li><%= link_to sp.title, admin_static_pages_path(anchor: 'static_question_' + (count+1).to_s)%></li>
              <% end %>
            </ul>
          </div>
        </div>

      </div>

    </div>
  </div>
    ",
   :name => "product_title")