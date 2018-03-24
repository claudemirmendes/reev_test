class ViriController < ApplicationController
  before_action :set_virus, only: [:show, :update, :destroy]

  # GET /viri
  def index
    @viri = Virus.all

    render json: @viri
  end

  # GET /viri/1
  def show
    render json: @virus
  end

  # POST /viri
  def create
    @virus = Virus.new(virus_params)

    if @virus.save
      render json: @virus, status: :created, location: @virus
    else
      render json: @virus.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /viri/1
  def update
    if @virus.update(virus_params)
      render json: @virus
    else
      render json: @virus.errors, status: :unprocessable_entity
    end
  end

  # DELETE /viri/1
  def destroy
    @virus.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_virus
      @virus = Virus.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def virus_params
      params.require(:virus).permit(:survivor_send_id, :survivor_infected_id)
    end
end
