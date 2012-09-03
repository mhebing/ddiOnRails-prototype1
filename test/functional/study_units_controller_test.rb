require 'test_helper'

class StudyUnitsControllerTest < ActionController::TestCase
  setup do
    @study_unit = study_units(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:study_units)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create study_unit" do
    assert_difference('StudyUnit.count') do
      post :create, study_unit: { abstract: @study_unit.abstract, label: @study_unit.label, name: @study_unit.name, study_id: @study_unit.study_id }
    end

    assert_redirected_to study_unit_path(assigns(:study_unit))
  end

  test "should show study_unit" do
    get :show, id: @study_unit
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @study_unit
    assert_response :success
  end

  test "should update study_unit" do
    put :update, id: @study_unit, study_unit: { abstract: @study_unit.abstract, label: @study_unit.label, name: @study_unit.name, study_id: @study_unit.study_id }
    assert_redirected_to study_unit_path(assigns(:study_unit))
  end

  test "should destroy study_unit" do
    assert_difference('StudyUnit.count', -1) do
      delete :destroy, id: @study_unit
    end

    assert_redirected_to study_units_path
  end
end
