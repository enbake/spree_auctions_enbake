Deface::Override.new(
    :virtual_path  => "spree/shared/_main_nav_bar",
    :replace => "div.nav-override",
    :text => ' <div class="header-navigation">
      <ul>
         <%Spree::Navigation.order("position").each do |nav|%>
        <li class="dropdown">
            <% unless ((nav.url == "/auctions" or nav.url == "/payment" or nav.url == "/profile") and !spree_current_user) %>
              <%= link_to nav.name, nav.url ,{ :class => "dropdown-toggle"}%>
            <%end%>
        </li>
        <%end%>
      </ul>
    </div>',
    :name => "header")

   

   # <a class="dropdown-toggle" data-toggle="dropdown" data-target="#" href="<%=nav.url%>">
   #         <%= nav.name%>
   #        </a>