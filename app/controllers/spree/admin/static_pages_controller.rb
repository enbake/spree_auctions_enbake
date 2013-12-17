class Spree::Admin::StaticPagesController < Spree::Admin::BaseController
   skip_before_filter :authorize_admin, :only => :index
  
  def index
    @data =StaticPage.all
  end

  def new
    @static_page = StaticPage.new
  end

  def create 
    StaticPage.create!(params[:static_page])
    flash[:notice] = "Topic successfully created"
    redirect_to '/admin'
  end
end