class PurchaseTotaller

  def initialize(purchases)
    @purchases = purchases.group_by(&:account)
  end 

  def totals
    @purchases.map do |account, purchases|
      totals = {}
      purchases.group_by { |purchase| purchase.consumable.category }.each do |category, purchase| 
        totals[category] = purchase.inject(0) { |total, purchase| total + purchase.amount } 
      end
      [account, totals]
    end.to_h
  end

end