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
            flash.notice = Spree.t(:Your_order_has_been_placed_successfully)

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


  private

    def before_confirm
      # if bill address is present do nothing
      if @order.bill_address_id.nil?
          # if user is present in order i.e. already logged in copy him
           if @order.user.present?
             user = @order.user
             # if user address is present copy it
             if @order.user.user_address.present?
               user_address = @order.user.user_address
               # but if user address is not present and any past order address is present use it and return
             else if
                  @orig_bill_address = Spree::Address.find(:user_id => user.id)
                  if @orig_bill_address
                    @bill_address = @orig_bill_address.dup
                    @ship_address = @orig_bill_address.dup
                    @bill_address.save
                    @ship_address.save
                    @order.bill_address_id = @bill_address.id
                    @order.ship_address_id = @ship_address.id
                    @order.save
                  end
             end
              end
           else if spree_current_user
                @order.user_id = spree_current_user.id
                @order.email = spree_current_user.email
                user = spree_current_user
                user_address = spree_current_user.user_address
                end
           end
          if user.present? && user_address.present?
                  @bill_address = Spree::Address.create({:first_name => user.first_name,:last_name => user.last_name ,
                  :address1 => user_address.street,:city=> user_address.city,
                   :zipcode => user_address.zip_code,:phone => user_address.mobile_no,
                    :state_name=> user_address.state,:country_id=> user_address.country},:without_protection => true)
                  @ship_address = @bill_address.dup
                  @ship_address.save
                  @order.bill_address_id = @bill_address.id
                  @order.ship_address_id = @ship_address.id
                  @order.save
         end
      end
    end
  end
  end
