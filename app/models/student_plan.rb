class StudentPlan < ApplicationRecord
  belongs_to :person

  def monthly_fee
    current_tuition_fee.fee
  end

  def percentage
    current_discount.discount_percentage
  end

  private

  def current_tuition_fee
    TuitionFee.where(weekly_classes: weekly_classes).order(validity: 'DESC').first
  end

  def current_discount
    Discount.where(kind_of_plan: kind_of_plan).order(starts_at: 'DESC').first
  end
end
