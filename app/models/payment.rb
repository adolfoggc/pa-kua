class Payment < ApplicationRecord
  belongs_to :student_plan
  has_one :person, through: :student_plan

  attribute :paid_fee, default: 0

  before_save :update_payment_status

  scope :current, -> { where(:due_date => Payment.new.beginning_of_month..Payment.new.end_of_month)}
  scope :not_current, -> { where.not(:due_date => Payment.new.beginning_of_month..Payment.new.end_of_month)}
  scope :not_paid, -> { not_current.where('paid_fee < payment_fee')}

  def student_name
    person.name
  end

  def totaly_paid?
    payment_fee == paid_fee.to_f
  end

  def payment_status
    totaly_paid? ? 'Pago' : "Resta #{to_money(payment_fee - paid_fee.to_f)}"
  end

  def today
    Date.today
  end

  def beginning_of_month
    Date.new(today.year, today.month, 1)
  end

  def end_of_month
    Date.new(today.year, today.month + 1, 1) - 1.day
  end

  def to_br(value)
    str_value = value.to_s
    str_value += '0' if (((value % 1) * 10) % 1).zero?
    str_value.gsub!('.', ',')
  end

  def to_money(cash)
    "R$ #{to_br(cash)}"
  end

  def payment_is_late?
    this_day = today
    return true if !self.paid? && this_day > Date.new(this_day.year, this_day.month, student_plan.due_day) 

    false
  end

  private
  def update_payment_status
    self.paid = true if paid_fee.to_f == student_plan.final_tuition_fee.to_f || self.paid?
  end
end
