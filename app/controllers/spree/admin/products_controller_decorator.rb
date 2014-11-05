
  Spree::Admin::ProductsController.class_eval do

      def update
        if params[:product][:taxon_ids].present?
          params[:product][:taxon_ids] = params[:product][:taxon_ids].split(',')
        end
        if params[:product][:option_type_ids].present?
          params[:product][:option_type_ids] = params[:product][:option_type_ids].split(',')
        end
        if params[:categories_id].present?
          @object[:categories_id] = params[:categories_id]
          @object[:action] = "update"
        end
        super
      end


      def pendding_order
        @products = Spree::Product.expired.where(:status => 'pending_confirmation')
        respond_with(@products)
      end

    end
