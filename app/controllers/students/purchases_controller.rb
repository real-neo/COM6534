class Students::PurchasesController < Students::ApplicationController

  before_action :feature_enabled?
  before_action :find_consumable

  def new
    @purchase = @consumable.purchases.build
    render layout: false
  end

  def create
    @purchase = @consumable.purchases.build
    @consumable = @consumable.decorate

    purchaser = Purchaser.new(purchase: @purchase, account: current_account, params: purchase_params)

    if purchaser.make_purchase
      render 'create_success'
    else
      render 'create_failure'
    end
  end

  private

    def feature_enabled?
      raise CanCan::AccessDenied unless FeatureToggle.enabled_feature?('purchasing')
    end

    def find_consumable
      @consumable = Consumable.find(params[:consumable_id])
    end

    def purchase_params
      params.require(:purchase).permit(:amount, :reason)
    end

end
