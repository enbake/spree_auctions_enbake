module Spree
   class UserRegistrationsController < Devise::RegistrationsController
   
     def create
        @user = build_resource(params[:spree_user])
        if resource.save
          subscribe_user
          set_flash_message(:notice, :signed_up)
          sign_in(:spree_user, @user)
          session[:spree_user_signup] = true
          associate_user
          sign_in_and_redirect(:spree_user, @user)
        else
          clean_up_passwords(resource)
          render :new
        end
      end

    def subscribe_user
      gb = Gibbon::API.new(AppConfig.mailchimp["merchant_id"])
      list = gb.lists.list({:filters => {:list_name => "customer"}})["data"].first
      unless list.nil?
        email = @user.email
        begin
        result = gb.lists.subscribe({:id => list["id"], :email => {:email => email},
                           :merge_vars => {:FNAME => "", :LNAME => ""},
                           :double_optin => false})
        rescue Gibbon::MailChimpError => e
          flash[:error] = email + " already exists."
        end
      end
    end
   end
 end