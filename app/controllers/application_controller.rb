# frozen_string_literal: true
class ApplicationController < ActionController::Base
  layout 'adminlte3' unless %w[sessions].include?(controller_name) 
  before_action :authenticate_member!

  def get_people_data
    @people = []
    @students = []
    @instructors = []
    @traveling_instructor = []
    Person.all.each do |p|
      @students << p if p.pakua_student?
      @instructors << p if p.pakua_instructor?
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

    @starting_date_for_current_fees = nil
    valid_tuition_fees.order(validity: 'DESC', id: 'DESC').each do |tf|
      @starting_date_for_current_fees = tf.validity if @starting_date_for_current_fees.nil?
      tuition_fees_by_classes[tf.weekly_classes] = tf if tuition_fees_by_classes[tf.weekly_classes].nil?
      break unless tuition_fees_by_classes.value?(nil)
    end
    @current_tuition_fee = tuition_fees_by_classes.map { |_, v| v } #k is not used
  end

  def current_rent_fee
    @current_rental_fee = Rent.all.order(starts_at: 'DESC').first
  end

  def current_discounts
    valid_discounts = Discount.where('starts_at <= :today', today: Date.today).order(:kind_of_plan)
    kinds_of_plan = valid_discounts.select(:kind_of_plan).distinct.map(&:kind_of_plan)
    kinds_of_discounts = {}
    kinds_of_plan.each do |kind_of_plan|
      kinds_of_discounts[kind_of_plan] = nil
    end

    @starting_date_for_current_discount = nil
    valid_discounts.order(starts_at: 'DESC', id: 'DESC').each do |vd|
      @starting_date_for_current_discount = vd.starts_at if @starting_date_for_current_discount.nil?
      kinds_of_discounts[vd.kind_of_plan] = vd if kinds_of_discounts[vd.kind_of_plan].nil?
      break unless kinds_of_discounts.value?(nil)
    end
    @current_discounts = kinds_of_discounts.map { |_, v| v } #k is not used
  end
end
