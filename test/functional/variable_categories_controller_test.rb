require 'test_helper'

class VariableCategoriesControllerTest < ActionController::TestCase
  setup do
    @variable_category = variable_categories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:variable_categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create variable_category" do
    assert_difference('VariableCategory.count') do
      post :create, variable_category: { frequency: @variable_category.frequency, label: @variable_category.label, value: @variable_category.value, variable_id: @variable_category.variable_id }
    end

    assert_redirected_to variable_category_path(assigns(:variable_category))
  end

  test "should show variable_category" do
    get :show, id: @variable_category
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @variable_category
    assert_response :success
  end

  test "should update variable_category" do
    put :update, id: @variable_category, variable_category: { frequency: @variable_category.frequency, label: @variable_category.label, value: @variable_category.value, variable_id: @variable_category.variable_id }
    assert_redirected_to variable_category_path(assigns(:variable_category))
  end

  test "should destroy variable_category" do
    assert_difference('VariableCategory.count', -1) do
      delete :destroy, id: @variable_category
    end

    assert_redirected_to variable_categories_path
  end
end
