require "test_helper"

class IngredientsPricesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ingredients_price = ingredients_prices(:one)
  end

  test "should get index" do
    get ingredients_prices_url
    assert_response :success
  end

  test "should get new" do
    get new_ingredients_price_url
    assert_response :success
  end

  test "should create ingredients_price" do
    assert_difference("IngredientsPrice.count") do
      post ingredients_prices_url, params: { ingredients_price: { cheese_price: @ingredients_price.cheese_price, ham_price: @ingredients_price.ham_price, name: @ingredients_price.name, pineapple_price: @ingredients_price.pineapple_price, sauce_price: @ingredients_price.sauce_price } }
    end

    assert_redirected_to ingredients_price_url(IngredientsPrice.last)
  end

  test "should show ingredients_price" do
    get ingredients_price_url(@ingredients_price)
    assert_response :success
  end

  test "should get edit" do
    get edit_ingredients_price_url(@ingredients_price)
    assert_response :success
  end

  test "should update ingredients_price" do
    patch ingredients_price_url(@ingredients_price), params: { ingredients_price: { cheese_price: @ingredients_price.cheese_price, ham_price: @ingredients_price.ham_price, name: @ingredients_price.name, pineapple_price: @ingredients_price.pineapple_price, sauce_price: @ingredients_price.sauce_price } }
    assert_redirected_to ingredients_price_url(@ingredients_price)
  end

  test "should destroy ingredients_price" do
    assert_difference("IngredientsPrice.count", -1) do
      delete ingredients_price_url(@ingredients_price)
    end

    assert_redirected_to ingredients_prices_url
  end
end
