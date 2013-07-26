Deface::Override.new(:virtual_path  => "spree/admin/variants/_form",:insert_before => "[data-hook='price']", :text  => "<div class='field' data-hook='Bid Price'>
      <%= f.label :bid_price, Spree.t(:bid_price) %>
      <%= f.text_field :bid_price, :class => 'fullwidth' %>
    </div>", :name => "alter_view")
