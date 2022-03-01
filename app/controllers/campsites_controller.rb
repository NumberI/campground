class CampsitesController < ApplicationController
  before_action :set_campsite, only: %i[ show update destroy ]

  # GET /campsites
  def index
    @campsites = Campsite.all

    render json: @campsites
  end

  # GET /campsites/1
  def show
    render json: @campsite
  end

  # POST /campsites
  def create
    @campsite = Campsite.new(campsite_params)

    if @campsite.save
      render json: @campsite, status: :created, location: @campsite
    else
      render json: @campsite.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /campsites/1
  def update
    if @campsite.update(campsite_params)
      render json: @campsite
    else
      render json: @campsite.errors, status: :unprocessable_entity
    end
  end

  # DELETE /campsites/1
  def destroy
    @campsite.destroy
  end

  private
  
    # Use callbacks to share common setup or constraints between actions.
    def set_campsite
      @campsite = Campsite.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def campsite_params
      params.require(:campsite).permit(:name, :price)
    end
end
