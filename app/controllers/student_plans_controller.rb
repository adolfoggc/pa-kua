class StudentPlansController < ApplicationController
  before_action :set_person, only: %i[show edit update destroy]
  before_action :set_student_plan, only: %i[show edit update destroy]
  before_action :block_if_plan_is_nil, except: %i[index new create]
  before_action :form_data, only: %i[new edit]

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
        format.html { redirect_to person_path(@student_plan.person), notice: "Student plan was successfully created." }
        format.json { render :show, status: :created, location: @student_plan }
      else
        form_data
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @student_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /student_plans/1 or /student_plans/1.json
  def update
    respond_to do |format|
      if @student_plan.update(student_plan_params)
        format.html { redirect_to person_path(@student_plan.person), notice: "Student plan was successfully updated." }
        format.json { render :show, status: :ok, location: @student_plan }
      else
        form_data
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

  # Use callbacks to share common setup or constraints between actions.
  private

  def set_person
    @person = Person.find(params[:person_id])
  end

  def set_student_plan
    @student_plan = @person.student_plan
  end

  def block_if_plan_is_nil
    if @student_plan.nil?
      msg = ''
      if @person.pakua_student?
        msg = 'Membro não possui plano'
      else
        msg = 'Apenas alunos possuem plano'
      end
      retirect_to people_path(@student_plans.people_id), notice: msg
    end
  end

  # Only allow a list of trusted parameters through.
  def student_plan_params
    params.require(:student_plan).permit(:person_id, :weekly_classes, :kind_of_plan, :rent_inclusion, :due_day)
  end

  def form_data
    if !@student_plan.nil?
      @person_id = !@student_plan.person.nil? ? @student_plan.person.id : params[:person_id]
    else
      @person_id = params[:person_id]
    end
    @view_action = %w[new create].include?(action_name) ? 'Novo Plano' : 'Editar Plano' 
    @discounts = Discount.kind_of_plans
    @weekly_classes = {}
    TuitionFee.all.select(:weekly_classes).each do |wc|
      if wc.weekly_classes.zero?
        @weekly_classes['Plano Livre'] = 0
      elsif wc.weekly_classes == 1
        @weekly_classes[(wc.weekly_classes.to_s + ' ' + 'aula'.pluralize(wc.weekly_classes) + ' ' + 'semanal'.pluralize(wc.weekly_classes)).to_sym] = wc.weekly_classes
      else
        @weekly_classes["#{wc.weekly_classes} aulas semanais"] = wc.weekly_classes
      end
    end
    @weekly_classes
  end
end
