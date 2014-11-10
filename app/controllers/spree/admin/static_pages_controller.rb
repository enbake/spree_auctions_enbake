class Spree::Admin::StaticPagesController < Spree::Admin::BaseController
   skip_before_filter :authorize_admin, :only => :index
  
  def index
    @data =StaticContentPage.all
  end

  def new
    @static_page = StaticContentPage.new
  end



   def create
     # params[:category][:url] =  params[:category][:url].split("//").last
     static_page = StaticContentPage.create!(params[:static_content_page])
     if params[:lang] == "pl"
       static_page.translations.where(locale: "en").first.update_attribute(:title=> "",:description => "") if static_page.translations.where(locale: "en").first
       translation =  static_page.translations.create(locale: params[:lang], title: params[:static_content_page][:title],:description => params[:static_content_page][:description])
     end
     flash[:notice] = "Page created successfully"
     redirect_to  admin_static_pages_url
   end

   def edit
     @static_page = StaticContentPage.find(params[:id])
   end

  def update

    @static_page = StaticContentPage.find params[:id]
    if @static_page.update_attributes(params[:static_content_page])
      if params[:lang] == 'pl'
        translation =  @static_page.translations.find_or_initialize_by_locale(params[:lang])
        @static_page.translations.where(locale: "en").first.update_attributes(:title=> params[:english_title],
                                                                              :description => params[:english_description])
        translation.update_attributes(:title => params[:static_content_page][:title],:description => params[:static_content_page][:description])
      end
      flash[:notice] = "Static page updated successfully"
    else
      flash[:error] = "Error occured in updating page"
    end
    redirect_to admin_static_pages_url
  end

   def destroy
     @static_page = StaticContentPage.find params[:id]
     if @static_page.destroy
       flash[:notice] = "Page deleted successfully"
     else
       flash[:error] = "Error occurred while deleting page"
     end
     redirect_to admin_static_pages_url
   end

end