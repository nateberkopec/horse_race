class RacesController < ApplicationController
  # GET /races/1
  # GET /races/1.json
  def show
    @race = Race.find(params[:id])
  end
end
