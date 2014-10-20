module Spree
  OrdersController.class_eval do
    def populate
      if current_order.present?
        current_order.line_items.delete_all
      end
      @prodval= JSON.parse params[:products]
      variant_id = @prodval.first[1].to_i

      bid = Bid.new(:price => params[:bid_price], :variant_id =>  variant_id, :user_id => spree_current_user.id )

      if bid.save
        respond_to do |format|
          flash[:success] = "Your Bid placed successfully."
          format.html { redirect_to products_path }
        end
      else
        flash[:error] = "Error in Bid place."
        redirect_to :back
      end
      def confirmation
      end
    end

    def paypal_payment
      @order = Spree::Order.find(params[:order_id])
      render "spree/checkout/edit"
    end
  end
end