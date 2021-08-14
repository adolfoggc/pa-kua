class Discount < ApplicationRecord
  validates :discount_percentage, :starts_at, :kind_of_plan, presence: true

  enum kind_of_plan: {
    mensal: 1,
    bimestral: 2,
    semestral: 6,
    anual: 12
  }
end
