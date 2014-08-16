module SpreeNavigationTranslations
  class Engine < Rails::Engine
    config.autoload_paths += %W(#{config.root}/lib)

    def self.activate
      super
      ::Navigation.class_eval do
        translates :name, :fallbacks_for_empty_translations => @@fallbacks_for_empty_translations
      end
    end
  end
end