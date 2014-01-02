Deface::Override.new(:virtual_path  => "spree/products/_cart_form",:insert_before => "div.add-to-cart", 
:text  => '<%= label_tag "bid_price", Spree.t(:your_bid), :class => "product-section-title", :style => "font-weight:bold" %>
      <%= text_field_tag "bid_price", "", :class => "input-medium" %><%= hidden_field_tag "products", {@product.id => @variants[0].id}.to_json%><%=hidden_field_tag "quantity", "1"%>', 
:name => "enter_bid")