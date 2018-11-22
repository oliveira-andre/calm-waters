require "application_system_test_case"

class TanksTest < ApplicationSystemTestCase
  setup do
    @tank = tanks(:one)
  end

  test "visiting the index" do
    visit tanks_url
    assert_selector "h1", text: "Tanks"
  end

  test "creating a Tank" do
    visit tanks_url
    click_on "New Tank"

    fill_in "Depopulation Date", with: @tank.depopulation_date
    fill_in "Final Quantity", with: @tank.final_quantity
    fill_in "Initial Quantity", with: @tank.initial_quantity
    fill_in "Population Date", with: @tank.population_date
    fill_in "Specie", with: @tank.specie_id
    fill_in "User", with: @tank.user_id
    click_on "Create Tank"

    assert_text "Tank was successfully created"
    click_on "Back"
  end

  test "updating a Tank" do
    visit tanks_url
    click_on "Edit", match: :first

    fill_in "Depopulation Date", with: @tank.depopulation_date
    fill_in "Final Quantity", with: @tank.final_quantity
    fill_in "Initial Quantity", with: @tank.initial_quantity
    fill_in "Population Date", with: @tank.population_date
    fill_in "Specie", with: @tank.specie_id
    fill_in "User", with: @tank.user_id
    click_on "Update Tank"

    assert_text "Tank was successfully updated"
    click_on "Back"
  end

  test "destroying a Tank" do
    visit tanks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Tank was successfully destroyed"
  end
end
