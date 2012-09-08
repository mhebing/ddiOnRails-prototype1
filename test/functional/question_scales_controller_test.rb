require 'test_helper'

class QuestionScalesControllerTest < ActionController::TestCase
  setup do
    @question_scale = question_scales(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:question_scales)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create question_scale" do
    assert_difference('QuestionScale.count') do
      post :create, question_scale: { label: @question_scale.label, question_id: @question_scale.question_id, value: @question_scale.value }
    end

    assert_redirected_to question_scale_path(assigns(:question_scale))
  end

  test "should show question_scale" do
    get :show, id: @question_scale
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @question_scale
    assert_response :success
  end

  test "should update question_scale" do
    put :update, id: @question_scale, question_scale: { label: @question_scale.label, question_id: @question_scale.question_id, value: @question_scale.value }
    assert_redirected_to question_scale_path(assigns(:question_scale))
  end

  test "should destroy question_scale" do
    assert_difference('QuestionScale.count', -1) do
      delete :destroy, id: @question_scale
    end

    assert_redirected_to question_scales_path
  end
end
