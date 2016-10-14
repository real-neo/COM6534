class Staff::PurchasesController < Staff::ApplicationController

  before_action :feature_enabled?

  def index
    purchases = Purchase.includes(:account, :consumable)

    @totals = PurchaseTotaller.new(purchases).totals

  end

  private

    def feature_enabled?
      raise CanCan::AccessDenied unless FeatureToggle.enabled_feature?('reporting')
    end

end
