# frozen_string_literal: true
class ApplicationController < ActionController::Base
  layout 'adminlte3'

  def get_people_data
    @people = []
    @students = []
    @instructors = []
    @inactive = []
    @traveling_instructor = []
    Person.all.each do |p|
      @students << p if p.pakua_student?
      @instructors << p if p.pakua_instructor?
      @inactive << p if p.inactive?
      @traveling_instructor << p if p.traveling_instructor?
      @people << p
    end
  end
end
