class LakesFishesController < ApplicationController 

  def index 
    @lakes = Lake.find(params[:id])
    @fishes = @lakes.fishes
  end

  def new
    @lake = Lake.find(params[:id])
  end
  
  def create 
    @lake = Lake.find(params[:id])
    @fish = @lake.fishes.create!(lake_fish_params)
    
    redirect_to "/lakes/#{@lake.id}/fishes"
  end

  def sort 
    @lakes = Lake.find(params[:id])
    @fishes = @lakes.fishes.order(:name)
    render "index"
    
  end

  private
  def lake_fish_params
    params.permit(:name, :avg_length, :catch_and_release_only, :lake_id)
  end
end