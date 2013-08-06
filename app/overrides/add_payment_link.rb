Deface::Override.new(
    :virtual_path  => "spree/users/payment",
    :insert_after => "td.order-total",
    :text  => '<% if order.state == "Approved" && order.payment_state == "balance_due" %><td class="order-payment"><a href="/payment_options?state=approved&order_id=<%=order.id%>">Click</a></td><% end %>',
    :name => "add_payment_link")
