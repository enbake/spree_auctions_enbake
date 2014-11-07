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
             <li class="lang-en "><a href="/en" hreflang="en" title="English" class="qtrans_flag qtrans_flag_en"><span style="display:none">English</span></a></li>
             <li class="lang-pl"><a href="/pl" hreflang="pt" title="Polish" class="qtrans_flag qtrans_flag_pl"><span style="display:none">Polish</span></a></li>
             </div >',
    :name => "header")

