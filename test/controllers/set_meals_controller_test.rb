require "test_helper"

class SetMealsControllerTest < ActionDispatch::IntegrationTest
  setup  do
    20.times do |i|
      SetMeal.create(description: "#{i}_set_meal")
    end
    user = User.first
    20.times do |i|
      set_meal = SetMeal.find_by_description("#{i}_set_meal")
      i.times do
        Order.create(set_meal_id: set_meal.id, user_id: user.id)
      end
    end
  end
  test "popular_set_meals" do
    get '/set_meals/popular_set_meals'
    assert_response :ok
    assert_equal json_res['data']['popular_set_meals_with_count_array'].first[1], 19
    set_meal = SetMeal.find_by_description("19_set_meal")
    assert_equal json_res['data']['set_meal_hash'][set_meal.id.to_s].first['description'], set_meal.description
  end

end
