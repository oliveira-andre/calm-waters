require "application_system_test_case"

class SoloSensorsTest < ApplicationSystemTestCase
  setup do
    @solo_sensor = solo_sensors(:one)
  end

  test "visiting the index" do
    visit solo_sensors_url
    assert_selector "h1", text: "Solo Sensors"
  end

  test "creating a Solo sensor" do
    visit solo_sensors_url
    click_on "New Solo Sensor"

    fill_in "Calcium", with: @solo_sensor.calcium
    fill_in "Carbon", with: @solo_sensor.carbon
    fill_in "Ph", with: @solo_sensor.ph
    fill_in "Phosphoror", with: @solo_sensor.phosphoror
    fill_in "Tank", with: @solo_sensor.tank_id
    click_on "Create Solo sensor"

    assert_text "Solo sensor was successfully created"
    click_on "Back"
  end

  test "updating a Solo sensor" do
    visit solo_sensors_url
    click_on "Edit", match: :first

    fill_in "Calcium", with: @solo_sensor.calcium
    fill_in "Carbon", with: @solo_sensor.carbon
    fill_in "Ph", with: @solo_sensor.ph
    fill_in "Phosphoror", with: @solo_sensor.phosphoror
    fill_in "Tank", with: @solo_sensor.tank_id
    click_on "Update Solo sensor"

    assert_text "Solo sensor was successfully updated"
    click_on "Back"
  end

  test "destroying a Solo sensor" do
    visit solo_sensors_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Solo sensor was successfully destroyed"
  end
end
