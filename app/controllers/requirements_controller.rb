class RequirementsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :new, :create, :show, :not_found]
  before_action :check_leader, except: [:index, :new, :create, :show, :not_found]
  before_action :set_requirement, only: [:show, :accept, :decline, :destroy]
  before_action :validate_search_key, only: [:search]

  def index
    if params[:id]
      @requirements = Requirement.where(id: params[:id])
      if @requirements.empty?
        redirect_to not_found_requirements_path
      else
        redirect_to @requirements.first
      end
    else
      @requirements = Requirement.all
    end
  end

  def new
    @requirement = Requirement.new
  end

  def show
  end

  def not_found
  end

  def create
    @requirement = Requirement.new(requirement_params)

    if @requirement.save
      redirect_to @requirement, notice: 'Upload project successfully!'
    else
      flash.now[:alert] = 'Failed to save'
      render :new
    end
  end

  def update
  end

  def accept
    if @requirement.state == 'Accepted'
      redirect_to @requirement, alert: 'This projected already has been accepted.'
    else
      @requirement.state = 'Accepted'
      @requirement.username = current_user.username
      @requirement.save

      new_record = Record.new
      new_record.username = current_user.username
      new_record.project_id = @requirement.id
      new_record.save
      redirect_to @requirement, notice: 'Accept successfully.'
    end
  end

  def decline
    if @requirement.username != current_user.username
      redirect_to @requirement, alert: 'Cannot decline this project.'
    else
      @requirement.state = 'Waiting'
      @requirement.username = nil
      @requirement.save

      record = Record.find_by_project_id(@requirement.id)
      record.destroy
      redirect_to @requirement, notice: 'Decline successfully.'
    end
  end

  def destroy
    @requirement.destroy
    redirect_to requirements_url, notice: 'Project was successfully destroyed.'
  end

  # if @query_string.present?
  #   search_result = Requirement.ransack(@search_criteria).result(:distinct => true)
  #   @requirements = search_result.paginate(:page => params[:page], :per_page => 5 )
  # end

  def search
    # code here
  end

  protected

  def validate_search_key
    @query_string = params[:q].gsub(/\\|\'|\/|\?/, '') if params[:q].present?
    @search_criteria = search_criteria(@query_string)
  end

  def search_criteria(query_string)
    {id_cont: query_string}
  end

  private

  def check_leader
    if current_user.mod_id.nil?
      redirect_to root_path, alert: 'You are not module leader.'
    end
  end

  def set_requirement
    begin
      @requirement = Requirement.find(params[:id])
    rescue
      redirect_to not_found_requirements_path
    end
  end

  def requirement_params
    params.require(:requirement).permit(:company_name, :email, :project_name,
                                        :project_details, :budget)
  end

end
