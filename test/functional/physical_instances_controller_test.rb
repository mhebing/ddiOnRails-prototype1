require 'test_helper'

class PhysicalInstancesControllerTest < ActionController::TestCase
  setup do
    @physical_instance = physical_instances(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:physical_instances)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create physical_instance" do
    assert_difference('PhysicalInstance.count') do
      post :create, physical_instance: { description: @physical_instance.description, filename: @physical_instance.filename, fingerprint: @physical_instance.fingerprint, format: @physical_instance.format, label: @physical_instance.label, name: @physical_instance.name, physical_data_product_id: @physical_instance.physical_data_product_id }
    end

    assert_redirected_to physical_instance_path(assigns(:physical_instance))
  end

  test "should show physical_instance" do
    get :show, id: @physical_instance
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @physical_instance
    assert_response :success
  end

  test "should update physical_instance" do
    put :update, id: @physical_instance, physical_instance: { description: @physical_instance.description, filename: @physical_instance.filename, fingerprint: @physical_instance.fingerprint, format: @physical_instance.format, label: @physical_instance.label, name: @physical_instance.name, physical_data_product_id: @physical_instance.physical_data_product_id }
    assert_redirected_to physical_instance_path(assigns(:physical_instance))
  end

  test "should destroy physical_instance" do
    assert_difference('PhysicalInstance.count', -1) do
      delete :destroy, id: @physical_instance
    end

    assert_redirected_to physical_instances_path
  end
end
