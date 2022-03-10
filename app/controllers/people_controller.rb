# frozen_string_literal: true

# Manipulation of people data
class PeopleController < ApplicationController
  before_action :set_person, only: %i[show edit update destroy edit_information]
  before_action :roles_data, only: %i[new edit update]
  before_action :payment_data, only: %i[show]
  before_action :belts_data, only: %i[show]

  # GET /people or /people.json
  def index
    get_people_data
  end

  # GET /people/1 or /people/1.json
  def show
    @any_pakua_class = PakuaClass.first
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
    if params[:information].blank? || params[:information].nil?
      return_path = people_path
    else
      return_path = person_path(@person)
    end
    respond_to do |format|
      if @person.save
        format.html { redirect_to return_path, notice: "Person was successfully created." }
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
        format.html { redirect_to person_path(@person), notice: "Person was successfully updated." }
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

  def edit_information
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_person
    @person = Person.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def person_params
    params.require(:person).permit(:name, :address, :birthdate, :phone, :cpf, :role, :start_date, :information)
  end

  def roles_data
    @roles = { aluno: 1, aluno_de_aula_inaugural: 2, aluno_e_instrutor: 3, instrutor: 4, instrutor_intinerante: 5 }
  end

  def payment_data
    return unless @person.pakua_student?

    @today = Date.today
    #REFACTOR
    payments = @person.payments.where(':start_date <= due_date and due_date <= :end_date', {start_date: Date.new(@today.year, 1, 1), end_date: Date.new(@today.year, 12, 31)})
    @months_and_status = {  jan: { style: '' }, fev: { style: '' }, mar: { style: '' }, abr: { style: '' }, mai: { style: '' }, jun: { style: '' },
                            jul: { style: '' }, ago: { style: '' }, set: { style: '' }, out: { style: '' }, nov: { style: '' }, dez: { style: '' } }
    payments.each do |p|
      @payment = p if @today.month == p.due_date.month
      case p.due_date.month
      when 1
        @months_and_status[:jan] = { id: p.id, style: get_month_style(p) }
      when 2
        @months_and_status[:fev] = { id: p.id, style: get_month_style(p) }
      when 3
        @months_and_status[:mar] = { id: p.id, style: get_month_style(p) }
      when 4
        @months_and_status[:abr] = { id: p.id, style: get_month_style(p) }
      when 5
        @months_and_status[:mai] = { id: p.id, style: get_month_style(p) }
      when 6
        @months_and_status[:jun] = { id: p.id, style: get_month_style(p) }
      when 7
        @months_and_status[:jul] = { id: p.id, style: get_month_style(p) }
      when 8
        @months_and_status[:ago] = { id: p.id, style: get_month_style(p) }
      when 9
        @months_and_status[:set] = { id: p.id, style: get_month_style(p) }
      when 10
        @months_and_status[:out] = { id: p.id, style: get_month_style(p) }
      when 11
        @months_and_status[:nov] = { id: p.id, style: get_month_style(p) }
      else
        @months_and_status[:dez] = { id: p.id, style: get_month_style(p) }
      end
    end
  end

  def belts_data
    @belts = {  acrobacia: nil, armas_de_corte: nil, arqueria: nil,
                arte_marcial: nil, ritmo: nil, tai_chi_pa_kua: nil, yoga: nil}
    belts = @person.belts.order(color: :desc, modality: :asc, start_date: :desc)
    return unless belts.any?

    belts.each do |belt|
      @belts[belt.modality.to_sym] = belt if @belts[belt.modality.to_sym].nil?
    end
  end

  def get_month_style(payment)
    if payment.due_date.month == @today.month
      'bg-primary text-white'
    elsif payment.paid?
      'bg-success text-white'
    else
      'bg-danger text-white'
    end
  end
end
