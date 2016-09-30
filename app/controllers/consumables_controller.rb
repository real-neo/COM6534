class ConsumablesController < ApplicationController

  def index
    @consumables = Consumable.order(:name)
  end

  def new
    @consumable = Consumable.new
  end

  def create
    @consumable = Consumable.new
    if @consumable.update_attributes(consumable_params)
      redirect_to action: :index
    else
      render :new
    end
  end

  def edit
    @consumable = Consumable.find(params[:id])
    render layout: false
  end

  def update
    @consumable = Consumable.find(params[:id])
    if @consumable.update_attributes(consumable_params)
      render 'update_success'
    else
      render 'update_failure'
    end
  end

  private

    def consumable_params
      params.require(:consumable).permit(:name, :description, :stock_level, :min_stock_level)
    end

end