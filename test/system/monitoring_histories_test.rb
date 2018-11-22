require "application_system_test_case"

class MonitoringHistoriesTest < ApplicationSystemTestCase
  setup do
    @monitoring_history = monitoring_histories(:one)
  end

  test "visiting the index" do
    visit monitoring_histories_url
    assert_selector "h1", text: "Monitoring Histories"
  end

  test "creating a Monitoring history" do
    visit monitoring_histories_url
    click_on "New Monitoring History"

    fill_in "Disease", with: @monitoring_history.disease
    fill_in "Liming", with: @monitoring_history.liming
    fill_in "Monitoring Date", with: @monitoring_history.monitoring_date
    fill_in "Oxigen", with: @monitoring_history.oxigen
    fill_in "Ph", with: @monitoring_history.ph
    fill_in "Procedimentos", with: @monitoring_history.procedimentos
    fill_in "Quantitiy Food Daily", with: @monitoring_history.quantitiy_food_daily
    fill_in "Quantity Fetilizing", with: @monitoring_history.quantity_fetilizing
    fill_in "Tank", with: @monitoring_history.tank_id
    click_on "Create Monitoring history"

    assert_text "Monitoring history was successfully created"
    click_on "Back"
  end

  test "updating a Monitoring history" do
    visit monitoring_histories_url
    click_on "Edit", match: :first

    fill_in "Disease", with: @monitoring_history.disease
    fill_in "Liming", with: @monitoring_history.liming
    fill_in "Monitoring Date", with: @monitoring_history.monitoring_date
    fill_in "Oxigen", with: @monitoring_history.oxigen
    fill_in "Ph", with: @monitoring_history.ph
    fill_in "Procedimentos", with: @monitoring_history.procedimentos
    fill_in "Quantitiy Food Daily", with: @monitoring_history.quantitiy_food_daily
    fill_in "Quantity Fetilizing", with: @monitoring_history.quantity_fetilizing
    fill_in "Tank", with: @monitoring_history.tank_id
    click_on "Update Monitoring history"

    assert_text "Monitoring history was successfully updated"
    click_on "Back"
  end

  test "destroying a Monitoring history" do
    visit monitoring_histories_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Monitoring history was successfully destroyed"
  end
end
