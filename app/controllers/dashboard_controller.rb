# frozen_string_literal: true

# General dashboard actions
class DashboardController < ApplicationController
  layout 'example_sb_admin2', only: :example

  def index
    get_people_data
  end

  def example
  end
end
