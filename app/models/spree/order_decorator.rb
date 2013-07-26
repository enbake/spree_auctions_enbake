Spree::Order.class_eval do
  checkout_flow do
    go_to_state :address
    go_to_state :payment, :if => lambda { |order| order.payment_required? }
    go_to_state :confirm, :if => lambda { |order| order.confirmation_required? }
    go_to_state :complete
  end

  # If true, causes the payment step to happen during the checkout process
  def payment_required?
    return false
  end

  # If true, causes the confirmation step to happen during the checkout process
  def confirmation_required?
    return true
  end

  def display_total_bid_price
    total_bid = 0
    self.line_items.each do |obj| 
      total_bid = total_bid + (obj.bid_price*obj.quantity) unless obj.bid_price.nil?
    end
    Spree::Money.new(total_bid, { currency: 'USD' })
  end

end
