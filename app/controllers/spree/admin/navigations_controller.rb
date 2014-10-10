class Spree::Admin::NavigationsController < Spree::Admin::BaseController
  def index
    @navigation = Spree::Navigation.order("position")
  end
  def new
    @navigation = Spree::Navigation.new
  end
  
  def create
    params[:navigation][:url] =  params[:navigation][:url].split("//").last
    navigation = Spree::Navigation.create!(params[:navigation])
    if params[:lang] == "pl"
      navigation.translations.where(locale: "en").first.update_attribute('name', "") if navigation.translations.where(locale: "en").first
      translation =  navigation.translations.create(locale: params[:lang], name: params[:navigation][:name])
    end
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
      if params[:lang] == 'pl'
        translation =  @navigation.translations.find_or_initialize_by_locale(params[:lang])
        @navigation.translations.where(locale: "en").first.update_attribute('name', params[:english])
        translation.update_attributes(:name => params[:navigation][:name])
      end
      flash[:notice] = "Navigation updated successfully"
    else
      flash[:error] = "Error occured in updating bio"
    end
    redirect_to admin_navigations_path
  end
end
