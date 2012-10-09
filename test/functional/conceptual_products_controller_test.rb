require 'test_helper'

class ConceptualProductsControllerTest < ActionController::TestCase
  setup do
    @conceptual_product = conceptual_products(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:conceptual_products)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create conceptual_product" do
    assert_difference('ConceptualProduct.count') do
      post :create, conceptual_product: { abstract: @conceptual_product.abstract, label: @conceptual_product.label, name: @conceptual_product.name }
    end

    assert_redirected_to conceptual_product_path(assigns(:conceptual_product))
  end

  test "should show conceptual_product" do
    get :show, id: @conceptual_product
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @conceptual_product
    assert_response :success
  end

  test "should update conceptual_product" do
    put :update, id: @conceptual_product, conceptual_product: { abstract: @conceptual_product.abstract, label: @conceptual_product.label, name: @conceptual_product.name }
    assert_redirected_to conceptual_product_path(assigns(:conceptual_product))
  end

  test "should destroy conceptual_product" do
    assert_difference('ConceptualProduct.count', -1) do
      delete :destroy, id: @conceptual_product
    end

    assert_redirected_to conceptual_products_path
  end
end
