# frozen_string_literal: true

# General dashboard actions
class DashboardController < ApplicationController
  layout :set_view_layout

  def index
    get_people_data
  end

  def example
    @charts = 1
  end

  def administrative_index
    current_tuition_fee_table
    current_discounts
    current_rent_fee
  end

  def welcome
  end

  def welcome_back
  end

  private
  def set_view_layout
    return 'example_sb_admin2' if action_name == 'example'

    %w[welcome welcome_back].include?(action_name) ?  'application' : 'sb_admin2'
  end
end
