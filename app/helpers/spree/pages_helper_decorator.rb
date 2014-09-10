module Spree
  module PagesHelper
    def page_title page
      translation = page.translations.order('updated_at').last
      translation ? translation.title : page.title
    end
    
    def title_value
      translation = @page.translations.where(locale: "en").first.try(:title)
      translation.present? ? translation : @page.title
    end
  
    def page_body nav
      translation = nav.translations.order('updated_at').last
      translation ? translation.body : nav.body
    end
  
    def page_body
      translation = @page.translations.where(locale: "en").first.try(:body)
      translation.present? ? translation : @page.body
    end
  end
end