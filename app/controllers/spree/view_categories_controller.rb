class Spree::ViewCategoriesController < Spree::StoreController


  def show
    @category = Spree::Category.find(params[:id])
    @products = @category.products.where("available_on <= ? and auction_end >= ? ", Date.today, Date.today)
  end

end
