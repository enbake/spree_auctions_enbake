class Spree::Admin::CategoriesController < Spree::Admin::BaseController

   def new
    @category = Spree::Category.new
  end

  def create 
    Spree::Category.create!(params[:category])
    flash[:notice] = "Category successfully created"
    redirect_to '/admin'
  end

end
