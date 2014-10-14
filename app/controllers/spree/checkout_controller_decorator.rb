module Spree
  CheckoutController.class_eval do
    def update
      #object_params["bill_address_attributes"]["state_name"] = "teststate"
      if @order.update_attributes(object_params)
        if object_params.present?
          @order.user.ship_address_id = @order.ship_address_id
          @order.user.bill_address_id = @order.bill_address_id
          @order.user.save
        end
        @order.ship_address_id = @order.user.ship_address_id
        @order.bill_address_id = @order.user.bill_address_id
        @order.save

        fire_event('spree.checkout.update')

        unless @order.next
          flash[:error] = @order.errors[:base].join("\n")
          redirect_to checkout_state_path(@order.state) and return
        end
        if @order.completed?

            session[:order_id] = nil
            flash.notice = Spree.t(:your_bid_has_been_added_to_the_system)
            flash[:commerce_tracking] = "nothing special"
            redirect_to completion_route
        else
          redirect_to checkout_state_path(@order.state)
        end
      else
        render :edit
      end
    end
  end
end
