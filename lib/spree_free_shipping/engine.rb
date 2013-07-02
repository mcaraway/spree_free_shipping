module SpreeFreeShipping
  class Engine < Rails::Engine
    engine_name 'spree_free_shipping'
    
    config.autoload_paths += %W(#{config.root}/lib)
    
    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), '../../app/**/*_decorator*.rb')) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end
      
      Spree::Order.class_eval do
        def eligible_for_free_shipping?
          self.item_total.to_i >= 50
        end
      end
      
    end
    config.autoload_paths += %W(#{config.root}/lib)
    config.to_prepare &method(:activate).to_proc

    initializer "spree_free_shipping.register.calculators" do |app|
      Dir[File.join(File.dirname(__FILE__), "../../app/models/spree/calculator/**/*.rb")].sort.each do |c|
        Rails.env.production? ? require(c) : load(c)
      end

      app.config.spree.calculators.shipping_methods += [
        Spree::Calculator::FreeShipping
      ]
    end
  end
end