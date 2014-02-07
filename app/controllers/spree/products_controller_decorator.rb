module Spree

  ProductsController.class_eval do
    helper 'spree/taxons'
  
    def index
      @searcher = build_searcher(params)
      @products = @searcher.retrieve_products.where("auction_end >= ?", Date.today)
    end
  
  end
end