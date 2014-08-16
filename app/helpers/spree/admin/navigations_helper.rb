module Spree::Admin::NavigationsHelper
  
  def nav_name nav
    translation = nav.translations.order('updated_at').last
    translation ? translation.name : nav.name
  end
  
  def nav_value
    translation = @navigation.translations.where(locale: "en").first.try(:name)
    translation.present? ? translation : @navigation.name
  end
end
