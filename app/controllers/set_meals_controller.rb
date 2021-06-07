class SetMealsController < ApplicationController
  def popular_set_meals
    popular_set_meals_with_count_array = Order.group(:set_meal_id).count.sort_by{|key, value| value}.reverse[0..9]
    set_meal_hash = SetMeal.where(id: popular_set_meals_with_count_array.to_h.keys).group_by(&:id)
    res = {popular_set_meals_with_count_array: popular_set_meals_with_count_array, set_meal_hash: set_meal_hash}
    response_json res
  end
end
