class Spree::ViewCategoriesController < ApplicationController

  def show
    category = Spree::Category.find(params[:id])
    @products = category.products
  end

end
