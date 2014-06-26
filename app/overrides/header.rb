Deface::Override.new(
    :virtual_path  => "spree/shared/_main_nav_bar",
    :replace => "div.nav-collapse",
    :text => '<div class="nav-collapse collapse ">
             <%= link_to "AuctionHouse", spree.root_path, :class => "brand" %>
             <ul class="nav pull-right ">
            <li><%= link_to Spree.t(:home), spree.root_path %></li>"
            <li><%= link_to Spree.t(:Catalog),"/catalog"%></li>"
            <li><%= link_to Spree.t(:Best_Offer), "#" %></li>"
            <li><%= link_to Spree.t(:About_us), "#" %></li>"
            <li><%= link_to Spree.t(:Contact), "#" %></li>"
            <li><%= link_to Spree.t(:profile), "/profile" if spree_current_user %></li>"
            <li><%= link_to Spree.t(:auctions), "/auctions" if spree_current_user %></li>"
            <li><%= link_to Spree.t(:payment), "/payment" if spree_current_user %></li>"
            <li><%= link_to Spree.t(:Signup), new_spree_user_registration_path unless spree_current_user %></li>"
            <li><%= link_to Spree.t(:sign_in), spree_user_session_path unless spree_current_user %></li>"
            <li><%= link_to Spree.t(:sign_out), destroy_spree_user_session_path if spree_current_user %></li>"
            </div >',

    :name => "header")
