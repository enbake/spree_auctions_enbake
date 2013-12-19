module Spree::ViewCategoriesHelper
  def display_price(product_or_variant)
    product_or_variant.price_in(Spree::Config[:currency]).display_price.to_html
  end
end
