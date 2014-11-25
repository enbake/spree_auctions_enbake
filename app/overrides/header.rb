Deface::Override.new(
    :virtual_path  => "spree/shared/_main_nav_bar",
    :replace => "div.nav-override",
    :text => ' <div class="header-navigation">
      <ul>
         <%Spree::Navigation.order("position").each do |nav|%>
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" data-target="#" href="<%=nav.url%>">
           <%= nav.name%>
          </a>
        </li>
        <%end%>
      </ul>
    </div>',
    :name => "header")

   