class HorsesController < ApplicationController
  before_action :set_horse, only: [:show, :edit, :update, :destroy]

  # GET /horses
  # GET /horses.json
  def index
    @horses = Horse.all
  end

  # GET /horses/new
  def new
    @horse = Horse.new
  end

  # POST /horses
  # POST /horses.json
  def create
    @horse = Horse.new(horse_params)

    respond_to do |format|
      if @horse.save
        format.html { redirect_to @horse.race }
        format.json { render :show, status: :created, location: @horse }
      else
        format.html { render :new }
        format.json { render json: @horse.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /horses/1
  # PATCH/PUT /horses/1.json
  def update
    respond_to do |format|
      if @horse.update(horse_params)
        format.html { redirect_to @horse, notice: 'Horse was successfully updated.' }
        format.json { render :show, status: :ok, location: @horse }
      else
        format.html { render :edit }
        format.json { render json: @horse.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_horse
    @horse = Horse.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def horse_params
    params.require(:horse).permit(:name, :race_code)
  end
end
