class PakuaClassesController < ApplicationController
  before_action :set_pakua_class, only: %i[ show edit update destroy ]

  # GET /pakua_classes or /pakua_classes.json
  def index
    @pakua_classes = PakuaClass.all
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
        format.html { redirect_to @pakua_class, notice: "Pakua class was successfully created." }
        format.json { render :show, status: :created, location: @pakua_class }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @pakua_class.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pakua_classes/1 or /pakua_classes/1.json
  def update
    respond_to do |format|
      if @pakua_class.update(pakua_class_params)
        format.html { redirect_to @pakua_class, notice: "Pakua class was successfully updated." }
        format.json { render :show, status: :ok, location: @pakua_class }
      else
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
end
