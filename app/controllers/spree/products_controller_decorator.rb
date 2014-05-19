module Spree

  ProductsController.class_eval do
    helper 'spree/taxons'
  
    def index
      @searcher = build_searcher(params)
      @products = @searcher.retrieve_products.where("auction_end >= ?", Date.today)
    end
  
    def show
      return unless @product

      product = Spree::Product.find_by_permalink(params[:id])
      @orders = Spree::Order.joins(line_items: [:variant]).where("spree_variants.product_id = ? and user_id is not ?", product.id, nil).order("created_at")

      @variants = @product.variants_including_master.active(current_currency).includes([:option_values, :images])
      @product_properties = @product.product_properties.includes(:property)

      referer = request.env['HTTP_REFERER']
      if referer
        begin
          referer_path = URI.parse(request.env['HTTP_REFERER']).path
          # Fix for #2249
        rescue URI::InvalidURIError
          # Do nothing
        else
          if referer_path && referer_path.match(/\/t\/(.*)/)
            @taxon = Taxon.find_by_permalink($1)
          end
        end
      end
    end

  end
end