Spree::Core::Engine.routes.draw do
  # Add your extension routes here
	Spree::Core::Engine.routes.draw do
		get "/price" => "home#price"
	  	match "users/:id/send_email" => "users#send_email", :as => "users_send_email"
      match "orders/:id/confirmation" => "orders#confirmation", :as => "orders_confirmation"
	end
end
