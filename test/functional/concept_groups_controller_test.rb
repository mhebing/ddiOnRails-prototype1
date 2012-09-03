require 'test_helper'

class ConceptGroupsControllerTest < ActionController::TestCase
  setup do
    @concept_group = concept_groups(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:concept_groups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create concept_group" do
    assert_difference('ConceptGroup.count') do
      post :create, concept_group: { abstract: @concept_group.abstract, label: @concept_group.label, name: @concept_group.name }
    end

    assert_redirected_to concept_group_path(assigns(:concept_group))
  end

  test "should show concept_group" do
    get :show, id: @concept_group
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @concept_group
    assert_response :success
  end

  test "should update concept_group" do
    put :update, id: @concept_group, concept_group: { abstract: @concept_group.abstract, label: @concept_group.label, name: @concept_group.name }
    assert_redirected_to concept_group_path(assigns(:concept_group))
  end

  test "should destroy concept_group" do
    assert_difference('ConceptGroup.count', -1) do
      delete :destroy, id: @concept_group
    end

    assert_redirected_to concept_groups_path
  end
end
