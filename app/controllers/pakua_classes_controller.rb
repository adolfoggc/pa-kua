class PakuaClassesController < ApplicationController
  before_action :set_pakua_class, only: %i[ show edit update destroy ]
  before_action :form_data, only: %i[new edit]

  # GET /pakua_classes or /pakua_classes.json
  def index
    @class_schedule = {}
    @classes = PakuaClass.all.order(hour: :asc, minutes: :asc, duration: :asc, modality: :asc) 
    return unless @classes.size.positive?

    @classes.each do |pkc|
      starts_at = Time.new('2021', 'jan', '11', pkc.hour, pkc.minutes)
      ends_at = starts_at + 60 * pkc.duration.to_i
      schedule_time = starts_at.strftime('%H:%M') + ' - ' + ends_at.strftime('%H:%M')
      @class_schedule[schedule_time] = set_blank_weekly_schedule unless @class_schedule.key?(schedule_time)
      @class_schedule[schedule_time][pkc.day_of_week] << { modality: pkc.modality } # insert another informations here
    end
  end

  # GET /pakua_classes/1 or /pakua_classes/1.json
  def show
  end

  # GET /pakua_classes/new
  def new
    @pakua_class = PakuaClass.new
  end

  # GET /pakua_classes/1/edit
  def edit
  end

  # POST /pakua_classes or /pakua_classes.json
  def create
    @pakua_class = PakuaClass.new(pakua_class_params)

    respond_to do |format|
      if @pakua_class.save
        format.html { redirect_to pakua_classes_path, notice: "Pakua class was successfully created." }
        format.json { render :show, status: :created, location: @pakua_class }
      else
        form_data
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @pakua_class.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pakua_classes/1 or /pakua_classes/1.json
  def update
    respond_to do |format|
      if @pakua_class.update(pakua_class_params)
        format.html { redirect_to  pakua_classes_path, notice: "Pakua class was successfully updated." }
        format.json { render :show, status: :ok, location: @pakua_class }
      else
        form_data
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @pakua_class.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pakua_classes/1 or /pakua_classes/1.json
  def destroy
    @pakua_class.destroy
    respond_to do |format|
      format.html { redirect_to pakua_classes_url, notice: "Pakua class was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_pakua_class
    @pakua_class = PakuaClass.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def pakua_class_params
    params.require(:pakua_class).permit(:modality, :day_of_week, :hour, :minutes, :duration)
  end

  def form_data
    @days_of_week = PakuaClass.day_of_weeks
    @modalities = PakuaClass.modalities
  end

  def set_blank_weekly_schedule
    weekly_schedule = {}
    PakuaClass.day_of_weeks.keys.each do |day_of_week|
      weekly_schedule[day_of_week] = []
    end
    weekly_schedule
  end
end
