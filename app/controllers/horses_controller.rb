class HorsesController < ApplicationController
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
        session[:horse_id] = @horse.id
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
    @horse = Horse.find(params[:id])

    respond_to do |format|
      if @horse.update(horse_params)
        format.html { redirect_to @horse.race }
        format.json { render :show, status: :ok, location: @horse }
      else
        format.html { redirect_to @horse.race }
        format.json { render json: @horse.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def horse_params
    params[:horse].permit(:name, :race_code, :position).delete_if {|k,v| v.blank?}
  end
end
