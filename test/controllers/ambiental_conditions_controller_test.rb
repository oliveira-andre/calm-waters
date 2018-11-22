require 'test_helper'

class AmbientalConditionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ambiental_condition = ambiental_conditions(:one)
  end

  test "should get index" do
    get ambiental_conditions_url
    assert_response :success
  end

  test "should get new" do
    get new_ambiental_condition_url
    assert_response :success
  end

  test "should create ambiental_condition" do
    assert_difference('AmbientalCondition.count') do
      post ambiental_conditions_url, params: { ambiental_condition: { ideal_acidity: @ambiental_condition.ideal_acidity, ideal_ammonia: @ambiental_condition.ideal_ammonia, ideal_oxigen: @ambiental_condition.ideal_oxigen, ideal_ph: @ambiental_condition.ideal_ph, ideal_temperature: @ambiental_condition.ideal_temperature } }
    end

    assert_redirected_to ambiental_condition_url(AmbientalCondition.last)
  end

  test "should show ambiental_condition" do
    get ambiental_condition_url(@ambiental_condition)
    assert_response :success
  end

  test "should get edit" do
    get edit_ambiental_condition_url(@ambiental_condition)
    assert_response :success
  end

  test "should update ambiental_condition" do
    patch ambiental_condition_url(@ambiental_condition), params: { ambiental_condition: { ideal_acidity: @ambiental_condition.ideal_acidity, ideal_ammonia: @ambiental_condition.ideal_ammonia, ideal_oxigen: @ambiental_condition.ideal_oxigen, ideal_ph: @ambiental_condition.ideal_ph, ideal_temperature: @ambiental_condition.ideal_temperature } }
    assert_redirected_to ambiental_condition_url(@ambiental_condition)
  end

  test "should destroy ambiental_condition" do
    assert_difference('AmbientalCondition.count', -1) do
      delete ambiental_condition_url(@ambiental_condition)
    end

    assert_redirected_to ambiental_conditions_url
  end
end
