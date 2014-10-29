Spree::Address.class_eval do




  # Remove the requirement on :phone being present.
  _validators.reject!{ |key, _| key == :address2 }

  _validate_callbacks.each do |callback|
    callback.raw_filter.attributes.delete :address2 if callback.raw_filter.is_a?(ActiveModel::Validations::PresenceValidator)
  end

end