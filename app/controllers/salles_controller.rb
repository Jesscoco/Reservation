class SallesController < ApplicationController
  before_action :set_salle, only: %i[ show edit update destroy ]

  # GET /salles or /salles.json
  def index
    @salles = Salle.all
  end

  # GET /salles/1 or /salles/1.json
  def show
  end

  def reserved
    @salle = Salle.find(params[:id])
    @salle.save
    @salles = Salle.all
    render :index
  end
  # GET /salles/new
  def new
    @salle = Salle.new
    @salle.materials.build
  end

  # GET /salles/1/edit
  def edit
    @salle.materials.build
  end

  # POST /salles or /salles.json
  def create
    @salle = Salle.new(salle_params)
    @salle.user_id = current_user.id
    @salle.status=true
    respond_to do |format|
      if @salle.save
        format.html { redirect_to @salle, notice: "Salle was successfully created." }
        format.json { render :show, status: :created, location: @salle }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @salle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /salles/1 or /salles/1.json
  def update
    respond_to do |format|
      if @salle.update(salle_params)
        format.html { redirect_to @salle, notice: "Salle was successfully updated." }
        format.json { render :show, status: :ok, location: @salle }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @salle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /salles/1 or /salles/1.json
  def destroy
    @salle.destroy
    respond_to do |format|
      format.html { redirect_to salles_url, notice: "Salle was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_salle
      @salle = Salle.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def salle_params
      params.require(:salle).permit(:name, :status, :start_time, :end_time, :courses, materials_attributes: [:id, :name])
    end
end
