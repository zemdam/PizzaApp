require "test_helper"

class PizzeriaPointsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pizzeria_point = pizzeria_points(:one)
  end

  test "should get index" do
    get pizzeria_points_url
    assert_response :success
  end

  test "should get new" do
    get new_pizzeria_point_url
    assert_response :success
  end

  test "should create pizzeria_point" do
    assert_difference("PizzeriaPoint.count") do
      post pizzeria_points_url, params: { pizzeria_point: { ingredients_price_id: @pizzeria_point.ingredients_price_id, name: @pizzeria_point.name } }
    end

    assert_redirected_to pizzeria_point_url(PizzeriaPoint.last)
  end

  test "should show pizzeria_point" do
    get pizzeria_point_url(@pizzeria_point)
    assert_response :success
  end

  test "should get edit" do
    get edit_pizzeria_point_url(@pizzeria_point)
    assert_response :success
  end

  test "should update pizzeria_point" do
    patch pizzeria_point_url(@pizzeria_point), params: { pizzeria_point: { ingredients_price_id: @pizzeria_point.ingredients_price_id, name: @pizzeria_point.name } }
    assert_redirected_to pizzeria_point_url(@pizzeria_point)
  end

  test "should destroy pizzeria_point" do
    assert_difference("PizzeriaPoint.count", -1) do
      delete pizzeria_point_url(@pizzeria_point)
    end

    assert_redirected_to pizzeria_points_url
  end
end
