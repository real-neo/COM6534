class Admin::FeatureTogglesController < Admin::ApplicationController

  before_action :find_feature_toggle, only: [:update]

  def index
    @feature_toggles = FeatureToggle.order(:name)
  end

  def update
    @feature_toggle.update_attributes feature_toggle_params
    redirect_to action: :index
  end

  private

    def find_feature_toggle
      @feature_toggle = FeatureToggle.find(params[:id])
    end

    def feature_toggle_params
      params.require(:feature_toggle).permit(:enabled)
    end

end
