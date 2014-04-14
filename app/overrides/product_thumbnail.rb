Deface::Override.new(
	:virtual_path => 'spree/shared/_products',
	:name => 'add_thumbnail_class_names',
	:set_attributes => '[data-hook="products_list_item"]',
	:attributes => {:class => 'feature'}
)