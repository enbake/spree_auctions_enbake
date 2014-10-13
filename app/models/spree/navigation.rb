class Spree::Navigation < ActiveRecord::Base
  attr_accessible :name, :url, :private, :custom_url ,:position
  translates :name

  before_create :set_position

  def duplicate
    p = self.dup

    (SpreeMultiLingual.languages).each do |locale|
      locale_suffix = locale.empty? ? "" : "_#{locale}"

      name_locale = (I18n.t :copy_of, :locale => locale) + read_attribute(:name, :locale => locale)

      p.send("name"+locale_suffix+"=", name_locale)
    end

    p.deleted_at = nil
    p.created_at = p.updated_at = nil

    # allow site to do some customization
    p.send(:duplicate_extra, self) if p.respond_to?(:duplicate_extra)
    p.save!
    p
  end

  def self.like_any(fields, values)
    has_translated_fields = false
    where_str = fields.map do |field|
      if self.translated?(field)
        has_translated_fields = true
        next Array.new(values.size, "#{self.translation_class.quoted_table_name}.#{field} LIKE ?").join(' OR ')
      end
      next Array.new(values.size, "#{self.quoted_table_name}.#{field} LIKE ?").join(' OR ')
    end
    where_str = where_str.join(' OR ')
    self_scope = self
    #only use translations scope if we are searching translated fields.
    if has_translated_fields
      self_scope = self_scope.joins(:translations).where("#{self.translation_class.quoted_table_name}.locale = ?", I18n.locale)
    end

    self_scope.where([where_str, values.map { |value| "%#{value}%" } * fields.size].flatten)
  end

  def set_position
    self.position = Spree::Navigation.all.map(&:position).max + 1
  end

  def sort_nav_up
    unless position == 1
      prev_nav = Spree::Navigation.find_by_position(self.position-1)
      prev_nav.position = self.position
      self.position = self.position-1
      self.save
      prev_nav.save
    end
  end

  def sort_nav_down
    unless self.position == Spree::Navigation.maximum("position")
     next_nav = Spree::Navigation.find_by_position(self.position+1)
      next_nav.position = self.position
      self.position = self.position+1
      self.save
      next_nav.save
    end
  end
 
end
