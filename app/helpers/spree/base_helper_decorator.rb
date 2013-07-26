module Spree
  module BaseHelper
    
    def link_to_cart(text = nil)
      return "" if current_spree_page?(spree.cart_path)

      text = text ? h(text) : Spree.t('cart')
      css_class = nil

      if current_order.nil? or current_order.line_items.empty?
        text = "#{text}: (#{Spree.t('empty')})"
        css_class = 'empty'
      else
        text = "#{text}: (#{current_order.item_count})  <span class='amount'>#{current_order.display_total_bid_price.to_html}</span>".html_safe
        css_class = 'full'
      end

      link_to text, spree.cart_path, :class => "cart-info #{css_class}"
    end
  end
end