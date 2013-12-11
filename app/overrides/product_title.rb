Deface::Override.new(
   :virtual_path  => "spree/products/show",
   :replace => "div#blog_post",
   :text => "<div id='blog_post'>
            <div class='container' data-hook='product_show' itemscope itemtype='http://schema.org/Product'>
            <% @body_id = 'product-details' %>
            <div class='section_header' style='margin-bottom:0px !important;margin-left:32px'>
       <!--      <h3 style='float:right;margin-top:50px;'><%= accurate_title %></h3> -->
  
            <div>
                 <div class ='span2' style = 'margin-top:6px;display:inline-block;margin-left:-1px'> <%= link_to 'Back_to_catalog', spree.root_path ,:class =>'btn',:style => 'width:145px'%></div>
              <ul class='breadcrumb' style='display:inline-block;margin-left:33px'>
               <li>
                 <a href= '/'>Home</a> <span class='divider'>></span>
               </li>
               <li>
                 <a href='#'>Catalog</a> <span class='divider'>></span>
               </li>
               <li>
                 <a href='#'>Xyz</a> <span class='divider'>></span>
               </li>
               <li class = 'active'><%= accurate_title%></li>
                 </ul>
            </div>
             </div>
            <div class='span2' style='border:2px solid black;min-height:380px'>
              <h5>Categories</h5>
              <hr style='border-color:black'>
            <ul style='list-style:none'>
               <li>Painting</li>
               <li>Sculpture</li>
               <li>Bronzes</li>
               <li>Coins</li>
               <li>Furniture</li>
               <li>Silver</li>
               <li>Lorem</li>
               <li>Ipsum</li>
               <li>Dolor</li>
               <li>Sir</li>
               <li>Amet</li>
            </ul>
            </div>
             <div class='row'><div class='span7' data-hook='product_left_part'>
               <div data-hook='product_left_part_wrap'>
                 <div id='product-images' data-hook='product_images'>
                  <div id='main-image' data-hook >
                  <%= link_to((@product.images.first.attachment.url))%>
                   <%= render :partial => 'image' %>
                  </div>
                  <div id='thumbnails' data-hook>
                   <%= render :partial => 'thumbnails' %>
                  </div>
                 </div>
                <div id='product-description' data-hook='product_description' style= 'margin-top:30px;width:660px'>
                  <div itemprop='description' data-hook='description'>
                   <%= product_description(@product) rescue Spree.t(:product_has_no_description) %>
                </div>
               </div>
             </div>
             </div>
             
             
             <div class='span3' style='min-height:231px;float:right;margin-top:-321px'>
              <h3><%= accurate_title %></h3>
              <div id='cart-form' data-hook='cart_form' style = 'border-bottom:2px solid black;margin-bottom:38px;min-height:371px'>
               <%= render :partial => 'cart_form' %>
              </div>
              <div style ='border:2px solid black' >
              <h5>FAQ</h5>
              <hr style='border-color:black'>
              <ul style='list-style:none'>
               <li>Where can i see the product?</li>
               <li>How to bid an auctions</li>
               <li>Is it safe</li>
               <li>Lurem ipsum dolor</li>
               <li>Non om</li>
             </ul>
             </div>
            </div>
            
             </div>
             </div>",
   :name => "product_title")