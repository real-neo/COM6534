class ModsController < ApplicationController
  before_action :set_mod, only: [:show, :edit, :update, :destroy]
  before_action :isAdmin

  # GET /mods
  def index
    @mods = Mod.all
  end

  # GET /mods/1
  def show
  end

  # GET /mods/new
  def new
    @mod = Mod.new
  end

  # GET /mods/1/edit
  def edit
  end

  # POST /mods
  def create

    @mod = Mod.new(mod_params)

    if @mod.save
      redirect_to @mod, notice: 'Mod was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /mods/1
  def update
    if @mod.update(mod_params)
      redirect_to @mod, notice: 'Mod was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /mods/1
  def destroy
    @mod.destroy
    redirect_to mods_url, notice: 'Mod was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mod
      @mod = Mod.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def mod_params
      params.require(:mod).permit(:name, :code)
    end
end
