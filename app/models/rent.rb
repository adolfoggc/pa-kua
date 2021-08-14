class Rent < ApplicationRecord
  validates :rental_amount, :starts_at, presence: true
end
