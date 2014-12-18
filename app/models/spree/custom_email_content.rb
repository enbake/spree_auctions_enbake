class Spree::CustomEmailContent < ActiveRecord::Base
   attr_accessible :name, :body, :language
   validates_uniqueness_of :name
   
   serialize :body, Hash

   def display_name
     names = {"confirmation_instructions" =>"Account Confirmation Instructions", "bid_accepted" => "Bid Accepted Email", "confirm_email" => "Order Confirmation Email", "bid_placed_email" => "Bid Placed Email", "winner_chosen_email" => "Winner Chosen Email"}
     names[self.name]
   end
end
