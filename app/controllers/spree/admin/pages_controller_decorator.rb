Spree::Admin::PagesController.class_eval do
  
  def create
    invoke_callbacks(:create, :before)
    @object.attributes = params[object_name]
    if @object.save
        invoke_callbacks(:create, :after)
        if params[:lang] == "pl"
           @object.translations.where(locale: "en").first.update_attributes(:title => "", :body => "") if @object.translations.where(locale: "en").first
           translation =  @object.translations.create(locale: params[:lang], title: params[:page][:title], body: params[:page][:body])
        end
      flash[:success] = flash_message_for(@object, :successfully_created)
      respond_with(@object) do |format|
        format.html { redirect_to location_after_save }
        format.js   { render :layout => false }
      end
        
    else
      invoke_callbacks(:create, :fails)
      respond_with(@object)
    end
  end
  
  def update
    invoke_callbacks(:update, :before)
    if @object.update_attributes(params[object_name])
      if params[:lang] == 'pl'
        translation =  @object.translations.find_or_initialize_by_locale(params[:lang])
        @object.translations.where(locale: "en").first.update_attributes(:title => params[:english], :body => params[:content])
        translation.update_attributes(:title => params[:page][:title], :body => params[:page][:body])
      end
      invoke_callbacks(:update, :after)
      flash[:success] = flash_message_for(@object, :successfully_updated)
      respond_with(@object) do |format|
        format.html { redirect_to location_after_save }
        format.js   { render :layout => false }
      end
     
    else
      invoke_callbacks(:update, :fails)
      respond_with(@object)
    end
  end
  
end