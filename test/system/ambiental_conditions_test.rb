require "application_system_test_case"

class AmbientalConditionsTest < ApplicationSystemTestCase
  setup do
    @ambiental_condition = ambiental_conditions(:one)
  end

  test "visiting the index" do
    visit ambiental_conditions_url
    assert_selector "h1", text: "Ambiental Conditions"
  end

  test "creating a Ambiental condition" do
    visit ambiental_conditions_url
    click_on "New Ambiental Condition"

    fill_in "Ideal Acidity", with: @ambiental_condition.ideal_acidity
    fill_in "Ideal Ammonia", with: @ambiental_condition.ideal_ammonia
    fill_in "Ideal Oxigen", with: @ambiental_condition.ideal_oxigen
    fill_in "Ideal Ph", with: @ambiental_condition.ideal_ph
    fill_in "Ideal Temperature", with: @ambiental_condition.ideal_temperature
    click_on "Create Ambiental condition"

    assert_text "Ambiental condition was successfully created"
    click_on "Back"
  end

  test "updating a Ambiental condition" do
    visit ambiental_conditions_url
    click_on "Edit", match: :first

    fill_in "Ideal Acidity", with: @ambiental_condition.ideal_acidity
    fill_in "Ideal Ammonia", with: @ambiental_condition.ideal_ammonia
    fill_in "Ideal Oxigen", with: @ambiental_condition.ideal_oxigen
    fill_in "Ideal Ph", with: @ambiental_condition.ideal_ph
    fill_in "Ideal Temperature", with: @ambiental_condition.ideal_temperature
    click_on "Update Ambiental condition"

    assert_text "Ambiental condition was successfully updated"
    click_on "Back"
  end

  test "destroying a Ambiental condition" do
    visit ambiental_conditions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Ambiental condition was successfully destroyed"
  end
end
