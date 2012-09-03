require 'test_helper'

class LogicalProductsControllerTest < ActionController::TestCase
  setup do
    @logical_product = logical_products(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:logical_products)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create logical_product" do
    assert_difference('LogicalProduct.count') do
      post :create, logical_product: { abstract: @logical_product.abstract, label: @logical_product.label, name: @logical_product.name, study_unit_id: @logical_product.study_unit_id }
    end

    assert_redirected_to logical_product_path(assigns(:logical_product))
  end

  test "should show logical_product" do
    get :show, id: @logical_product
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @logical_product
    assert_response :success
  end

  test "should update logical_product" do
    put :update, id: @logical_product, logical_product: { abstract: @logical_product.abstract, label: @logical_product.label, name: @logical_product.name, study_unit_id: @logical_product.study_unit_id }
    assert_redirected_to logical_product_path(assigns(:logical_product))
  end

  test "should destroy logical_product" do
    assert_difference('LogicalProduct.count', -1) do
      delete :destroy, id: @logical_product
    end

    assert_redirected_to logical_products_path
  end
end
