require 'test_helper'

class MonitoringHistoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @monitoring_history = monitoring_histories(:one)
  end

  test "should get index" do
    get monitoring_histories_url
    assert_response :success
  end

  test "should get new" do
    get new_monitoring_history_url
    assert_response :success
  end

  test "should create monitoring_history" do
    assert_difference('MonitoringHistory.count') do
      post monitoring_histories_url, params: { monitoring_history: { disease: @monitoring_history.disease, liming: @monitoring_history.liming, monitoring_date: @monitoring_history.monitoring_date, oxigen: @monitoring_history.oxigen, ph: @monitoring_history.ph, procedimentos: @monitoring_history.procedimentos, quantitiy_food_daily: @monitoring_history.quantitiy_food_daily, quantity_fetilizing: @monitoring_history.quantity_fetilizing, tank_id: @monitoring_history.tank_id } }
    end

    assert_redirected_to monitoring_history_url(MonitoringHistory.last)
  end

  test "should show monitoring_history" do
    get monitoring_history_url(@monitoring_history)
    assert_response :success
  end

  test "should get edit" do
    get edit_monitoring_history_url(@monitoring_history)
    assert_response :success
  end

  test "should update monitoring_history" do
    patch monitoring_history_url(@monitoring_history), params: { monitoring_history: { disease: @monitoring_history.disease, liming: @monitoring_history.liming, monitoring_date: @monitoring_history.monitoring_date, oxigen: @monitoring_history.oxigen, ph: @monitoring_history.ph, procedimentos: @monitoring_history.procedimentos, quantitiy_food_daily: @monitoring_history.quantitiy_food_daily, quantity_fetilizing: @monitoring_history.quantity_fetilizing, tank_id: @monitoring_history.tank_id } }
    assert_redirected_to monitoring_history_url(@monitoring_history)
  end

  test "should destroy monitoring_history" do
    assert_difference('MonitoringHistory.count', -1) do
      delete monitoring_history_url(@monitoring_history)
    end

    assert_redirected_to monitoring_histories_url
  end
end
