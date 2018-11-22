require 'test_helper'

class SoloSensorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @solo_sensor = solo_sensors(:one)
  end

  test "should get index" do
    get solo_sensors_url
    assert_response :success
  end

  test "should get new" do
    get new_solo_sensor_url
    assert_response :success
  end

  test "should create solo_sensor" do
    assert_difference('SoloSensor.count') do
      post solo_sensors_url, params: { solo_sensor: { calcium: @solo_sensor.calcium, carbon: @solo_sensor.carbon, ph: @solo_sensor.ph, phosphoror: @solo_sensor.phosphoror, tank_id: @solo_sensor.tank_id } }
    end

    assert_redirected_to solo_sensor_url(SoloSensor.last)
  end

  test "should show solo_sensor" do
    get solo_sensor_url(@solo_sensor)
    assert_response :success
  end

  test "should get edit" do
    get edit_solo_sensor_url(@solo_sensor)
    assert_response :success
  end

  test "should update solo_sensor" do
    patch solo_sensor_url(@solo_sensor), params: { solo_sensor: { calcium: @solo_sensor.calcium, carbon: @solo_sensor.carbon, ph: @solo_sensor.ph, phosphoror: @solo_sensor.phosphoror, tank_id: @solo_sensor.tank_id } }
    assert_redirected_to solo_sensor_url(@solo_sensor)
  end

  test "should destroy solo_sensor" do
    assert_difference('SoloSensor.count', -1) do
      delete solo_sensor_url(@solo_sensor)
    end

    assert_redirected_to solo_sensors_url
  end
end
