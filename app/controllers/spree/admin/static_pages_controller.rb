class Spree::Admin::StaticPagesController < Spree::Admin::BaseController
   skip_before_filter :authorize_admin, :only => :index
  
  def index
    @data =StaticContentPage.all
  end

  def new
    @static_page = StaticContentPage.new
  end

  def create 
    StaticContentPage.create!(params[:static_page])
    flash[:notice] = "Topic successfully created"
    redirect_to '/admin'
  end
end