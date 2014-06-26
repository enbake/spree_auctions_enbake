module Spree
  UsersController.class_eval do

    def send_email
      @order = Order.where(:number => params[:id]).first
      if params[:bid] == "accept"
        @order.update_attribute('state','Approved')
        UserMailer.contact_user(@order.user_id, @order).deliver
        redirect_to admin_order_payments_path(params[:id])
      else
        if @order.update_attribute('state','canceled')
          flash[:success] = Spree.t(:order_updated)
        else
          flash[:error] = Spree.t(:cannot_perform_operation)
        end
        redirect_to admin_path
        #redirect_to "/admin/orders/#{params[:id]}/fire?e=cancel"
      end
    end

    def accept_reject_bid
    end

    def payment
      @user ||= spree_current_user
      @orders = @user.orders.complete.order('completed_at desc')
      @orders = @orders.where(:state => "Approved" ,:payment_state => "balance_due")
    end

    
    def update
      if @user.update_attributes(params[:user])
        if params[:user][:password].present?
          # this logic needed b/c devise wants to log us out after password changes
          user = Spree::User.reset_password_by_token(params[:user])
          sign_in(@user, :bypass => true)
        end
        redirect_to "/profile", :notice => Spree.t(:account_updated)
      else
        redirect_to "/profile", :notice => @user.errors.full_messages.join(", ")
      end
    end

    def profile
      @user ||= spree_current_user
      unless @user.user_address
        @user.build_user_address
      end
    end

    def auctions
      @orders =  Spree::Order.joins(line_items: [variant: [:product]]).where("available_on <= ? and auction_end > ? and state not IN (?) and user_id = ? ", Date.today, Date.today, ["cart", "confirm"], spree_current_user.id).order("created_at Desc")
      @order_history = Spree::Order.joins(line_items: [variant: [:product]]).where("available_on <= ? and auction_end < ? and state not IN (?) and user_id = ? ", Date.today, Date.today, ["cart", "confirm"], spree_current_user.id).order("created_at Desc")
    end
    
    def catalog
      @searcher = build_searcher(params)
      @products = @searcher.retrieve_products.where("auction_end >= ?", Date.today).order("created_at DESC")
    end
    
  end
end