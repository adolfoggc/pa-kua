class BeltsController < ApplicationController
  before_action :set_belt, only: %i[ show edit update destroy ]

  # GET /belts or /belts.json
  def index
    @belts = Belt.all
  end

  # GET /belts/1 or /belts/1.json
  def show
  end

  # GET /belts/new
  def new
    @belt = Belt.new
  end

  # GET /belts/1/edit
  def edit
  end

  # POST /belts or /belts.json
  def create
    @belt = Belt.new(belt_params)

    respond_to do |format|
      if @belt.save
        format.html { redirect_to @belt, notice: "Belt was successfully created." }
        format.json { render :show, status: :created, location: @belt }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @belt.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /belts/1 or /belts/1.json
  def update
    respond_to do |format|
      if @belt.update(belt_params)
        format.html { redirect_to @belt, notice: "Belt was successfully updated." }
        format.json { render :show, status: :ok, location: @belt }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @belt.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /belts/1 or /belts/1.json
  def destroy
    @belt.destroy
    respond_to do |format|
      format.html { redirect_to belts_url, notice: "Belt was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_belt
      @belt = Belt.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def belt_params
      params.require(:belt).permit(:person_id, :modality, :color, :start_date)
    end
end
