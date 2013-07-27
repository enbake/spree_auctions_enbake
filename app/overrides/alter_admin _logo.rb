Deface::Override.new(
    :virtual_path  => "spree/layouts/admin",
    :replace => "[data-hook='logo-wrapper']",
    :text  => "<figure data-hook='logo-wrapper' class='columns five'>
                 <a href='/admin'><img id='logo' src='/assets/images.jpg'/></a>
               </figure>",
    :name => "alter_admin_logo")
