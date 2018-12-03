class RequirementsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create, :show]
  before_action :authenticate_user!, only: [:index]
  before_action :set_requirement, only: [:show, :accept, :decline, :destroy]
  before_action :validate_search_key, only: [:search]

  def index

    @requirements = if params[:id]
                      Requirement.where('id LIKE ?', "%#{params[:id]}%")
                    else
                      Requirement.all
                    end

  end

  def new
    @requirement = Requirement.new
  end

  def show
  end

  def create
    @requirement = Requirement.new(requirement_params)

    if @requirement.save
      redirect_to welcome_index_path, notice: 'Upload project successfully!'
    else
      flash.now[:alert] = 'Failed to save'
      render :new
    end
  end

  def update
  end

  def accept
    @requirement.state = 'Accepted'
    @requirement.save
    redirect_to @requirement, notice: 'Accept successfully.'
  end

  def decline
    @requirement.state = 'Waiting'
    @requirement.save
    redirect_to @requirement, notice: 'Decline successfully.'
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

  def set_requirement
    @requirement = Requirement.find(params[:id])
  end

  def requirement_params
    params.require(:requirement).permit(:company_name, :email, :project_name,
                                        :project_details, :budget)
  end

end
