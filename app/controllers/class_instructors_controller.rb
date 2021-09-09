class ClassInstructorsController < ApplicationController
  before_action :set_class_instructor, only: %i[ show edit update destroy ]

  # GET /class_instructors or /class_instructors.json
  def index
    @class_instructors = ClassInstructor.all
  end

  # GET /class_instructors/1 or /class_instructors/1.json
  def show
  end

  # GET /class_instructors/new
  def new
    @class_instructor = ClassInstructor.new
  end

  # GET /class_instructors/1/edit
  def edit
  end

  # POST /class_instructors or /class_instructors.json
  def create
    @class_instructor = ClassInstructor.new(class_instructor_params)

    respond_to do |format|
      if @class_instructor.save
        format.html { redirect_to @class_instructor, notice: "Class instructor was successfully created." }
        format.json { render :show, status: :created, location: @class_instructor }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @class_instructor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /class_instructors/1 or /class_instructors/1.json
  def update
    respond_to do |format|
      if @class_instructor.update(class_instructor_params)
        format.html { redirect_to @class_instructor, notice: "Class instructor was successfully updated." }
        format.json { render :show, status: :ok, location: @class_instructor }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @class_instructor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /class_instructors/1 or /class_instructors/1.json
  def destroy
    @class_instructor.destroy
    respond_to do |format|
      format.html { redirect_to class_instructors_url, notice: "Class instructor was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_class_instructor
      @class_instructor = ClassInstructor.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def class_instructor_params
      params.require(:class_instructor).permit(:instructor, :pakua_class_id)
    end
end
