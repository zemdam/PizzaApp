require "application_system_test_case"

class PizzaTypesTest < ApplicationSystemTestCase
  setup do
    @pizza_type = pizza_types(:one)
  end

  test "visiting the index" do
    visit pizza_types_url
    assert_selector "h1", text: "Pizza types"
  end

  test "should create pizza type" do
    visit pizza_types_url
    click_on "New pizza type"

    fill_in "Name", with: @pizza_type.name
    fill_in "Required cheese", with: @pizza_type.required_cheese
    fill_in "Required ham", with: @pizza_type.required_ham
    fill_in "Required pineapple", with: @pizza_type.required_pineapple
    fill_in "Required sauce", with: @pizza_type.required_sauce
    click_on "Create Pizza type"

    assert_text "Pizza type was successfully created"
    click_on "Back"
  end

  test "should update Pizza type" do
    visit pizza_type_url(@pizza_type)
    click_on "Edit this pizza type", match: :first

    fill_in "Name", with: @pizza_type.name
    fill_in "Required cheese", with: @pizza_type.required_cheese
    fill_in "Required ham", with: @pizza_type.required_ham
    fill_in "Required pineapple", with: @pizza_type.required_pineapple
    fill_in "Required sauce", with: @pizza_type.required_sauce
    click_on "Update Pizza type"

    assert_text "Pizza type was successfully updated"
    click_on "Back"
  end

  test "should destroy Pizza type" do
    visit pizza_type_url(@pizza_type)
    click_on "Destroy this pizza type", match: :first

    assert_text "Pizza type was successfully destroyed"
  end
end
