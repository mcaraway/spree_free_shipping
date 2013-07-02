Spree::AppConfiguration.class_eval do
  preference :free_shipping_amount, :decimal, :default => 50
end
