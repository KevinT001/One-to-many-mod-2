class LakesController < ApplicationController

  def index 
    @lakes = Lake.all.order_by_creation
  end

  def show 
    @lake = Lake.find(params[:id])
  end

  def new
  end

  def create
    Lake.create(lake_params)
    redirect_to "/lakes"
  end

  private

  def lake_params
    params.permit(:name, :max_depth, :allows_public_fishing, :lake_id)
  end
end