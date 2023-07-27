require "application_system_test_case"

class AdressesTest < ApplicationSystemTestCase
  setup do
    @adress = adresses(:one)
  end

  test "visiting the index" do
    visit adresses_url
    assert_selector "h1", text: "Adresses"
  end

  test "should create adress" do
    visit adresses_url
    click_on "New adress"

    fill_in "City", with: @adress.city
    fill_in "Name", with: @adress.name
    fill_in "Street name", with: @adress.street_name
    fill_in "Street number", with: @adress.street_number
    click_on "Create Adress"

    assert_text "Adress was successfully created"
    click_on "Back"
  end

  test "should update Adress" do
    visit adress_url(@adress)
    click_on "Edit this adress", match: :first

    fill_in "City", with: @adress.city
    fill_in "Name", with: @adress.name
    fill_in "Street name", with: @adress.street_name
    fill_in "Street number", with: @adress.street_number
    click_on "Update Adress"

    assert_text "Adress was successfully updated"
    click_on "Back"
  end

  test "should destroy Adress" do
    visit adress_url(@adress)
    click_on "Destroy this adress", match: :first

    assert_text "Adress was successfully destroyed"
  end
end
