module Spree
   UserRegistrationsController.class_eval do
     def create
        @user = build_resource(params[:spree_user])
        if resource.save
          subscribe_user if  @user.subscribed
          # set_flash_message(:notice, :signed_up)
          sign_in(:spree_user, @user)
          session[:spree_user_signup] = true
          associate_user
          sign_in_and_redirect(:spree_user, @user)
        else
          clean_up_passwords(resource)
          render :new
        end
      end

    private

      def subscribe_user
        gb = Gibbon::API.new(AppConfig.mailchimp["merchant_id"])
        chimp = gb.lists.list({:filters => {:list_name => "Tester"}})["data"].first
        unless chimp.nil?
          email = @user.email
          begin
          result = gb.lists.subscribe({:id => "5ca497ea43", :email => {:email => email}, :merge_vars => {:FNAME => "", :LNAME => ""}, :double_optin => false})
          rescue Gibbon::MailChimpError => e
            flash[:error] = email + " already exists."
          end
        end
      end
   end
 end