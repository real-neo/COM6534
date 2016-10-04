class Purchaser

  attr_accessor :purchase, :consumable, :params, :account

  def initialize(purchase, account, params)
    self.purchase   = purchase
    self.consumable = purchase.consumable
    self.params     = params
    self.account    = account 
  end

  def make_purchase(transaction_class = ActiveRecord::Base, rollback_class = ActiveRecord::Rollback)
     transaction_class.transaction do 
      if update_purchase && update_consumable
        return true
      else
        raise rollback_class
      end
    end
    false
  end

  private
    def update_purchase
      purchase.update_attributes(params.merge({ account: account }))
    end

    def update_consumable
      consumable.update_attributes(stock_level: consumable.stock_level - purchase.amount)
    end

end