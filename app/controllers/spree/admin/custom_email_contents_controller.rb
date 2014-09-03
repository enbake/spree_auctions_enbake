class Spree::Admin::CustomEmailContentsController < Spree::Admin::BaseController
  
  def index
    @email_contents = Spree::CustomEmailContent.all
  end
  
  def new
    @email_content = Spree::CustomEmailContent.new
  end
  
  def create
    body = params[:custom_email_content].delete("body")
    @email_content =  Spree::CustomEmailContent.find_or_create_by_name_and_language(params[:custom_email_content][:name], params[:custom_email_content][:language])
    @email_content.update_attributes(params[:custom_email_content])
    @email_content.body[params[:custom_email_content][:language].to_sym] = body
    if @email_content.save
      flash[:notice] = "Email Content created successfully"
      redirect_to admin_custom_email_contents_path
    else
      flash[:error] = "Error creating in custom email content - " + @email_content.errors.full_messages.join(", ")
      render :action => "new"
    end
  end
  
  def edit
    @email_content = Spree::CustomEmailContent.find(params[:id])
  end
  
  def update
    body = params[:custom_email_content].delete("body")
    @email_content = Spree::CustomEmailContent.find params[:id]
    @email_content.update_attributes(params[:custom_email_content])
    if @email_content.update_attributes(params[:custom_email_content])
      @email_content.body[params[:custom_email_content][:language].to_sym] = body
      @email_content.save
      flash[:notice] = "Email Content updated successfully"
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
