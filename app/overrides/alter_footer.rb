Deface::Override.new(:virtual_path  => "spree/shared/_footer",:replace => "div#footer-left p", :text  => "<%= Spree.t :powered_by  %> <%= link_to 'Action House', '/' %>", :name => "alter_footer")
