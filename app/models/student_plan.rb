class StudentPlan < ApplicationRecord
  belongs_to :person
  has_many :payments

  validates :due_day, :weekly_classes, :rent_inclusion, :kind_of_plan, presence: true

  def monthly_fee
    current_tuition_fee.fee
  end

  def percentage
    current_discount.discount_percentage
  end

  def current_tuition_fee
    TuitionFee.where(weekly_classes: weekly_classes).order(validity: 'DESC').first
  end

  def current_discount
    Discount.where(kind_of_plan: kind_of_plan).order(starts_at: 'DESC').first
  end

  def final_tuition_fee
    ((100.0 - percentage)/100) * monthly_fee
  end
end
