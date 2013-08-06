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
  end
end
