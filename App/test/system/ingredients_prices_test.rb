require "application_system_test_case"

class IngredientsPricesTest < ApplicationSystemTestCase
  setup do
    @ingredients_price = ingredients_prices(:one)
  end

  test "visiting the index" do
    visit ingredients_prices_url
    assert_selector "h1", text: "Ingredients prices"
  end

  test "should create ingredients price" do
    visit ingredients_prices_url
    click_on "New ingredients price"

    fill_in "Cheese price", with: @ingredients_price.cheese_price
    fill_in "Ham price", with: @ingredients_price.ham_price
    fill_in "Name", with: @ingredients_price.name
    fill_in "Pineapple price", with: @ingredients_price.pineapple_price
    fill_in "Sauce price", with: @ingredients_price.sauce_price
    click_on "Create Ingredients price"

    assert_text "Ingredients price was successfully created"
    click_on "Back"
  end

  test "should update Ingredients price" do
    visit ingredients_price_url(@ingredients_price)
    click_on "Edit this ingredients price", match: :first

    fill_in "Cheese price", with: @ingredients_price.cheese_price
    fill_in "Ham price", with: @ingredients_price.ham_price
    fill_in "Name", with: @ingredients_price.name
    fill_in "Pineapple price", with: @ingredients_price.pineapple_price
    fill_in "Sauce price", with: @ingredients_price.sauce_price
    click_on "Update Ingredients price"

    assert_text "Ingredients price was successfully updated"
    click_on "Back"
  end

  test "should destroy Ingredients price" do
    visit ingredients_price_url(@ingredients_price)
    click_on "Destroy this ingredients price", match: :first

    assert_text "Ingredients price was successfully destroyed"
  end
end
