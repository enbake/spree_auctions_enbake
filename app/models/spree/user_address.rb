class Spree::UserAddress < ActiveRecord::Base
  attr_accessible :street, :street_no, :house_no, :apartment_no, :city, :land_line_no,
                  :mobile_no, :state, :zip_code, :country, :company, :company_name, :nip,
                  :com_street, :com_street_no, :com_house_no, :com_apartment_no, :com_city,
                   :com_land_line_no, :com_mobile_no, :com_state, :com_zip_code, :com_country
  
  belongs_to :user, :class_name => "Spree::User"

end
