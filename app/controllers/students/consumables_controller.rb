class Students::ConsumablesController < Students::ApplicationController

  def index
    @consumables = Consumable.all
  end

end