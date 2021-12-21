class PlanningsController < ApplicationController
  before_action :set_planning, only: %i[ show edit update destroy ]
  before_action :checkMatricule

  # GET /plannings or /plannings.json
  def index
    @plannings = Salle.all

    #start_date = params.fetch(:start_date, Date.today).to_date
    # @plannings = Planning.where(start_date: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)
  end

 
  # GET /plannings/1 or /plannings/1.json
  def show
  end

  # GET /plannings/new
  def new
    @planning = Planning.new
  end

  # GET /plannings/1/edit
  def edit
  end

  # POST /plannings or /plannings.json
  def create
    @planning = Planning.new(planning_params)

    respond_to do |format|
      if @planning.save
        format.html { redirect_to @planning, notice: "Planning was successfully created." }
        format.json { render :show, status: :created, location: @planning }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @planning.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /plannings/1 or /plannings/1.json
  def update
    respond_to do |format|
      if @planning.update(planning_params)
        format.html { redirect_to @planning, notice: "Planning was successfully updated." }
        format.json { render :show, status: :ok, location: @planning }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @planning.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /plannings/1 or /plannings/1.json
  def destroy
    @planning.destroy
    respond_to do |format|
      format.html { redirect_to plannings_url, notice: "Planning was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_planning
      @planning = Planning.find(params[:id])
    end

    def checkMatricule
      @user = User.find(current_user.id) 
      @matricule= current_user.matricule.to_s
      if @matricule[0,1]== '1' || @matricule[0,1]== '3'  
        if @user.status== nil || @user.status == '' 
          @user.status= 'etudiant'
          @user.save
        end 
      elsif @user.status== nil || @user.status == '' 
        @user.status= 'enseignant'
        @user.save
  
      end
    end

    # Only allow a list of trusted parameters through.
    def planning_params
      params.require(:planning).permit(:start_time, :end_time, :courses)
    end
end
