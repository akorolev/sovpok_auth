require 'test_helper'

class LotsControllerTest < ActionController::TestCase
  setup do
    @lot = lots(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:lots)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create lot" do
    assert_difference('Lot.count') do
      post :create, lot: { category_id: @lot.category_id, description: @lot.description, end_date: @lot.end_date, fee: @lot.fee, keywords: @lot.keywords, min_order: @lot.min_order, pickup_allowed: @lot.pickup_allowed, pickup_description: @lot.pickup_description, postage_info1: @lot.postage_info1, postage_info2: @lot.postage_info2, postage_info3: @lot.postage_info3, postage_val1: @lot.postage_val1, postage_val2: @lot.postage_val2, postage_val3: @lot.postage_val3, prepay: @lot.prepay, serial: @lot.serial, source: @lot.source, status: @lot.status, title: @lot.title, user_id: @lot.user_id }
    end

    assert_redirected_to lot_path(assigns(:lot))
  end

  test "should show lot" do
    get :show, id: @lot
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @lot
    assert_response :success
  end

  test "should update lot" do
    patch :update, id: @lot, lot: { category_id: @lot.category_id, description: @lot.description, end_date: @lot.end_date, fee: @lot.fee, keywords: @lot.keywords, min_order: @lot.min_order, pickup_allowed: @lot.pickup_allowed, pickup_description: @lot.pickup_description, postage_info1: @lot.postage_info1, postage_info2: @lot.postage_info2, postage_info3: @lot.postage_info3, postage_val1: @lot.postage_val1, postage_val2: @lot.postage_val2, postage_val3: @lot.postage_val3, prepay: @lot.prepay, serial: @lot.serial, source: @lot.source, status: @lot.status, title: @lot.title, user_id: @lot.user_id }
    assert_redirected_to lot_path(assigns(:lot))
  end

  test "should destroy lot" do
    assert_difference('Lot.count', -1) do
      delete :destroy, id: @lot
    end

    assert_redirected_to lots_path
  end
end
