require 'test_helper'

class FoodSpeciesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @food_specy = food_species(:one)
  end

  test "should get index" do
    get food_species_url
    assert_response :success
  end

  test "should get new" do
    get new_food_specy_url
    assert_response :success
  end

  test "should create food_specy" do
    assert_difference('FoodSpecie.count') do
      post food_species_url, params: { food_specy: { food_id: @food_specy.food_id, food_quantity: @food_specy.food_quantity } }
    end

    assert_redirected_to food_specy_url(FoodSpecie.last)
  end

  test "should show food_specy" do
    get food_specy_url(@food_specy)
    assert_response :success
  end

  test "should get edit" do
    get edit_food_specy_url(@food_specy)
    assert_response :success
  end

  test "should update food_specy" do
    patch food_specy_url(@food_specy), params: { food_specy: { food_id: @food_specy.food_id, food_quantity: @food_specy.food_quantity } }
    assert_redirected_to food_specy_url(@food_specy)
  end

  test "should destroy food_specy" do
    assert_difference('FoodSpecie.count', -1) do
      delete food_specy_url(@food_specy)
    end

    assert_redirected_to food_species_url
  end
end
