require "application_system_test_case"

class StoragesTest < ApplicationSystemTestCase
  setup do
    @storage = storages(:one)
  end

  test "visiting the index" do
    visit storages_url
    assert_selector "h1", text: "Storages"
  end

  test "should create storage" do
    visit storages_url
    click_on "New storage"

    fill_in "Available cheese", with: @storage.available_cheese
    fill_in "Available ham", with: @storage.available_ham
    fill_in "Available pineapple", with: @storage.available_pineapple
    fill_in "Available sauce", with: @storage.available_sauce
    fill_in "Name", with: @storage.name
    fill_in "Pizzeria point", with: @storage.pizzeria_point_id
    click_on "Create Storage"

    assert_text "Storage was successfully created"
    click_on "Back"
  end

  test "should update Storage" do
    visit storage_url(@storage)
    click_on "Edit this storage", match: :first

    fill_in "Available cheese", with: @storage.available_cheese
    fill_in "Available ham", with: @storage.available_ham
    fill_in "Available pineapple", with: @storage.available_pineapple
    fill_in "Available sauce", with: @storage.available_sauce
    fill_in "Name", with: @storage.name
    fill_in "Pizzeria point", with: @storage.pizzeria_point_id
    click_on "Update Storage"

    assert_text "Storage was successfully updated"
    click_on "Back"
  end

  test "should destroy Storage" do
    visit storage_url(@storage)
    click_on "Destroy this storage", match: :first

    assert_text "Storage was successfully destroyed"
  end
end
