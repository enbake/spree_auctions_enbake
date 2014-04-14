Deface::Override.new(
	:virtual_path => 'spree/shared/_products',
	:name => 'wrap_thumbnail_title',
	:replace => '.text',
	:text => "
	<div class='text'>
		<h5>
			<%= link_to truncate(product.name, :length => 50), product, :class => 'info', :itemprop => 'name', :title => product.name %>
		</h5>
		<p class='price selling' itemprop='price'><%= display_price(product) %></p>
	</div>"
)