class Api::V1::LaunchesController < ApplicationController
  before_action :set_launch, only: [:show, :update, :destroy]

  # GET /launches
  def index
    @launches = Launch.all

    render json: @launches
  end

  # GET /launches/1
  def show
    render json: @launch
  end

  # POST /launches
  def create
    @launch = Launch.new(launch_params)

    if @launch.save
      render json: @launch, status: :created, location: @launch
    else
      render json: @launch.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /launches/1
  def update
    if @launch.update(launch_params)
      render json: @launch
    else
      render json: @launch.errors, status: :unprocessable_entity
    end
  end

  # DELETE /launches/1
  def destroy
    @launch.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_launch
      @launch = Launch.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def launch_params
      params.require(:launch).permit(:article_id, :providers)
    end
end
