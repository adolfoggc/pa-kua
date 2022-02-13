# frozen_string_literal: true

# General dashboard actions
class DashboardController < ApplicationController
  layout :set_view_layout

  def index
    get_people_data
  end

  def example
  end

  private
  def set_view_layout
    return 'example_sb_admin2' if action_name == 'example'

    'sb_admin2'
  end
end
