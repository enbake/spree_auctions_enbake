Spree::Core::Engine.routes.draw do
  # Add your extension routes here
	Spree::Core::Engine.routes.draw do
		get "/price" => "home#price"
	  	match "users/:id/send_email" => "users#send_email", :as => "users_send_email"
      match "orders/:id/confirmation" => "orders#confirmation", :as => "orders_confirmation"
      match "paypal_payment" => "orders#paypal_payment", :as => "orders_paypal_payment"
      match "payment_options" => "home#payment_options", :as => "home_payment_options"
      match "payment" => "users#payment"
	end
end
