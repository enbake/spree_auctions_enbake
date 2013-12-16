class Spree::Admin::StaticPagesController < Spree::Admin::BaseController
   skip_before_filter :authorize_admin, :only => :index
  
  def index
    @data =StaticPage.all
  end

  def create 
    @title = params[:title]
    @description = params[:description]
    @save= StaticPage.create(:title => @title,:description => @description ) unless @title.blank?
    redirect_to :back unless @save.blank?
  end
end