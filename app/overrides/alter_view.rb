Deface::Override.new(:virtual_path  => "spree/admin/variants/_form",:replace => "[data-hook='price']", :text  => "<div class='field' data-hook='price'>
      <%= f.label :price, Spree.t(:bid_price) %>
      <%= f.text_field :price, :value => number_to_currency(@variant.price, :unit => ''), :class => 'fullwidth' %>
    </div>", :name => "alter_view")
