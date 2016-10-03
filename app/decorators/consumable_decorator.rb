class ConsumableDecorator < Draper::Decorator
  delegate_all

  def display_amount_until_reorder
    remaining = consumable.stock_level - consumable.min_stock_level 
    consumable.stock_level > consumable.min_stock_level ? remaining : "Order now - #{remaining.abs} below minimum level"
  end
end
