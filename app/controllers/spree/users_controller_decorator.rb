module Spree
  UsersController.class_eval do
    require 'paypal-sdk-rest'

    def send_email
      @order = Order.where(:number => params[:id]).first
      if params[:bid] == "accept"
        begin
          @payment = PayPal::SDK::REST::Payment.new({:intent => "sale",:payer => {:payment_method => "credit_card",:funding_instruments => [{:credit_card_token => {:credit_card_id => @order.user.credit_card.paypal_card_id,:payer_id => @order.user.credit_card.paypal_payer_id}}]},:transactions => [{:amount => {:total => "%.2f"%@order.line_items.last.bid_price,:currency => "USD"},:description => "You win the auction"}]})
          if @payment.create
            @order.update_attribute('state','Approved')
            UserMailer.contact_user(@order.user_id, @order).deliver
            redirect_to admin_order_payments_path(params[:id])
          else
            flash[:error] = Spree.t(:payment_unsuccessful)
            redirect_to :back
          end
        rescue Exception => e
          flash[:error] = Spree.t(:payment_unsuccessful)
          redirect_to :back
        end
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
      @credit_card = @user.credit_card || @user.build_credit_card
      unless @user.user_address
        @user.build_user_address
      end
      @products_followed = @user.followers.map(&:product)
    end
    
    def add_credit_card
    end
    
    def credit_card_info
       @credit_card = PayPal::SDK::REST::CreditCard.new({:type => params[:card_type],:number => params[:number],:expire_month => params[:date][:month],:expire_year => params[:date][:year],:first_name => params[:first_name],:last_name => params[:last_name],:payer_id => "123456789" })
       if @credit_card.create
         card_id = @credit_card.id
         payer_id = @credit_card.payer_id
         @card = Spree::CreditCard.find_or_initialize_by_user_id(spree_current_user.id)
         @card.cc_type = params[:card_type]
         @card.month = params[:date][:month]
         @card.year = params[:date][:year]
         @card.last_digits = @credit_card.number[-4,4]
         @card.first_name = params[:first_name]
         @card.last_name = params[:last_name]
         @card.paypal_card_id = @credit_card.id
         @card.paypal_payer_id = @credit_card.payer_id
         #@card = Spree::CreditCard.new(:cc_type => params[:card_type], :month => params[:date][:month], :year => params[:date][:year], :last_digits => @credit_card.number[-4,4],:first_name => params[:first_name], :last_name => params[:last_name], :user_id => spree_current_user.id, :paypal_card_id => @credit_card.id, :paypal_payer_id => @credit_card.payer_id)
         if @card.save(:validate => false)
            flash[:success] = Spree.t(:Credit_card_added_successfully)
            redirect_to root_path
         else
           flash[:error] = Spree.t(:something_went_wrong)
           render :action => "add_credit_card"
         end
       else
         flash[:error] = Spree.t(@credit_card.error)  # Error Hash
         render :action => "add_credit_card"
       end
    end

    def auctions
      @orders =  Spree::Order.joins(line_items: [variant: [:product]]).where("available_on < ? and auction_end > ? and state not IN (?) and user_id = ? ", Date.today, Date.today, ["cart", "confirm"], spree_current_user.id).order("created_at Desc")
      @order_history = Spree::Order.joins(line_items: [variant: [:product]]).where("available_on < ? and auction_end < ? and state not IN (?) and user_id = ? ", Date.today, Date.today, ["cart", "confirm"], spree_current_user.id).order("created_at Desc")
    end
    
    def catalog
      @searcher = build_searcher(params)
      @products = @searcher.retrieve_products.where("available_on <= ? and auction_end >= ? ", Date.today, Date.today).order("created_at DESC")
    end
    
    def faq
      @data =StaticContentPage.all
    end
    
  end
end