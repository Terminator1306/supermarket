require 'test_helper'

class ShoppinglistsControllerTest < ActionController::TestCase
  setup do
    @shoppinglist = shoppinglists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:shoppinglists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create shoppinglist" do
    assert_difference('Shoppinglist.count') do
      post :create, shoppinglist: { manipulator_type: @shoppinglist.manipulator_type, time: @shoppinglist.time, total: @shoppinglist.total }
    end

    assert_redirected_to shoppinglist_path(assigns(:shoppinglist))
  end

  test "should show shoppinglist" do
    get :show, id: @shoppinglist
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @shoppinglist
    assert_response :success
  end

  test "should update shoppinglist" do
    patch :update, id: @shoppinglist, shoppinglist: { manipulator_type: @shoppinglist.manipulator_type, time: @shoppinglist.time, total: @shoppinglist.total }
    assert_redirected_to shoppinglist_path(assigns(:shoppinglist))
  end

  test "should destroy shoppinglist" do
    assert_difference('Shoppinglist.count', -1) do
      delete :destroy, id: @shoppinglist
    end

    assert_redirected_to shoppinglists_path
  end
end
