class StudentPlansController < ApplicationController
  before_action :set_student_plan, only: %i[ show edit update destroy ]

  # GET /student_plans or /student_plans.json
  def index
    @student_plans = StudentPlan.all
  end

  # GET /student_plans/1 or /student_plans/1.json
  def show
  end

  # GET /student_plans/new
  def new
    @student_plan = StudentPlan.new
  end

  # GET /student_plans/1/edit
  def edit
  end

  # POST /student_plans or /student_plans.json
  def create
    @student_plan = StudentPlan.new(student_plan_params)

    respond_to do |format|
      if @student_plan.save
        format.html { redirect_to people_path(@student_plans.people_id), notice: "Student plan was successfully created." }
        format.json { render :show, status: :created, location: @student_plan }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @student_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /student_plans/1 or /student_plans/1.json
  def update
    respond_to do |format|
      if @student_plan.update(student_plan_params)
        format.html { redirect_to people_path(@student_plans.people_id), notice: "Student plan was successfully updated." }
        format.json { render :show, status: :ok, location: @student_plan }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @student_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /student_plans/1 or /student_plans/1.json
  def destroy
    @student_plan.destroy
    respond_to do |format|
      format.html { redirect_to student_plans_url, notice: "Student plan was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student_plan
      @student_plan = StudentPlan.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def student_plan_params
      params.require(:student_plan).permit(:people_id, :tuition_fee_id, :discount_id, :rent_inclusion, :due_day)
    end
end
