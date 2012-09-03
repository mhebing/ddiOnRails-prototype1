require 'test_helper'

class PhysicalDataProductsControllerTest < ActionController::TestCase
  setup do
    @physical_data_product = physical_data_products(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:physical_data_products)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create physical_data_product" do
    assert_difference('PhysicalDataProduct.count') do
      post :create, physical_data_product: { group_id: @physical_data_product.group_id, label: @physical_data_product.label, logical_product_id: @physical_data_product.logical_product_id, name: @physical_data_product.name }
    end

    assert_redirected_to physical_data_product_path(assigns(:physical_data_product))
  end

  test "should show physical_data_product" do
    get :show, id: @physical_data_product
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @physical_data_product
    assert_response :success
  end

  test "should update physical_data_product" do
    put :update, id: @physical_data_product, physical_data_product: { group_id: @physical_data_product.group_id, label: @physical_data_product.label, logical_product_id: @physical_data_product.logical_product_id, name: @physical_data_product.name }
    assert_redirected_to physical_data_product_path(assigns(:physical_data_product))
  end

  test "should destroy physical_data_product" do
    assert_difference('PhysicalDataProduct.count', -1) do
      delete :destroy, id: @physical_data_product
    end

    assert_redirected_to physical_data_products_path
  end
end
