class Discount < ApplicationRecord
  validates :discount_percentage, :starts_at, :kind_of_plan, presence: true

  enum kind_of_plan: {
    Mensal: 1,
    Trimestral: 3,
    Semestral: 6,
    Anual: 12
  }
end
