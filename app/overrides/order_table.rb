Deface::Override.new(:virtual_path  => "spree/admin/orders/index",:insert_before => "[data-hook='admin_orders_index_row_actions']", :text  => "<td class='actions align-center' data-hook='admin_orders'>
          <%= link_to '',orders_confirmation_path(order), :no_text => true, :class => 'icon_link with-tip icon-envelope-alt no-text' if order.user_id%>
        </td>", :name => "order_table")
