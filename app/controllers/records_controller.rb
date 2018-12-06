class RecordsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_record, only: [:destroy]

  def index
    # @records = Record.all
    @records = Record.where(username: current_user.username)
  end

  def destroy
    @record.destroy
  end

  private

  def set_record
    @record = Record.find(params[:id])
  end
end
