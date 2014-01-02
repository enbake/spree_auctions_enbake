Deface::Override.new(
	:virtual_path => 'spree/layouts/spree_application',
	:name => 'add_homepage_slider',
	:insert_before => 'div#content',
	:text =>'
	<% if params["action"] == "index" %>
		<section id="feature_slider" style="margin-top: -50px;">
			<article class="slide" id="showcasing" style="background: url(<%= image_path \'backgrounds/landscape.png\' %>) repeat-x top center;">
			    <img class="asset left-30 sp600 t120 z1" src="<%= image_path \'slides/scene1/macbook.png\' %>" />
			    <div class="info">
			        <h2>Beautiful theme for showcasing your works.</h2>
			    </div>
			</article>
			<article class="slide" id="ideas" style="background: url(\'<%= image_path "backgrounds/aqua.jpg" %>\') repeat-x top center;">
			    <div class="info">
			        <h2>We love to turn ideas into beautiful things.</h2>
			    </div>
			    <%= image_tag "slides/scene2/left.png", {:class => "asset left-480 sp600 t260 z1"} %>
			    <%= image_tag "slides/scene2/middle.png", {:class => "asset left-210 sp600 t213 z2"} %>
			    <%= image_tag "slides/scene2/right.png", {:class => "asset left60 sp600 t260 z1"} %>
			</article>
		</section>
	<% end %>'
)