class Spree::Admin::CustomEmailContentsController < Spree::Admin::BaseController
  
  def index
    @email_contents = Spree::CustomEmailContent.all
  end
  
  def new
    @email_content = Spree::CustomEmailContent.new
  end
  
  def create
    @email_content =  Spree::CustomEmailContent.create(params[:custom_email_content])
    if @email_content.save
      flash[:notice] = "Email Content created successfully"
      redirect_to admin_custom_email_contents_path
    else
      render :action => "new"
    end
  end
  
  def edit
    @email_content = Spree::CustomEmailContent.find(params[:id])
  end
  
  def update
    @email_content = Spree::CustomEmailContent.find params[:id]
    if @email_content.update_attributes(params[:custom_email_content])
      flash[:notice] = "Enail Content updated successfully"
    else
      flash[:error] = "Error occured in updating Email Content"
    end
    redirect_to admin_custom_email_contents_path
  end
  
  def destroy
     @email_content = Spree::CustomEmailContent.find(params[:id])
    if @email_content.destroy
      flash[:notice] = "Email Content deleted successfully"
    else
      flash[:error] = "Error occurred while deleting Email Content"
    end
    redirect_to admin_custom_email_contents_path
  end
end
