class StudentsController < ApplicationController
  before_action :set_person, only: %i[show edit update destroy]
  before_action :roles_data, only: %i[new edit update]

  # GET /people or /people.json
  def index
    @students = Person.student.or(Person.open_class_student.or(Person.student_and_instructor))
  end

  # GET /people/1 or /people/1.json
  def show
  end

  # GET /people/new
  def new
    @person = Person.new
    @view_action = 'Novo Membro'
  end

  # GET /people/1/edit
  def edit
    @view_action = 'Editar Membro'
  end

  # POST /people or /people.json
  def create
    @person = Person.new(person_params)

    respond_to do |format|
      if @person.save
        format.html { redirect_to people_path, notice: "Person was successfully created." }
        format.json { render :show, status: :created, location: @person }
      else
        roles_data
        @view_action = 'Novo Membro'
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /people/1 or /people/1.json
  def update
    respond_to do |format|
      if @person.update(person_params)
        format.html { redirect_to people_path, notice: "Person was successfully updated." }
        format.json { render :show, status: :ok, location: @person }
      else
        roles_data
        @view_action = 'Editar Membro'
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /people/1 or /people/1.json
  def destroy
    @person.destroy
    respond_to do |format|
      format.html { redirect_to people_url, notice: "Person was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_person
    @person = Person.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def person_params
    params.require(:person).permit(:name, :address, :birthdate, :phone, :cpf, :role, :start_date)
  end

  def roles_data
    @roles = { aluno: 1, aluno_de_aula_inaugural: 2, aluno_e_instrutor: 3 }
  end
end
