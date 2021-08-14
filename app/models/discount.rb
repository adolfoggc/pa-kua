class Discount < ApplicationRecord
  enum kind_of_plan: {
    mensal: 1,
    bimestral: 2,
    semestral: 6,
    anual: 12
  }
end
