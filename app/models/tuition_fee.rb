class TuitionFee < ApplicationRecord
  validates :weekly_classes, :fee, :validity, presence: true
end
