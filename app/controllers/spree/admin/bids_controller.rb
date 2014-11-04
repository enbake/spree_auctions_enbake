class Spree::Admin::BidsController < Spree::Admin::BaseController

  def index
    @product = Spree::Product.find params[:product_id]
    @bids = @product.bids.page(params[:page]).per(10)

  end

end