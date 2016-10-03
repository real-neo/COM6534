class Students::ConsumablesController < Students::ApplicationController

  def index
    @consumables = Consumable.order(:name)
  end

end