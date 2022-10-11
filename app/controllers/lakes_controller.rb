class Lakes < ApplicationController

  def index 
    @lakes = Lake.find(params[:id])
  end

  
end