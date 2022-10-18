class FishesController < ApplicationController

  def index
    @fishes = Fish.all

    if params[:catch_and_release] == "on" 
      @fishes = Fish.all.must_release

    else 
      @fishes = Fish.all
    end

    # .must_release 

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

  def destroy
    Fish.find(params[:id]).destroy
    redirect_to "/fishes"
  end


  private 

  def fish_params 
    params.permit(:name, :avg_length, :catch_and_release_only, :fish_id)
  end
end