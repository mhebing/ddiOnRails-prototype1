require 'test_helper'

class VariableStatisticsControllerTest < ActionController::TestCase
  setup do
    @variable_statistic = variable_statistics(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:variable_statistics)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create variable_statistic" do
    assert_difference('VariableStatistic.count') do
      post :create, variable_statistic: { invalid: @variable_statistic.invalid, max: @variable_statistic.max, mean: @variable_statistic.mean, min: @variable_statistic.min, valid: @variable_statistic.valid, variable_id: @variable_statistic.variable_id }
    end

    assert_redirected_to variable_statistic_path(assigns(:variable_statistic))
  end

  test "should show variable_statistic" do
    get :show, id: @variable_statistic
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @variable_statistic
    assert_response :success
  end

  test "should update variable_statistic" do
    put :update, id: @variable_statistic, variable_statistic: { invalid: @variable_statistic.invalid, max: @variable_statistic.max, mean: @variable_statistic.mean, min: @variable_statistic.min, valid: @variable_statistic.valid, variable_id: @variable_statistic.variable_id }
    assert_redirected_to variable_statistic_path(assigns(:variable_statistic))
  end

  test "should destroy variable_statistic" do
    assert_difference('VariableStatistic.count', -1) do
      delete :destroy, id: @variable_statistic
    end

    assert_redirected_to variable_statistics_path
  end
end
