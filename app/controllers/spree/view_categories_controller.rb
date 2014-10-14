class Spree::ViewCategoriesController < Spree::StoreController


  def show
    @category = Spree::Category.find(params[:id])
    @products = @category.products.active_products
  end

end
