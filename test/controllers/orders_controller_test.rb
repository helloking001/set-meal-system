require "test_helper"

class OrdersControllerTest < ActionDispatch::IntegrationTest
  test "order create" do
    set_meal = SetMeal.create(description: :test)
    params = {set_meal_id: set_meal.id}
    assert_difference('Order.count') do
      post '/orders', params: params, as: :json
      assert_response :ok
      assert_equal Order.first.user_id, User.first.id
    end
  end
end