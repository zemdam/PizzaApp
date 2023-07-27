require "application_system_test_case"

class PizzeriaPointsTest < ApplicationSystemTestCase
  setup do
    @pizzeria_point = pizzeria_points(:one)
  end

  test "visiting the index" do
    visit pizzeria_points_url
    assert_selector "h1", text: "Pizzeria points"
  end

  test "should create pizzeria point" do
    visit pizzeria_points_url
    click_on "New pizzeria point"

    fill_in "Ingredients price", with: @pizzeria_point.ingredients_price_id
    fill_in "Name", with: @pizzeria_point.name
    click_on "Create Pizzeria point"

    assert_text "Pizzeria point was successfully created"
    click_on "Back"
  end

  test "should update Pizzeria point" do
    visit pizzeria_point_url(@pizzeria_point)
    click_on "Edit this pizzeria point", match: :first

    fill_in "Ingredients price", with: @pizzeria_point.ingredients_price_id
    fill_in "Name", with: @pizzeria_point.name
    click_on "Update Pizzeria point"

    assert_text "Pizzeria point was successfully updated"
    click_on "Back"
  end

  test "should destroy Pizzeria point" do
    visit pizzeria_point_url(@pizzeria_point)
    click_on "Destroy this pizzeria point", match: :first

    assert_text "Pizzeria point was successfully destroyed"
  end
end
