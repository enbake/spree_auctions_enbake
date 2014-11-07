class Spree::Admin::AuthorBiosController < Spree::Admin::BaseController
  
  def index
    @bios = Spree::AuthorBio.all
  end
  
  def new
    @bio = Spree::AuthorBio.new
  end

  def create
    author_bio = Spree::AuthorBio.create!(params[:author_bio])
    if params[:lang] == "pl"
      author_bio.translations.where(locale: "en").first.update_attribute(:name=> "" ,:biography => "" ) if author_bio.translations.where(locale: "en").first
      translation =  author_bio.translations.create(locale: params[:lang], name: params[:author_bio][:name], biography:params[:author_bio][:biography] )
    end
    flash[:notice] = "Bio created successfully"
    redirect_to admin_author_bios_path
  end
  
  def edit
    @bio = Spree::AuthorBio.find params[:id]
  end
  

  def update
    @bio = Spree::AuthorBio.find params[:id]
    if @bio.update_attributes(params[:author_bio])
      if params[:lang] == 'pl'
        translation =  @bio.translations.find_or_initialize_by_locale(params[:lang])
        @bio.translations.where(locale: "en").first.update_attributes(:name => params[:english_name],:biography => params[:english_bio_description] )
        translation.update_attributes(:name => params[:author_bio][:name],:biography => params[:author_bio][:biography])
      end
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
