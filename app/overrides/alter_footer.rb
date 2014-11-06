Deface::Override.new(:virtual_path  => "spree/shared/_footer",:replace => "div#footer-left p", :text  => "<%= t('powered_by')%><%= link_to( t('brand'), '/') %>", :name => "alter_footer")
