module Spree
  HomeController.class_eval do
    def price
      @products = Product.joins(:variants_including_master).where('spree_variants.bid_price is not null').uniq
    end

    def payment_options
      if params.has_key?(:payment)
        if params[:payment] == "paypal"
          redirect_to orders_paypal_payment_url(:order_id => params[:order_id], :state => "Approved")
        else
          Spree::Order.find(params[:order_id]).update_attribute('payment_state','complete')
          render :complete_payment
        end
      end
    end
    def index
      @searcher = build_searcher(params)
      @products = @searcher.retrieve_products.where("auction_end >= ?", Date.today).order("created_at DESC").limit(3)
      slider = Spree::Taxon.where(:name => 'Slider').first
      @slider_products = slider.products.active if slider
  
      featured = Spree::Taxon.where(:name => 'Featured').first
      @featured_products = featured.products.active if featured
  
      latest = Spree::Taxon.where(:name => 'Latest').first
      @latest_products = latest.products.active if latest
      if params.has_key?(:invoice) && params[:payer_status] == "verified"
        Spree::Order.where(:number => params[:invoice]).first.update_attribute('payment_state','complete')
      elsif session.has_key?(:order_id)
        order= Spree::Order.find_by_id(session[:order_id]-1)
        order ? order.update_attribute('payment_state','complete') : Spree::Order.find_by_id(session[:order_id]).update_attribute('payment_state','complete')
        session.delete("order_id")
      end
    end
  end
end
