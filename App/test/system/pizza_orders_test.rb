require "application_system_test_case"

class PizzaOrdersTest < ApplicationSystemTestCase
  setup do
    @pizza_order = pizza_orders(:one)
  end

  test "visiting the index" do
    visit pizza_orders_url
    assert_selector "h1", text: "Pizza orders"
  end

  test "should create pizza order" do
    visit pizza_orders_url
    click_on "New pizza order"

    fill_in "Adress", with: @pizza_order.adress_id
    fill_in "Ingredients multiplayer", with: @pizza_order.ingredients_multiplayer
    fill_in "Pizza size", with: @pizza_order.pizza_size_id
    fill_in "Pizza type", with: @pizza_order.pizza_type_id
    fill_in "Pizzeria point", with: @pizza_order.pizzeria_point_id
    click_on "Create Pizza order"

    assert_text "Pizza order was successfully created"
    click_on "Back"
  end

  test "should update Pizza order" do
    visit pizza_order_url(@pizza_order)
    click_on "Edit this pizza order", match: :first

    fill_in "Adress", with: @pizza_order.adress_id
    fill_in "Ingredients multiplayer", with: @pizza_order.ingredients_multiplayer
    fill_in "Pizza size", with: @pizza_order.pizza_size_id
    fill_in "Pizza type", with: @pizza_order.pizza_type_id
    fill_in "Pizzeria point", with: @pizza_order.pizzeria_point_id
    click_on "Update Pizza order"

    assert_text "Pizza order was successfully updated"
    click_on "Back"
  end

  test "should destroy Pizza order" do
    visit pizza_order_url(@pizza_order)
    click_on "Destroy this pizza order", match: :first

    assert_text "Pizza order was successfully destroyed"
  end
end
