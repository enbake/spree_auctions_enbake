module Spree
  User.class_eval do
    devise :confirmable
  end
end
