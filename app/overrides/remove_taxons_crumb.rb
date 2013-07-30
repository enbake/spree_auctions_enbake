Deface::Override.new(
    :virtual_path  => "spree/products/_taxons",
    :replace => "div#taxon-crumbs",
    :text  => '<div id="taxon-crumbs" data-hook class="alpha columns five omega"></div>', 
    :name => "remove_taxons_crumb")
