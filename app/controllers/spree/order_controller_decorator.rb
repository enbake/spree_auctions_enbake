module Spree
  OrdersController.class_eval do
    def populate
      populator = Spree::OrderPopulator.new(current_order(true), current_currency)
      if populator.populate(params.slice(:products, :variants, :quantity))
        current_order.create_proposed_shipments if current_order.shipments.any?
        variant_id = params.has_key?(:variants) ? params[:variants].first[0].to_i : params[:products].first[1].to_i
        #bid_price = (params[:bid_price].to_f)*(params.has_key?(:quantity) ? params[:quantity].to_i : params[:variants].first[1].to_i)
        bid_price = (params[:bid_price].to_f)
        current_order.line_items.where(:variant_id => variant_id).first.update_attribute('bid_price',bid_price)

        fire_event('spree.cart.add')
        fire_event('spree.order.contents_changed')
        respond_with(@order) do |format|
          format.html { redirect_to cart_path }
        end
      else
        flash[:error] = populator.errors.full_messages.join(" ")
        redirect_to :back
      end

    def confirmation
    end
    end
  end
end
