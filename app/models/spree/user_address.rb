class Spree::UserAddress < ActiveRecord::Base
  attr_accessible :street, :street_no, :house_no, :apartment_no, :city, :land_line_no,
                  :mobile_no, :state, :zip_code, :country, :company, :company_name, :nip
  
  belongs_to :user, :class_name => "Spree::User"

end
