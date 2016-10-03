class Students::ConsumablesController < Students::ApplicationController

  def index
    @consumables = Consumable.order(:name).decorate
  end

end