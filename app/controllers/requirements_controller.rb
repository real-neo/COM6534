class RequirementsController <ApplicationController
  before_action :set_requirement, only: [:show, :edit, :update, :destroy]
  before_action :validate_search_key, only: [:search]
  def index

    @requirements= if params[:id]
      Requirement.where('id LIKE ?', "%#{params[:id]}%")
    else
      Requirement.all
    end

  end
  def new
    @requirement=Requirement.new
  end
  def create
    @requirement = Requirement.new(requirement_params)
    if @requirement.save
      redirect_to requirements_path, notice:'Create Requirement'
    else
      flash.now[:alert] = "failed to save"
      render :new
    end
  end

    # if @query_string.present?
    #   search_result = Requirement.ransack(@search_criteria).result(:distinct => true)
    #   @requirements = search_result.paginate(:page => params[:page], :per_page => 5 )
    # end

  # protected
  #
  #  def validate_search_key
  #    @query_string = params[:q].gsub(/\\|\'|\/|\?/, "") if params[:q].present?
  #    @search_criteria = search_criteria(@query_string)
  #  end
  #
  #  def search_criteria(query_string)
  #    { id_cont: query_string }
  #  end


  private
  def requirement_params
    params.require(:requirement).permit(:company_name, :email, :project_name, :project_details, :budget)
  end

end
