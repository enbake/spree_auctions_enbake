class Spree::Admin::AuthorBiosController < Spree::Admin::BaseController
  
  def index
    @bios = Spree::AuthorBio.all
  end
  
  def new
    @bio = Spree::AuthorBio.new
  end

  def create
    Spree::AuthorBio.create!(params[:author_bio])
    flash[:notice] = "Bio successfully created"
    redirect_to admin_author_bios_path
  end
  
  def edit
    @bio = Spree::AuthorBio.find params[:id]
  end
  
  def update
    @bio = Spree::AuthorBio.find params[:id]
    if @bio.update_attributes(params[:author_bio])
      flash[:notice] = "Bio updated successfully"
    else
      flash[:error] = "Error occured in updating bio"
    end
    redirect_to admin_author_bios_path
  end
  
  def destroy
    @bio = Spree::AuthorBio.find params[:id]
    if @bio.destroy
      flash[:notice] = "Bio deleted successfully"
    else
      flash[:error] = "Error occured in deleting bio"
    end
    redirect_to admin_author_bios_path
  end
  
end
