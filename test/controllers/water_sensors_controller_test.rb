require 'test_helper'

class WaterSensorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @water_sensor = water_sensors(:one)
  end

  test "should get index" do
    get water_sensors_url
    assert_response :success
  end

  test "should get new" do
    get new_water_sensor_url
    assert_response :success
  end

  test "should create water_sensor" do
    assert_difference('WaterSensor.count') do
      post water_sensors_url, params: { water_sensor: { acidity: @water_sensor.acidity, calcium: @water_sensor.calcium, hydrogen: @water_sensor.hydrogen, oxigen: @water_sensor.oxigen, ph: @water_sensor.ph, phosphoror: @water_sensor.phosphoror, tank_id: @water_sensor.tank_id } }
    end

    assert_redirected_to water_sensor_url(WaterSensor.last)
  end

  test "should show water_sensor" do
    get water_sensor_url(@water_sensor)
    assert_response :success
  end

  test "should get edit" do
    get edit_water_sensor_url(@water_sensor)
    assert_response :success
  end

  test "should update water_sensor" do
    patch water_sensor_url(@water_sensor), params: { water_sensor: { acidity: @water_sensor.acidity, calcium: @water_sensor.calcium, hydrogen: @water_sensor.hydrogen, oxigen: @water_sensor.oxigen, ph: @water_sensor.ph, phosphoror: @water_sensor.phosphoror, tank_id: @water_sensor.tank_id } }
    assert_redirected_to water_sensor_url(@water_sensor)
  end

  test "should destroy water_sensor" do
    assert_difference('WaterSensor.count', -1) do
      delete water_sensor_url(@water_sensor)
    end

    assert_redirected_to water_sensors_url
  end
end
