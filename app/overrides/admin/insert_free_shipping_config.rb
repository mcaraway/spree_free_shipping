Deface::Override.new(:virtual_path => "spree/admin/configurations/index",
                     :name => "add_free_shipping_settings_link",
                     :insert_after => "[data-hook='admin_configurations_menu'], #admin_configurations_menu[data-hook]",
                     :text => "<tr><td><%= link_to t(\"free_shipping_settings\"), admin_free_shipping_settings_path %></td><td><%= t(\"free_shipping_settings_description\") %></td></tr>",
                     :original => '334898j740dc3e7f9245454cb566e9898f73734hskk')
                     