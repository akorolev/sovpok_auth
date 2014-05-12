require 'test_helper'

class ProductsControllerTest < ActionController::TestCase
  setup do
    @product = products(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:products)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product" do
    assert_difference('Product.count') do
      post :create, product: { category_id: @product.category_id, description: @product.description, lot_id: @product.lot_id, pickup_allowed: @product.pickup_allowed, pickup_description: @product.pickup_description, postage_info1: @product.postage_info1, postage_info2: @product.postage_info2, postage_info3: @product.postage_info3, postage_val1: @product.postage_val1, postage_val1: @product.postage_val1, postage_val2: @product.postage_val2, postage_val2: @product.postage_val2, postage_val3: @product.postage_val3, postage_val3: @product.postage_val3, price: @product.price, price: @product.price, title: @product.title, user_id: @product.user_id }
    end

    assert_redirected_to product_path(assigns(:product))
  end

  test "should show product" do
    get :show, id: @product
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @product
    assert_response :success
  end

  test "should update product" do
    patch :update, id: @product, product: { category_id: @product.category_id, description: @product.description, lot_id: @product.lot_id, pickup_allowed: @product.pickup_allowed, pickup_description: @product.pickup_description, postage_info1: @product.postage_info1, postage_info2: @product.postage_info2, postage_info3: @product.postage_info3, postage_val1: @product.postage_val1, postage_val1: @product.postage_val1, postage_val2: @product.postage_val2, postage_val2: @product.postage_val2, postage_val3: @product.postage_val3, postage_val3: @product.postage_val3, price: @product.price, price: @product.price, title: @product.title, user_id: @product.user_id }
    assert_redirected_to product_path(assigns(:product))
  end

  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete :destroy, id: @product
    end

    assert_redirected_to products_path
  end
end
