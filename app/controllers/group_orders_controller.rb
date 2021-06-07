class GroupOrdersController < ApplicationController
  include CalcGroupDayRangeService
  def current_group_orders
    response_json get_group_orders
  end

  def group_orders
    response_json get_group_orders(offset_weeks: params[:offset_weeks].to_i)
  end

  private
  def get_group_orders(offset_weeks: 0)
    begin_time, end_time = CalcGroupDayRangeService::Calc.new(Cutoff.first).current_cut_off_week(offset_weeks: offset_weeks)
    Order.by_begin_time_and_end_time(begin_time, end_time)
  end
end
