module Spree
  CheckoutController.class_eval do
    def update
      if @order.update_attributes(object_params)
        fire_event('spree.checkout.update')

        unless @order.next
          flash[:error] = @order.errors[:base].join("\n")
          redirect_to checkout_state_path(@order.state) and return
        end
        if @order.completed?
          if !spree_current_user.credit_card.nil? || spree_current_user.can_bid
            session[:order_id] = nil
            flash.notice = Spree.t(:your_bid_has_been_added_to_the_system)
            flash[:commerce_tracking] = "nothing special"
            redirect_to completion_route
          else
            redirect_to add_credit_card_path
          end
        else
          redirect_to checkout_state_path(@order.state)
        end
      else
        render :edit
      end
    end
  end
end
