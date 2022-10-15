class LakesFishesController < ApplicationController 

  def index 
    @lakes = Lake.find(params[:id])
    if params[:sort] == "1" # If `params` has a key or `sort` then we want to order by name
      @fishes = @lakes.fishes.order(:name)
    else # If not, just grab the fishes normally
      @fishes = @lakes.fishes
    end
    
  end

  def new
    @lake = Lake.find(params[:id])
  end
  
  def create 
    @lake = Lake.find(params[:id])
    @fish = @lake.fishes.create!(lake_fish_params)
    
    redirect_to "/lakes/#{@lake.id}/fishes"
  end

  # def sort 
  #   @lakes = Lake.find(params[:id])
  #   @fishes = @lakes.fishes.order(:name)
  #   render "index" 
  # end

  private
  def lake_fish_params
    params.permit(:name, :avg_length, :catch_and_release_only, :lake_id)
  end
end