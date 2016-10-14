class Admin::ApplicationController < ApplicationController
  before_action :verify_admin

  private

    def verify_admin
      raise CanCan::AccessDenied unless current_account.admin?
    end
end
