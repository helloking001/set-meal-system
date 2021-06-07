class OrdersController < ApplicationController
  def create
    params.require(:set_meal_id)
    set_meal = SetMeal.find(params[:set_meal_id])
    order = Order.new(user_id: current_user.id, set_meal_id: set_meal.id)

    if order.save
      render json: order.as_json, status: 200
    else
      render json: order.errors, status: :unprocessable_entity
    end
  end





end
