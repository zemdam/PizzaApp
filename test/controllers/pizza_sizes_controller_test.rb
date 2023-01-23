require "test_helper"

class PizzaSizesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pizza_size = pizza_sizes(:one)
  end

  test "should get index" do
    get pizza_sizes_url
    assert_response :success
  end

  test "should get new" do
    get new_pizza_size_url
    assert_response :success
  end

  test "should create pizza_size" do
    assert_difference("PizzaSize.count") do
      post pizza_sizes_url, params: { pizza_size: { basic_price: @pizza_size.basic_price, p_size: @pizza_size.p_size } }
    end

    assert_redirected_to pizza_size_url(PizzaSize.last)
  end

  test "should show pizza_size" do
    get pizza_size_url(@pizza_size)
    assert_response :success
  end

  test "should get edit" do
    get edit_pizza_size_url(@pizza_size)
    assert_response :success
  end

  test "should update pizza_size" do
    patch pizza_size_url(@pizza_size), params: { pizza_size: { basic_price: @pizza_size.basic_price, p_size: @pizza_size.p_size } }
    assert_redirected_to pizza_size_url(@pizza_size)
  end

  test "should destroy pizza_size" do
    assert_difference("PizzaSize.count", -1) do
      delete pizza_size_url(@pizza_size)
    end

    assert_redirected_to pizza_sizes_url
  end
end
