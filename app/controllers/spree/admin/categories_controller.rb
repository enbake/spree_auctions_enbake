class Spree::Admin::CategoriesController < Spree::Admin::BaseController

  def index
    @categories = Spree::Category.all
  end

   def new
    @category = Spree::Category.new
   end

  #def create
    #Spree::Category.create!(params[:category])
    #flash[:notice] = "Category successfully created"
   # redirect_to '/admin'
  #end

  def create
   # params[:category][:url] =  params[:category][:url].split("//").last
    category = Spree::Category.create!(params[:category])
    if params[:lang] == "pl"
      category.translations.where(locale: "en").first.update_attribute('name', "") if category.translations.where(locale: "en").first
      translation =  category.translations.create(locale: params[:lang], name: params[:category][:name])
    end
    flash[:notice] = "Category created successfully"
    redirect_to  '/admin'
  end

  def edit
    @category = Spree::Category.find(params[:id])
  end

  def update
    @category = Spree::Category.find params[:id]
    if @category.update_attributes(params[:category])
      if params[:lang] == 'pl'
        translation =  @category.translations.find_or_initialize_by_locale(params[:lang])
        @category.translations.where(locale: "en").first.update_attribute('name', params[:english])
        translation.update_attributes(:name => params[:category][:name])
      end
      flash[:notice] = "Category updated successfully"
    else
      flash[:error] = "Error occured in updating bio"
    end
    redirect_to admin_categories_path
  end

end
