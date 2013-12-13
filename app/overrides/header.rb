Deface::Override.new(
    :virtual_path  => "spree/shared/_main_nav_bar",
    :replace => "div.nav-collapse",
    :text => '<div class="nav-collapse collapse ">
             <%= link_to "AuctionHouse", spree.root_path, :class => "brand" %>
             <ul class="nav pull-right ">
            <li><%= link_to Spree.t(:home), spree.root_path %></li>"
            <li><%= link_to Spree.t(:Catalog),"#"%></li>"
            <li><%= link_to Spree.t(:Best_Offer), "#" %></li>"
            <li><%= link_to Spree.t(:About_us), "#" %></li>"
            <li><%= link_to Spree.t(:Contact), "#" %></li>"
            <li><%= link_to Spree.t(:Signup), new_spree_user_registration_path if session[:flash].blank? %></li>"
            <li><%= link_to Spree.t(:sign_in), spree_user_session_path if session[:flash].blank? %></li>"
            <li><%= link_to Spree.t(:sign_out), destroy_spree_user_session_path unless session[:flash].blank? %></li>"
            </div >',

    :name => "header")
