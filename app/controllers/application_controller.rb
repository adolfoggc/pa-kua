# frozen_string_literal: true
class ApplicationController < ActionController::Base
  layout 'adminlte3' unless %w[sessions].include?(controller_name) 
  before_action :authenticate_member!

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

  def current_tuition_fee_table
    valid_tuition_fees = TuitionFee.where('validity <= :today', today: Date.today).order(:weekly_classes)
    weekly_classes = valid_tuition_fees.select(:weekly_classes).distinct.map(&:weekly_classes)
    tuition_fees_by_classes = {}
    weekly_classes.each do |weekly_class|
      tuition_fees_by_classes[weekly_class] = nil
    end

    valid_tuition_fees.order(validity: 'DESC', id: 'DESC').each do |tf|
      tuition_fees_by_classes[tf.weekly_classes] = tf if tuition_fees_by_classes[tf.weekly_classes].nil?
      break unless tuition_fees_by_classes.value?(nil)
    end

    @current_tuition_fee = tuition_fees_by_classes.map {|k,v| v}
  end
end
