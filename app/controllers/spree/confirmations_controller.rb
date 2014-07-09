module Spree
 class ConfirmationsController < Devise::ConfirmationsController
  def new
   super
  end

  def create
    super
  end

  def update
    super
  end

  def show
    self.resource = resource_class.confirm_by_token(params[:confirmation_token])

    if resource.errors.empty?
      set_flash_message(:notice, :confirmed) if is_navigational_format?
      sign_in(resource_name, resource)
      respond_with_navigational(resource){ redirect_to after_confirmation_path_for(resource_name, resource) }
    else
      flash[:notice] = "Your account is already confirmed. Please login."
      redirect_to '/login'
    end
  end

 protected

  def after_confirmation_path_for(resource_name, resource)
    if signed_in?
      add_credit_card_path
    else
      login_path
    end
  end
 end
end