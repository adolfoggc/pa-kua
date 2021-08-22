class PlansController < ApplicationController
  def index
    current_tuition_fee_table
    current_discounts
    current_rent_fee
  end
end
