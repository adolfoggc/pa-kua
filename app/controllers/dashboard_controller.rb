# frozen_string_literal: true

# General dashboard actions
class DashboardController < ApplicationController
  def index
    get_people_data
  end
end
