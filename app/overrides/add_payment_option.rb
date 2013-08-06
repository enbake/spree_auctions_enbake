Deface::Override.new(
    :virtual_path  => "spree/shared/_main_nav_bar",
    :insert_after => "li#shop-link",
    :text  => '<% if spree_current_user %><li><a title="My Payment" href="/payment">Payment</a></li><%end%>',
    :name => "add_payment_option")
