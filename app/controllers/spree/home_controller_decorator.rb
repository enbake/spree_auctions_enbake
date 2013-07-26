module Spree
  HomeController.class_eval do
    def price
      @products = Product.joins(:variants_including_master).where('spree_variants.bid_price is not null').uniq
    end
  end
end
