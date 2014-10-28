module Spree
  OrdersController.class_eval do
    def popuate
      @prodval= JSON.parse params[:products]
      variant_id = @prodval.first[1].to_i
      unless spree_current_user
        session['bid'] = Bid.new(:price => params[:bid_price], :variant_id =>  variant_id )
        redirect_to spree.login_path
        return
      end
      if current_order.present?
        current_order.line_items.delete_all
      end
      @bid = Bid.find_or_initialize_by_variant_id_and_user_id(variant_id, spree_current_user.id)
      @bid.price = params[:bid_price]
      if @bid.save
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