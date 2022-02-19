class TuitionFeesController < ApplicationController
  before_action :set_tuition_fee, only: %i[ show edit update destroy ]

  # GET /tuition_fees or /tuition_fees.json
  def index
    current_tuition_fee_table
    @tuition_fees = TuitionFee.all - @current_tuition_fee
  end

  # GET /tuition_fees/1 or /tuition_fees/1.json
  def show
  end

  # GET /tuition_fees/new
  def new
    @tuition_fee = TuitionFee.new
  end

  # GET /tuition_fees/1/edit
  def edit
  end

  # POST /tuition_fees or /tuition_fees.json
  def create
    @tuition_fee = TuitionFee.new(tuition_fee_params)

    respond_to do |format|
      if @tuition_fee.save
        format.html { redirect_to tuition_fees_path, notice: 'O Plano foi criado' }
        format.json { render :show, status: :created, location: @tuition_fee }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tuition_fee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tuition_fees/1 or /tuition_fees/1.json
  def update
    respond_to do |format|
      if @tuition_fee.update(tuition_fee_params)
        format.html { redirect_to tuition_fees_path, notice: 'O Plano foi alterado com sucesso' }
        format.json { render :show, status: :ok, location: @tuition_fee }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tuition_fee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tuition_fees/1 or /tuition_fees/1.json
  def destroy
    @tuition_fee.destroy
    respond_to do |format|
      format.html { redirect_to tuition_fees_url, notice: "Tuition fee was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tuition_fee
      @tuition_fee = TuitionFee.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tuition_fee_params
      params.require(:tuition_fee).permit(:weekly_classes, :fee, :validity)
    end
end
