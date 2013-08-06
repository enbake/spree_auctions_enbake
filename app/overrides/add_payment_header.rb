Deface::Override.new(
    :virtual_path  => "spree/users/payment",
    :insert_after => "th.order-total",
    :text  => '<th class="order-payment">Payment</th>',
    :name => "add_payment_header")
