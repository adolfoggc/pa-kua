class StudentPlan < ApplicationRecord
  belongs_to :person
  belongs_to :tuition_fee
  belongs_to :discount
end
