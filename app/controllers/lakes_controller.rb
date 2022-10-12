class LakesController < ApplicationController

  def index 
    @lakes = Lake.all.order_by_creation
  end

  def show 
    @lake = Lake.find(params[:id])
  end

end