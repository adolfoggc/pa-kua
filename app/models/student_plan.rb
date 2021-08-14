class StudentPlan < ApplicationRecord
  belongs_to :people
  belongs_to :tuition_fee
  belongs_to :discount
end
