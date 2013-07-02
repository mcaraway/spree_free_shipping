Spree::Core::Engine.routes.prepend do
  namespace :admin do
    resource  :free_shipping_settings
  end
  
end
