class Staff::PurchasesController < Staff::ApplicationController

  def index
    purchases = Purchase.includes(:account, :consumable)

    @totals = PurchaseTotaller.new(purchases).totals

  end

end