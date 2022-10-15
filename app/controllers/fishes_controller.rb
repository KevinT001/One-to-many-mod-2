class FishesController < ApplicationController

  def index
    @fishes = Fish.all 

  end

  def show
    @fish = Fish.find(params[:id])
  end

  def edit 
    @fish = Fish.find(params[:id])
  end

  def update
    fish = Fish.find(params[:id])
    fish.update(fish_params)
    fish.save
    redirect_to "/fishes/#{fish.id}"
  end


  private 

  def fish_params 
    params.permit(:name, :avg_length, :catch_and_release_only, :fish_id)
  end
end