module Spree
  OrdersController.class_eval do

    def complete_order
      #if user not logged in store in session bid id and redirect to sign in page
      if !spree_current_user
        session[:winning_bid] = params[:id]
        redirect_to spree.login_path
        return
      end

      # if user logged inf find bids => id, user_id, status => pending_confirmation
      # verify product status != closed and bid for this product_id === user_id, bid.status => pending confirmation
      @bid = Spree::Bid.where(:id => params[:id], :user_id => spree_current_user.id, :status => 'pending_confirmation').first

      if @bid.present? && @bid.product.status != 'closed' && @bid.status == 'pending_confirmation'
        session[:test] = 1
        params = { "start_price"=>@bid.product.price.to_f, "bid_price"=>@bid.price,
                   "products"=>"{\"#{@bid.product_id}\":#{@bid.variant_id}}", "quantity"=>"1",
                   "action"=>"populate", "controller"=>"spree/orders",
                   "locale"=>"en"}

        if current_order.present?
          current_order.line_items.delete_all
        end
        populator = Spree::OrderPopulator.new(current_order(true), current_currency)

        if populator.populate(params.slice(:quantity,:products,:variants))
          current_order.create_proposed_shipments if current_order.shipments.any?
          variant_id = @bid.variant_id
          bid_price = @bid.price

          current_order.line_items.build({:variant_id => @bid.variant_id ,:price => @bid.price , :bid_price => @bid.price ,
                                          :currency=> current_currency,:quantity=> 1},:without_protection => true).save


          #current_order.line_items.where(:variant_id => @bid.variant_id).first.update_attribute('bid_price',@bid.price)
          #@order = current_order
          fire_event('spree.cart.add')
          fire_event('spree.order.contents_changed')

          respond_with(@order) do |format|
            format.html { redirect_to cart_path }
          end
        else
          flash[:error] = populator.errors.full_messages.join(" ")
          redirect_to products_path
        end
      else
        flash[:error]= "You are not authorized for this action"
        redirect_to products_path
      end
    end

    def process_order
      # if user is admin
         #find bid with id
      #else
      if !spree_current_user
          flash[:error]= "You are not authorize for this action"
          redirect_to root_path
          debugger
          return
      else
         if !spree_current_user.admin?
           flash[:error] = "You are not authorize for this action"
           redirect_to root_path
           debugger
           return
         end
      end
      @bid = Spree::Bid.find params[:id]

      if @bid.present? && @bid.product.status != 'closed' && @bid.status == 'pending_confirmation'
        params = { "start_price"=>@bid.product.price.to_f, "bid_price"=>@bid.price,
                   "products"=>"{\"#{@bid.product_id}\":#{@bid.variant_id}}", "quantity"=>"1",
                   "action"=>"populate", "controller"=>"spree/orders",
                   "locale"=>"en"}

        if current_order.present?
          current_order.line_items.delete_all
        end
        populator = Spree::OrderPopulator.new(current_order(true), current_currency)

        if populator.populate(params.slice(:quantity,:products,:variants))
          current_order.create_proposed_shipments if current_order.shipments.any?
          variant_id = @bid.variant_id
          bid_price = @bid.price

          current_order.line_items.build({:variant_id => @bid.variant_id ,:price => @bid.price , :bid_price => @bid.price ,
                                          :currency=> current_currency,:quantity=> 1},:without_protection => true).save


          current_order.update_attributes({:state=> 'complete',:user_id=> @bid.user_id,:payment_total=>@bid.price.to_f,
                                         :payment_state=> 'complete',:email=>@bid.user.email,:completed_at=> Date.today},
                                         :without_protection => true)
          current_order.save
          @bid.update_attributes({:status => 'closed'},:without_protection => true)
          @bid.product.update_attributes({:status => 'closed',:confirmation_date=> Date.today,:order_id=>current_order.id},:without_protection => true)

          Spree::OrderMailer.confirm_email(current_order).deliver
          respond_with(@order) do |format|
            flash[:error] = "You have successfully completed the order"
            format.html { redirect_to admin_pendding_order_path }
          end
        else
          flash[:error] = populator.errors.full_messages.join(" ")
          redirect_to products_path
        end
      else
        flash[:error]= "You are not authorized for this action"
        redirect_to products_path
      end




    end



    def populate
      if current_order.present?
        current_order.line_items.delete_all
      end
      populator = Spree::OrderPopulator.new(current_order(true), current_currency)
      @prodval= JSON.parse params[:products]
      params.delete :products
      params.merge!(:products => @prodval)
      if populator.populate(params.slice(:quantity,:products,:variants))
        current_order.create_proposed_shipments if current_order.shipments.any?
        variant_id = params.has_key?(:variants) ? params[:variants].first[0].to_i : @prodval.first[1].to_i
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




    def paypal_payment
      @order = Spree::Order.find(params[:order_id])
      render "spree/checkout/edit"
    end
  end
end