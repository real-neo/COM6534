class Staff::ApplicationController < ApplicationController
  before_action :verify_staff

  private

    def verify_staff 
      raise CanCan::AccessDenied unless current_account.staff?
    end
end