require "application_system_test_case"

class PizzaSizesTest < ApplicationSystemTestCase
  setup do
    @pizza_size = pizza_sizes(:one)
  end

  test "visiting the index" do
    visit pizza_sizes_url
    assert_selector "h1", text: "Pizza sizes"
  end

  test "should create pizza size" do
    visit pizza_sizes_url
    click_on "New pizza size"

    fill_in "Basic price", with: @pizza_size.basic_price
    fill_in "P size", with: @pizza_size.p_size
    click_on "Create Pizza size"

    assert_text "Pizza size was successfully created"
    click_on "Back"
  end

  test "should update Pizza size" do
    visit pizza_size_url(@pizza_size)
    click_on "Edit this pizza size", match: :first

    fill_in "Basic price", with: @pizza_size.basic_price
    fill_in "P size", with: @pizza_size.p_size
    click_on "Update Pizza size"

    assert_text "Pizza size was successfully updated"
    click_on "Back"
  end

  test "should destroy Pizza size" do
    visit pizza_size_url(@pizza_size)
    click_on "Destroy this pizza size", match: :first

    assert_text "Pizza size was successfully destroyed"
  end
end
