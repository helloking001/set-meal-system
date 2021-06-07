require "test_helper"

class GroupOrdersControllerTest < ActionDispatch::IntegrationTest
  setup  do
    Cutoff.create(
      time: Time.zone.local(2021, 6, 9),
      daylight_saving_begin: Time.zone.local(2021, 3, 1),
      daylight_saving_end: Time.zone.local(2021, 10, 1)
    )
    set_meal = SetMeal.create(description: :test_set_meal)
    user = User.first
    @order_1 = Order.create(set_meal_id: set_meal.id, user_id: user.id, created_at: Time.zone.local(2021, 6, 10))
    @order_2 = Order.create(set_meal_id: set_meal.id, user_id: user.id, created_at: Time.zone.local(2021, 6, 7))
    @order_3 = Order.create(set_meal_id: set_meal.id, user_id: user.id, created_at: Time.zone.local(2021, 6, 6))
    @order_3 = Order.create(set_meal_id: set_meal.id, user_id: user.id, created_at: Time.zone.local(2021, 6, 1))

  end

  test "current_group_orders" do
    get '/group_orders/current_group_orders', as: :json
    assert_response :ok
    assert_equal json_res['data'].count, 2
    assert_equal json_res['data'][0]['id'], @order_2.id
  end

  test "search group_orders_by_offset_weeks" do
    params = {
      offset_weeks: -1
    }
    get '/group_orders/group_orders', params: params
    assert_response :ok
    assert_equal json_res['data'].count, 1
    assert_equal json_res['data'][0]['id'], @order_3.id

  end
end
