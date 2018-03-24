class InformInfectedsController < ApplicationController
  before_action :set_inform_infected, only: [:show, :update, :destroy]

  # GET /inform_infecteds
  def index
    @inform_infecteds = InformInfected.all

    render json: @inform_infecteds
  end

  # GET /inform_infecteds/1
  def show
    render json: @inform_infected
  end

  # POST /inform_infecteds
  def create
    @inform_infected = InformInfected.new(inform_infected_params)


    if @inform_infected.save
      @inform_infected.inform_contamination(inform_infected_params)
      render json: @inform_infected, status: :created, location: @inform_infected
    else
      render json: @inform_infected.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /inform_infecteds/1
  def update
    if @inform_infected.update(inform_infected_params)
      render json: @inform_infected
    else
      render json: @inform_infected.errors, status: :unprocessable_entity
    end
  end

  # DELETE /inform_infecteds/1
  def destroy
    @inform_infected.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inform_infected
      @inform_infected = InformInfected.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def inform_infected_params
      params.require(:inform_infected).permit(:survivor_send_id, :survivor_infected_id)
    end
end
