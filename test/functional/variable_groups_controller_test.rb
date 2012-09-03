require 'test_helper'

class VariableGroupsControllerTest < ActionController::TestCase
  setup do
    @variable_group = variable_groups(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:variable_groups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create variable_group" do
    assert_difference('VariableGroup.count') do
      post :create, variable_group: { concept_id: @variable_group.concept_id, label: @variable_group.label, logical_product_id: @variable_group.logical_product_id, name: @variable_group.name, question_id: @variable_group.question_id }
    end

    assert_redirected_to variable_group_path(assigns(:variable_group))
  end

  test "should show variable_group" do
    get :show, id: @variable_group
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @variable_group
    assert_response :success
  end

  test "should update variable_group" do
    put :update, id: @variable_group, variable_group: { concept_id: @variable_group.concept_id, label: @variable_group.label, logical_product_id: @variable_group.logical_product_id, name: @variable_group.name, question_id: @variable_group.question_id }
    assert_redirected_to variable_group_path(assigns(:variable_group))
  end

  test "should destroy variable_group" do
    assert_difference('VariableGroup.count', -1) do
      delete :destroy, id: @variable_group
    end

    assert_redirected_to variable_groups_path
  end
end
