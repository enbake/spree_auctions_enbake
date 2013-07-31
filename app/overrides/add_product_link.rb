Deface::Override.new(
    :virtual_path  => "spree/home/_slider",
    :replace => "h1.product-title",
    :text  => '<h1 class="product-title"><a href=<%= "/products/#{product.permalink}" %> style="color:white"> <%= product.name %></a></h1>',
    :name => "add_product_link")
