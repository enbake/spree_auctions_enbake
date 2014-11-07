Deface::Override.new(
    :virtual_path  => "spree/shared/_main_nav_bar",
    :replace => "div.nav-collapse",
    :text => '<div class="nav-collapse collapse ">
             <%= link_to "AuctionHouse", spree.root_path, :class => "brand" %>
             <ul class="nav pull-right ">
               <%Spree::Navigation.order("position").each do |nav|%>
                <% unless ((nav.url == "/auctions" or nav.url == "/payment" or nav.url == "/profile") and !spree_current_user) %>
                  <li><%= link_to nav.name, nav.url %></li> 
                <%end%>
              <%end%>
             <li><%= link_to Spree.t(:sign_up), new_spree_user_registration_path unless spree_current_user %></li>"
             <li><%= link_to Spree.t(:sign_in), spree_user_session_path unless spree_current_user %></li>"
             <li><%= link_to Spree.t(:sign_out), destroy_spree_user_session_path if spree_current_user %></li>"
             <li> <%= link_to image_tag("us.png"), locale: "en"  %></li>
             <li><%= link_to image_tag("pl.png"), locale: "pl" %>/li>
             </div >',
    :name => "header")

