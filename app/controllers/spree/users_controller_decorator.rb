module Spree
  UsersController.class_eval do

    def send_email
      @order = Order.where(:number => params[:id]).first
      if params[:bid] == "accept"
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
  end
end
