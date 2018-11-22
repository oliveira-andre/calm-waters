require "application_system_test_case"

class WaterSensorsTest < ApplicationSystemTestCase
  setup do
    @water_sensor = water_sensors(:one)
  end

  test "visiting the index" do
    visit water_sensors_url
    assert_selector "h1", text: "Water Sensors"
  end

  test "creating a Water sensor" do
    visit water_sensors_url
    click_on "New Water Sensor"

    fill_in "Acidity", with: @water_sensor.acidity
    fill_in "Calcium", with: @water_sensor.calcium
    fill_in "Hydrogen", with: @water_sensor.hydrogen
    fill_in "Oxigen", with: @water_sensor.oxigen
    fill_in "Ph", with: @water_sensor.ph
    fill_in "Phosphoror", with: @water_sensor.phosphoror
    fill_in "Tank", with: @water_sensor.tank_id
    click_on "Create Water sensor"

    assert_text "Water sensor was successfully created"
    click_on "Back"
  end

  test "updating a Water sensor" do
    visit water_sensors_url
    click_on "Edit", match: :first

    fill_in "Acidity", with: @water_sensor.acidity
    fill_in "Calcium", with: @water_sensor.calcium
    fill_in "Hydrogen", with: @water_sensor.hydrogen
    fill_in "Oxigen", with: @water_sensor.oxigen
    fill_in "Ph", with: @water_sensor.ph
    fill_in "Phosphoror", with: @water_sensor.phosphoror
    fill_in "Tank", with: @water_sensor.tank_id
    click_on "Update Water sensor"

    assert_text "Water sensor was successfully updated"
    click_on "Back"
  end

  test "destroying a Water sensor" do
    visit water_sensors_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Water sensor was successfully destroyed"
  end
end
