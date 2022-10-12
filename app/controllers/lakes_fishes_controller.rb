class LakesFishesController < ApplicationController 

  def index 
    @lakes = Lake.find(params[:id])
    @fishes = @lakes.fishes
  end
end