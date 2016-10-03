class Staff::PurchasesController < Staff::ApplicationController

  def index
    purchases = Purchase.includes(:account, :consumable).group_by(&:account)
    @totals = purchases.map do |account, purchases|
      totals = {}
      purchases.group_by { |purchase| purchase.consumable.category }.each do |category, purchase| 
        totals[category] = purchase.inject(0) { |total, purchase| total + purchase.amount } 
      end
      [account, totals]
    end.to_h

  end

end