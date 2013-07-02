class Spree::Calculator::FreeShipping < Spree::Calculator
  preference :amount, :decimal, :default => 0
  attr_accessible :preferred_amount
  
  def self.description
    "Free Shipping"
  end

  def self.register
    super
    ShippingMethod.register_calculator(self)
  end

  def compute(object=nil)
    logger.debug "********* in compute"
    0
  end

  def available?(object)
    logger.debug "********* free shipping available"
    logger.debug "********* free shipping available = " + (object.item_total.to_i >= 50).to_s
    logger.debug "********* free shipping available"
    object.item_total.to_i >= 50
  end
end
