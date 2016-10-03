class Students::ApplicationController < ApplicationController
  before_action :verify_student

  private

    def verify_student 
      raise CanCan::AccessDenied unless current_account.student?
    end
end