require "application_system_test_case"

class FoodSpeciesTest < ApplicationSystemTestCase
  setup do
    @food_specy = food_species(:one)
  end

  test "visiting the index" do
    visit food_species_url
    assert_selector "h1", text: "Food Species"
  end

  test "creating a Food specie" do
    visit food_species_url
    click_on "New Food Specie"

    fill_in "Food", with: @food_specy.food_id
    fill_in "Food Quantity", with: @food_specy.food_quantity
    click_on "Create Food specie"

    assert_text "Food specie was successfully created"
    click_on "Back"
  end

  test "updating a Food specie" do
    visit food_species_url
    click_on "Edit", match: :first

    fill_in "Food", with: @food_specy.food_id
    fill_in "Food Quantity", with: @food_specy.food_quantity
    click_on "Update Food specie"

    assert_text "Food specie was successfully updated"
    click_on "Back"
  end

  test "destroying a Food specie" do
    visit food_species_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Food specie was successfully destroyed"
  end
end
