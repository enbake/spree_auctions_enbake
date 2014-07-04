class Spree::Admin::NavigationsController < Spree::Admin::BaseController
  def index
    @navigation = Spree::Navigation.all
  end
  def new
    @navigation = Spree::Navigation.new
  end
  
  def create
    Spree::Navigation.create!(params[:navigation])
    flash[:notice] = "Navigation created successfully"
    redirect_to admin_navigations_path
  end
  
  def edit
    @navigation = Spree::Navigation.find(params[:id])
  end
  
  
  def destroy
    @navigation = Spree::Navigation.find(params[:id])
    if @navigation.destroy
      flash[:notice] = "Navigation deleted successfully"
    else
      flash[:error] = "Error occurred while deleting navigation"
    end
    redirect_to admin_navigations_path
  end
  
  def update
       @navigation = Spree::Navigation.find params[:id]
    if @navigation.update_attributes(params[:navigation])
      flash[:notice] = "Navigation updated successfully"
    else
      flash[:error] = "Error occured in updating bio"
    end
    redirect_to admin_navigations_path
  end
end
