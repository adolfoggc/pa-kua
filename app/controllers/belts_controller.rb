class BeltsController < ApplicationController
  before_action :set_belt, only: %i[show edit update destroy change_belt]
  before_action :form_data, only: %i[new edit]
  before_action :check_member_belt, except: %i[new create update change_belt]

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
        format.html { redirect_to person_path(@belt.person.id), notice: "Belt was successfully created." }
        format.json { render :show, status: :created, location: @belt }
      else
        form_data
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @belt.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /belts/1 or /belts/1.json
  def update
    respond_to do |format|
      if @belt.update(belt_params)
        format.html { redirect_to person_path(@belt.person.id), notice: "Belt was successfully updated." }
        format.json { render :show, status: :ok, location: @belt }
      else
        form_data
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

  def change_belt
    @belt = @belt.dup
    @belt.color = Belt.colors[@belt.color] + 1
    if @belt.save
      redirect_to edit_belt_path(@belt.person, @belt)
    else
      redirect_to person_path(@belt.person_id)
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

  def form_data
    @person_id = !@belt.nil? && @belt.persisted? ? @belt.person.id : params[:person_id]
    @modalities = Belt.modalities
    @colors = Belt.colors
  end

  def check_member_belt
    redirect_to person_path(params[:person_id]) if @belt.person_id != params[:person_id].to_i 
  end
end
